USE springboardopt;


SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 1. List the name of the student with id equal to v1 (id).
SELECT name FROM Student WHERE id = @v1;



-- SOLUTION --

ALTER TABLE springboardopt.Student 
ADD CONSTRAINT pk_student PRIMARY KEY(id);

/*
By adjusting the primary key on Student table to use the column id the query performance 
improves.  Before making optimization the explain statement showed the type of 
operation was all and often the way to improve is to find filter predicates to 
build indicies around.  Since the filter predicate does lookups on student id 
and the student id table did not currently have PK a PK was build on id column.

[view notes](https://www.notion.so/bfmcneill/03-sql-optimizer-409b7a9f791646009e4dc3ecd7d1c299#66e91b536b7a44d6bcad10283022d438)
*/