--(1)
SELECT 
      CNAME
      , COUNT(*) AS ‘NumberOfCourses’
FROM course, course_section
WHERE course.CID = course_section.CID
GROUP BY CNAME; 

--(2)
SELECT 
      course_section.CSECID
      , course_section.LOCID
      , (CURRENRL/MAXENRL) AS ‘OccupancyRate’
FROM course_section;

--(3)
SELECT 
      location.LOCID
      , Avg(CURRENRL/CAPACITY) AS 'OccupancyRate'
FROM location, course_section
WHERE location.LOCID=course_section.LOCID
GROUP BY location.LOCID
ORDER BY Avg(CURRENRL/CAPACITY);


--(4)
(SELECT l.LOCID, Avg(CURRENRL/CAPACITY) AS 'AVG_OCCUPANCYRATE'

FROM location l LEFT JOIN course_section cs ON cs.LOCID=l.LOCID

WHERE l.LOCID NOT IN (SELECT f.LOCID
					  
		      FROM faculty f)
		
      AND CURRENRL IS NOT NULL

GROUP BY l.LOCID)
UNION

(SELECT l.LOCID, 0

FROM location l LEFT JOIN course_section cs ON cs.LOCID=l.LOCID

WHERE l.LOCID NOT IN (SELECT f.LOCID
					  
		      FROM faculty f)
		
      AND CURRENRL IS NULL
GROUP BY l.LOCID)

ORDER BY 'AVG_OCCUPANCYRATE'

--(5)
SELECT location.LOCID, CAPACITY, (SELECT AVG(CAPACITY) FROM location) AS 'Overall Average Capacity'

FROM location

WHERE CAPACITY > (SELECT AVG(CAPACITY) FROM location)
	  
      AND location.LOCID NOT IN (SELECT faculty.LOCID FROM faculty)

--(6)
SELECT faculty.FRANKID, COUNT(*) as 'NumberOfClasses'

FROM faculty, course_section

WHERE faculty.FID=course_section.FID

GROUP BY faculty.FRANKID

--(9)
CREATE TABLE GRADE_VALUE (

GRADE varchar(1) not null,

GVALUE integer,

PRIMARY KEY (GRADE)

);

INSERT INTO GRADE_VALUE VALUES('A',4);

INSERT INTO GRADE_VALUE VALUES('B',3);

INSERT INTO GRADE_VALUE VALUES('C',2);

INSERT INTO GRADE_VALUE VALUES('D',1);

INSERT INTO GRADE_VALUE VALUES('F',0);



