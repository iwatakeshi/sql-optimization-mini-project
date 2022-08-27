
USE springboardopt;

 
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
SELECT name FROM Student,
	(SELECT studId
	FROM Transcript
		WHERE crsCode IN
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))
		GROUP BY studId
		HAVING COUNT(*) = 
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))) as alias
WHERE id = alias.studId;


-- SOLUTION --

explain select 
  s.name
from Transcript t 
join Student s on t.studId = s.id 
join Course c on t.crsCode  = c.crsCode and c.deptId = @v8
group by s.name 
HAVING COUNT(distinct t.crsCode) = (SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))

/*
This query started out with many sub queries.  A good first step is to try and replace the
sub queries with joins.  The refactor knocked 3 steps off the query `EXPLAIN`.
*/