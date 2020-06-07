CREATE TABLE COURSE (

CID integer not null,

CALLID varchar(7),

CNAME varchar(25),

CCREDIT integer,

PRIMARY KEY (CID)

);



CREATE TABLE TERM (

TERMID integer not null,

TDESC varchar(11),

STATUS1 varchar(6),

PRIMARY KEY (TERMID)

);



CREATE TABLE LOCATION (

LOCID integer not null,

BLDG_CODE varchar(3),

ROOM varchar(3),
CAPACITY integer,

PRIMARY KEY (LOCID)

);



CREATE TABLE FRANK (

FRANKID varchar(4) not null,

FRANKDESC varchar(15),

PRIMARY KEY (FRANKID)

);



CREATE TABLE FACULTY (

FID integer not null,

FLNAME varchar(15),

FFNAME varchar(15),

FMI varchar(1),

LOCID integer,

FPHONE varchar(14),

FRANKID varchar(4),

FPIN integer,

FACULTYIMAGE varchar(15),

PRIMARY KEY (FID),

FOREIGN KEY (LOCID) REFERENCES LOCATION(LOCID) ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (FRANKID) REFERENCES FRANK(FRANKID) ON UPDATE CASCADE ON DELETE CASCADE

);



CREATE TABLE COURSE_SECTION (

CSECID integer not null,

CID integer,
TERMID integer,

SECNUM integer,

FID integer,

DAYRANGE varchar(5),

TIMEPERIOD time,

LOCID integer,

MAXENRL integer,

CURRENRL integer,

PRIMARY KEY (CSECID), 

FOREIGN KEY (CID) REFERENCES COURSE(CID) ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (TERMID) REFERENCES TERM(TERMID) ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (FID) REFERENCES FACULTY(FID) ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (LOCID) REFERENCES LOCATION(LOCID) ON UPDATE CASCADE ON DELETE CASCADE

);



CREATE TABLE STUDENT (

STUID integer not null,

SLNAME varchar(15),

SFNAME varchar(15),

SMI varchar(1),

SADD varchar(30),

SCITY varchar(30),

SSTATE varchar(2),

SZIP varchar(7),

SPHONE varchar(14),

SDOB date,
SCLASS varchar(2),

SPIN integer,

FID integer,

PRIMARY KEY (STUID),

FOREIGN KEY (FID) REFERENCES FACULTY(FID) ON UPDATE CASCADE ON DELETE CASCADE

);



CREATE TABLE GRADE_VALUE (

GRADE varchar(1) not null,

GVALUE integer,

PRIMARY KEY (GRADE)

);



CREATE TABLE ENROLLMENT (

STUID integer not null,

CSECID integer not null,

GRADE varchar(1),

PRIMARY KEY (STUID,CSECID),

FOREIGN KEY (STUID) REFERENCES STUDENT(STUID) ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (CSECID) REFERENCES COURSE_SECTION(CSECID) ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (GRADE) REFERENCES GRADE_VALUE(GRADE) ON UPDATE CASCADE ON DELETE CASCADE

);









INSERT INTO COURSE VALUES(1,'MIS 101','Intro. to Info. Systems',3);

INSERT INTO COURSE VALUES(2,'MIS 301','Systems Analysis',3);

INSERT INTO COURSE VALUES(3, 'MIS 441', 'Database Management', 3);

INSERT INTO COURSE VALUES(4, 'CS 155','Programming in C++',3);

INSERT INTO COURSE VALUES(5, 'MIS 451', 'Client/Server Systems',3);



INSERT INTO TERM VALUES(1,'Fall 2001','CLOSED');

INSERT INTO TERM VALUES(2,'Spring 2002','CLOSED');

INSERT INTO TERM VALUES(3,'Summer 2002','CLOSED');

INSERT INTO TERM VALUES(4,'Fall 2002','CLOSED');

INSERT INTO TERM VALUES(5,'Spring 2003','CLOSED');

INSERT INTO TERM VALUES(6,'Summer 2003','OPEN');



INSERT INTO LOCATION VALUES(1,'CR','101',150);

INSERT INTO LOCATION VALUES(2,'CR','202',40);

INSERT INTO LOCATION VALUES(3,'CR','103',35);

INSERT INTO LOCATION VALUES(4,'CR','105',35);

INSERT INTO LOCATION VALUES(5,'BUS','105',42);

INSERT INTO LOCATION VALUES(6,'BUS','404',35);

INSERT INTO LOCATION VALUES(7,'BUS','421',35);

INSERT INTO LOCATION VALUES(8,'BUS','211',55);

INSERT INTO LOCATION VALUES(9,'BUS','424',1);

INSERT INTO LOCATION VALUES(10,'BUS','402',1);

INSERT INTO LOCATION VALUES(11,'BUS','433',1);

INSERT INTO LOCATION VALUES(12,'LIB','217',2);

INSERT INTO LOCATION VALUES(13,'LIB','222',1);



INSERT INTO FRANK VALUES('ADJ','Adjunct');

INSERT INTO FRANK VALUES('ASSO','Associate');

INSERT INTO FRANK VALUES('ASST','Assistant');

INSERT INTO FRANK VALUES('FULL','Full');

INSERT INTO FRANK VALUES('INST','Instructor');



