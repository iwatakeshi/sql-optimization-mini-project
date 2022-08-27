SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name FROM Student WHERE id IN (SELECT studId FROM Transcript WHERE crsCode = @v4);

-- SOLUTION --

CREATE INDEX Transcript_crsCode_IDX 
USING BTREE ON springboardopt.Transcript (crsCode);

EXPLAIN SELECT name 
FROM Student s
JOIN (
SELECT studId 
FROM Transcript 
WHERE crsCode = @v4
) t on s.id = t.studId

/*
At first glance after running select with explain it looks like Transcript 
table does not have an index on crsCode column so the first idea is to create that index.

The second optimization swaps out the WHERE IN statement and replaces it with a join.  Using IN
can cause table scans so this approach limits how many steps are in the exlain statement
*/