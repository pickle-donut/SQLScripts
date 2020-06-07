CREATE TABLE branch (
  branchno char(5) NOT NULL,
  street varchar(35) DEFAULT NULL,
  city varchar(10) DEFAULT NULL,
  postcode varchar(10) DEFAULT NULL,
  PRIMARY KEY (branchno)
);

CREATE TABLE staff (
  staffno char(5) NOT NULL,
  fname varchar(10) DEFAULT NULL,
  lname varchar(10) DEFAULT NULL,
  position varchar(10) DEFAULT NULL,
  sex char(1) DEFAULT NULL,
  dob date DEFAULT NULL,
  salary smallint DEFAULT NULL,
  branchno char(5) DEFAULT NULL,
  PRIMARY KEY (staffno),
  FOREIGN KEY(BranchNo) REFERENCES Branch(BranchNo) ON DELETE CASCADE
);

CREATE TABLE privateowner (
  ownerno char(5) NOT NULL,
  fname varchar(10) DEFAULT NULL,
  lname varchar(10) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  telno char(15) DEFAULT NULL,
  email varchar(25) DEFAULT NULL,
  password varchar(12) DEFAULT NULL,
  PRIMARY KEY (ownerno)
);

CREATE TABLE propertyforrent (
  propertyno char(5) NOT NULL,
  street varchar(35) DEFAULT NULL,
  city varchar(10) DEFAULT NULL,
  postcode varchar(10) DEFAULT NULL,
  type varchar(10) DEFAULT NULL,
  rooms smallint DEFAULT NULL,
  rent int DEFAULT NULL,
  ownerno char(5) DEFAULT NULL,
  staffno char(5) DEFAULT NULL,
  branchno char(5) DEFAULT NULL,
  PRIMARY KEY (propertyno),
  FOREIGN KEY(StaffNo) REFERENCES staff(StaffNo),
  FOREIGN KEY(OwnerNo) REFERENCES PrivateOwner(OwnerNo) ON DELETE CASCADE,
  FOREIGN KEY(branchno) REFERENCES branch(branchno) ON DELETE CASCADE
);

CREATE TABLE client (
  clientno char(5) NOT NULL,
  fname varchar(10) DEFAULT NULL,
  lname varchar(10) DEFAULT NULL,
  telno char(15) DEFAULT NULL,
  preftype varchar(10) DEFAULT NULL,
  maxrent int DEFAULT NULL,
  eMail varchar(25) DEFAULT NULL,
  PRIMARY KEY (clientno)
);

CREATE TABLE registration (
  clientNo char(5) NOT NULL,
  branchNo char(5) NOT NULL,
  staffNo char(5) DEFAULT NULL,
  dateJoined date DEFAULT NULL,
  PRIMARY KEY (clientNo,branchNo),
  FOREIGN KEY(BranchNo) REFERENCES Branch(BranchNo) ON DELETE CASCADE,
  FOREIGN KEY(ClientNo) REFERENCES Client(ClientNo) ON DELETE CASCADE
) ;

CREATE TABLE viewing (
  clientno char(5) NOT NULL,
  propertyno char(5) NOT NULL,
  viewdate date DEFAULT NULL,
  comment1 varchar(15) DEFAULT NULL,
  PRIMARY KEY (clientno,propertyno),
  FOREIGN KEY(ClientNo) REFERENCES Client(ClientNo) ON DELETE CASCADE,
  FOREIGN KEY(PropertyNo) REFERENCES PropertyForRent(PropertyNo) ON DELETE CASCADE
  
);


INSERT INTO branch (branchno, street, city, postcode) VALUES
('B005', '22 Deer Rd', 'London', 'SW1 4EH');
INSERT INTO branch (branchno, street, city, postcode) VALUES
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU');
INSERT INTO branch (branchno, street, city, postcode) VALUES
('B003', '163 Main St', 'Glasgow', 'G11 9QX');
INSERT INTO branch (branchno, street, city, postcode) VALUES
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ');
INSERT INTO branch (branchno, street, city, postcode) VALUES
('B002', '56 Clover Dr', 'London', 'NW10 6EU');


INSERT INTO client (clientno, fname, lname, telno, preftype, maxrent, eMail) VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com');
INSERT INTO client (clientno, fname, lname, telno, preftype, maxrent, eMail) VALUES
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com');
INSERT INTO client (clientno, fname, lname, telno, preftype, maxrent, eMail) VALUES
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk');
INSERT INTO client (clientno, fname, lname, telno, preftype, maxrent, eMail) VALUES
('CR62', 'mary', 'tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.co.uk');


INSERT INTO privateowner (ownerno, fname, lname, address, telno, email, password) VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212', 'jkeogh@lhh.com', '********');
INSERT INTO privateowner (ownerno, fname, lname, address, telno, email, password) VALUES
('CO87', 'Carol', 'Ferrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419', 'cferrel@gmail.com', '********');
INSERT INTO privateowner (ownerno, fname, lname, address, telno, email, password) VALUES
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728', 'tinam@hotmail.com', '********');
INSERT INTO privateowner (ownerno, fname, lname, address, telno, email, password) VALUES
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0Q4', '0141-225-7025', 'tony.shaw@ark.com', '********');


INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1-Oct-1945', 30000, 'B005');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-Nov-1970', 12000, 'B003');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SG14', 'David', 'Ford', 'Supervisor', 'M', '24-Mar-1958', 18000, 'B003');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-Feb-1970', 9000, 'B007');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SG5', 'Susan', 'Brand', 'Manager', 'F', '3-Jun-1940', 24000, 'B003');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-Jun-1965', 9000, 'B005');


INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007');
INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PL94', '6 Argyll Street', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'B005');
INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PG4', '6 Lawrence Street', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003');
INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PG36', '2 Manor Road', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003');
INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PG21', '18 Dale Road', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003');
INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PG16', '5 Novar Drive', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

INSERT INTO viewing (clientno, propertyno, viewdate, comment1) VALUES
('CR56', 'PA14', '24-May-2013', 'too small');
INSERT INTO viewing (clientno, propertyno, viewdate, comment1) VALUES
('CR76', 'PG4', '20-Apr-2013', 'too remote');
INSERT INTO viewing (clientno, propertyno, viewdate, comment1) VALUES
('CR56', 'PG4', '26-May-2013', NULL);
INSERT INTO viewing (clientno, propertyno, viewdate, comment1) VALUES
('CR62', 'PA14', '14-may-2013', 'no dining room');
INSERT INTO viewing (clientno, propertyno, viewdate, comment1) VALUES
('CR56', 'PG36', '28-apr-2013', NULL);


INSERT INTO Registration (clientno, branchno, staffno, datejoined) VALUES
('CR76', 'B005', 'SL41', '2-Jan-2013');
INSERT INTO Registration (clientno, branchno, staffno, datejoined) VALUES
('CR56', 'B003', 'SG37', '11-Apr-2012');
INSERT INTO Registration (clientno, branchno, staffno, datejoined) VALUES
('CR74', 'B003', 'SG37', '16-Nov-2011');
INSERT INTO Registration (clientno, branchno, staffno, datejoined) VALUES
('CR62', 'B007', 'SA9', '3-Mar-2012');