INSERT INTO FACULTY VALUES(1,'Cox','Kim','J',9,'(715) 555-1234','ASSO',1181,'cox.jpg');

INSERT INTO FACULTY VALUES(2,'Blanchard','John','R',10,'(715) 555-9087','FULL',1075,'blanchard.jpg');

INSERT INTO FACULTY VALUES(3,'Williams','Jerry','F',12,'(715) 555-5412','ASST',8531,'williams.jpg');

INSERT INTO FACULTY VALUES(4,'Sheng','Laura','M',11,'(715) 555-6409','INST',1690,'sheng.jpg');

INSERT INTO FACULTY VALUES(5,'Brown','Phillip','E',13,'(715) 555-6082','ASSO',9899,'brown.jpg');



INSERT INTO STUDENT VALUES(1,'Miller','Sarah','M','144 Windridge Bldg.','Eau Claire','WI','54703','(715) 555-9876', DATE'1980-7-14','SR',8891,1);

INSERT INTO STUDENT VALUES(2,'Umato','Brian','D','454 St. Johns LOCATION','Eau Claire','WI','54702','(715) 555-2345', DATE'1980-8-12','SR',1230,1);

INSERT INTO STUDENT VALUES(3,'Black','Daniel',NULL,'8921 Circle Drive','Bloomer','WI','54715','(715) 555-3907', DATE'1981-10-10','JR',1613,1);

INSERT INTO STUDENT VALUES(4,'Mobely','Amanda','J','1716 Summit St.','Eau Claire','WI','54703','(715) 555-6902', DATE'1982-9-24','SO',1841,2);

INSERT INTO STUDENT VALUES(5,'Sanchez','Ruben','R','1780 Samantha Court','Eau Claire','WI','54701','(715) 555-8899', DATE'1982-11-20','SO',4420,4);

INSERT INTO STUDENT VALUES(6,'Connoly','Michael','S','1818 Silver Street','Elk Mound','WI','54712','(715) 555-4944', DATE'1983-12-4','FR',9188,3);



INSERT INTO GRADE_VALUE VALUES('A',4);

INSERT INTO GRADE_VALUE VALUES('B',3);

INSERT INTO GRADE_VALUE VALUES('C',2);

INSERT INTO GRADE_VALUE VALUES('D',1);

INSERT INTO GRADE_VALUE VALUES('F',0);



INSERT INTO COURSE_SECTION VALUES(1,1,4,1,2,'MWF','10:00:00',1,140,135);

INSERT INTO COURSE_SECTION VALUES(2,1,4,2,3,'TTH','9:30:00',7,35,35);

INSERT INTO COURSE_SECTION VALUES(3,1,4,3,3,'M','18:00:00',2,35,32);

INSERT INTO COURSE_SECTION VALUES(4,2,4,1,4,'TTH','11:00:00',6,35,35);

INSERT INTO COURSE_SECTION VALUES(5,2,5,2,4,'TTH','14:00:00',6,35,35);

INSERT INTO COURSE_SECTION VALUES(6,3,5,1,1,'MWF','9:00:00',5,30,25);

INSERT INTO COURSE_SECTION VALUES(7,3,5,2,1,'MW','17:00:00',5,30,28);

INSERT INTO COURSE_SECTION VALUES(8,4,5,1,5,'TTH','8:00:00',3,35,10);

INSERT INTO COURSE_SECTION VALUES(9,5,5,1,2,'MWF','14:00:00',5,35,32);

INSERT INTO COURSE_SECTION VALUES(10,5,5,2,2,'TH','18:00:00',5,35,35);

INSERT INTO COURSE_SECTION VALUES(11,1,6,1,1,'M-F','8:00:00',1,50,35);

INSERT INTO COURSE_SECTION VALUES(12,2,6,1,NULL,'M-F','8:00:00',6,35,35);

INSERT INTO COURSE_SECTION VALUES(13,3,6,1,NULL,'M-F','9:00:00',5,35,29);



INSERT INTO ENROLLMENT VALUES(1,1,'A');

INSERT INTO ENROLLMENT VALUES(1,4,'A');

INSERT INTO ENROLLMENT VALUES(1,6,'B');

INSERT INTO ENROLLMENT VALUES(1,9,'B');

INSERT INTO ENROLLMENT VALUES(2,1,'C');

INSERT INTO ENROLLMENT VALUES(2,5,'B');

INSERT INTO ENROLLMENT VALUES(2,6,'A');

INSERT INTO ENROLLMENT VALUES(2,9,'B');

INSERT INTO ENROLLMENT VALUES(3,1,'C');

INSERT INTO ENROLLMENT VALUES(3,12,NULL);

INSERT INTO ENROLLMENT VALUES(3,13,NULL);

INSERT INTO ENROLLMENT VALUES(4,11,NULL);

INSERT INTO ENROLLMENT VALUES(4,12,NULL);

INSERT INTO ENROLLMENT VALUES(5,1,'B');

INSERT INTO ENROLLMENT VALUES(5,5,'C');

INSERT INTO ENROLLMENT VALUES(5,9,'C');

INSERT INTO ENROLLMENT VALUES(5,13,NULL);

INSERT INTO ENROLLMENT VALUES(6,11,NULL);

INSERT INTO ENROLLMENT VALUES(6,12,NULL);



