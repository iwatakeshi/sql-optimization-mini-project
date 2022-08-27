USE springboardopt;

SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 4. List the names of students who have taken a course taught by professor v5 (name).
EXPLAIN SELECT name FROM Student,
	(SELECT studId FROM Transcript,
		(SELECT crsCode, semester FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;


-- SOLUTION --

CREATE INDEX Professor_name_IDX 
USING BTREE ON springboardopt.Professor (name);

CREATE INDEX Teaching_semester_IDX 
USING BTREE ON springboardopt.Teaching (semester,crsCode);

CREATE INDEX Teaching_profId_IDX 
USING BTREE ON springboardopt.Teaching (profId);



/*
this query uses @v5 to filter professor by name and professor table is joined 
with teaching table using profId.  An index on Professor table using name will
help with that the professor by id lookup.  an index on the Teaching table using
profId column will help with the alias1 join.  The filter predicate in alias2 
requires a lookup on Transcript table using crscode and semester so an index on 
the Teaching table using semester, crsCode was built to improve that lookup.  With these changes
EXPLAIN estimates 4 operations with 1 row per each which is very efficient.
*/