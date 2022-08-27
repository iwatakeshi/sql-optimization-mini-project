USE springboardopt;
 
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
EXPLAIN SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;

-- SOLUTION --

CREATE INDEX Course_deptId_IDX USING BTREE ON springboardopt.Course (deptId);
CREATE INDEX Course_crsCode_IDX USING BTREE ON springboardopt.Course (crsCode,deptId);
CREATE INDEX Transcript_studId_IDX USING BTREE ON springboardopt.Transcript (studId);
ALTER TABLE springboardopt.Transcript ADD CONSTRAINT Transcript_PK PRIMARY KEY (studId,crsCode,semester);

/*
At first glance of SELECT EXPLAIN there are 2 steps where type `ALL` is present 
and the key field on 2 records is null.  Looking at the SQL filter predicates it 
looks like course, transcript tables need in index.  since department id is 
being used to filter a single department id index can help with lookups.  
Student is is another field being used in filter predicate so an index on student
 table using column id will help with lookups.  It looks like transcript table 
 has a natural key student id, course code, semester.  By turning the natural 
 key into a primary key lookups will be more performant in the table due to 
 primary key's getting sorted.
*/