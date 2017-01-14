/*=========================================================================
===================== TEAM 11 DATABASE IMPLEMENTATION======================
=========================================================================*/
--creating group database
CREATE DATABASE TEAM_11_PRISON_DATABASE;
GO

USE TEAM_11_PRISON_DATABASE;

-- CREATING TABLES AND INSERTING VALUES

/* Create a table named Prisoners*/
CREATE TABLE Prisoners( 
[Prisoner ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[SSN] VARCHAR(15) NOT NULL,
[Unique ID] VARCHAR(15),
[First Name] VARCHAR(50) NOT NULL,
[Last Name] VARCHAR(50) NOT NULL,
MiddleName VARCHAR(50),
DateofBirth DATE ,
--Age is a computed column (based on DateofBirth)
Age as datediff(year,DateofBirth, GETDATE()));

/* Inserting data into Prisoners table*/
INSERT INTO Prisoners VALUES
('100-101-102',NULL,'Samuel', 'Dias',NULL, '01/02/1990'),
('100-101-103',NULL,'Sam', 'Dave','Rio', '01/05/1992'), 
('100-101-104',NULL,'Ryan', 'Gomes',NULL, '01/02/1966'),
('100-101-105',NULL,'Rahul', 'Roy',NULL, '01/02/1980'), 
('100-101-106',NULL,'Pablo', 'Roy',NULL, '01/02/1976'),  
('100-101-107',NULL,'Rick', 'David','Ferbo', '01/02/1968'),  
('100-101-108',NULL,'Nina','Sen',NULL, '01/02/1969'),  
('100-101-108',NULL,'Happy', 'Singh',NULL, '01/02/1994'),  
('100-101-109',NULL,'Sunny', 'Oberoi',NULL, '01/02/1997'),  
('100-101-110',NULL,'Ricky', 'Martin',NULL, '01/02/1984'),
('100-101-111',NULL,'Pummy', 'Daze',NULL, '01/02/1980');

 /* Adding a check constraint checkDateofBirth*/
 alter table Prisoners add constraint checkDateofBirth check (DateofBirth < GETDATE())


 /* Create a table named CrimeTypes*/
 CREATE TABLE CrimeType(
[Crime Type ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
CrimeName VARCHAR(50) NOT NULL,
Description VARCHAR (200));

/* Inserting data into CrimeType table*/
INSERT INTO CrimeType VALUES
('Personal Crimes',NULL), 
('Property Crimes',NULL), 
('Inchoate Crimes',NULL), 
('Statutory Crimes',NULL); 


/*Create a table named Parole*/
CREATE TABLE Parole(
[Parole ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Parole Start Date] VARCHAR(10) NOT NULL,
[Parole End Date] VARCHAR(10),
[Description] VARCHAR (200));

/* Inserting data into Parole table*/
INSERT INTO Parole VALUES
('02/10/2000','04/11/2002',NULL),
('02/20/2002','04/10/2003',NULL),
('04/12/2001','06/10/2002',NULL),
('05/10/2003','04/12/2005',NULL),
('07/08/2004','04/20/2007',NULL),
('09/22/2005','04/23/2008',NULL),
('06/18/2009','04/16/2011',NULL),
('05/18/2007','04/17/2009',NULL),
('02/19/2010','04/11/2012',NULL),
('03/22/2011','04/09/2013',NULL);


/*Create a table named Employer*/
CREATE TABLE Employer(
[Employer ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Employer Full Name] VARCHAR(50) NOT NULL,
[AddressID] VARCHAR (200),
[Employment Grade] INT);

/* Inserting data into Employer table*/
INSERT INTO Employer VALUES
('Thomas','1212 University Way',NULL),
('Tim','1400 East Way', 9),
('Steven', 'NULL',NULL),
('George', '1445 University Way',7),
('Gabriel','1552 Eastlake',16),
('Popo','4335 Mason Park 7th Avenue',12),
('Anna','NULL',NULL),
('Tony','6279 North Way',21),
('Rapahel','5050 45th Street 15th Avenue',NULL),
('Chang',NULL,NULL);


/*Create a table named Relatives*/
CREATE TABLE Relatives(
[Relative ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Relative First Name] VARCHAR(50) NOT NULL,
[Relative Last Name] VARCHAR(50),
[Relative Contact] VARCHAR(15),
[Relation to Prisoner] VARCHAR(15) NOT NULL);

/* Inserting data into Relatives table*/
INSERT INTO Relatives VALUES
('Robin',NULL,NULL,'Brother'),
('Priya','Roy','425-222-555','Mother'),
('Rocky','Oberoi',NULL,'Cousin'),
('Jack','Singh','235-208-9191','Uncle'),
('Chris','Daze','913-202-7878','Brother'),
('Neel','Diaz',NULL,'Cousin'),
('Roxy',NULL,NULL,'Brother'),
('Jennifer','425-890-5656',NULL,'Aunt'),
('Jenny','Gomez',NULL,'Sister'),
('Sumeet','Oberoi',NULL,'Uncle');


/*Create a table named Prisons*/
CREATE TABLE Prisons(
[Prison ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Prison Name] VARCHAR(50) NOT NULL,
[Prison Address] VARCHAR(200) NOT NULL,
[Prison Contact] VARCHAR(15) NOT NULL,
[Prison Type] VARCHAR(20));

/* Inserting data into Prisons table*/
INSERT INTO Prisons VALUES
('Seattle Civil Prison','1/A Lake View','203-001-4141', 'Civil'),
('Renton Military Prison','1/B Walt Park','201-201-3344', 'Military'),
('Seattle Military Prison','1/D Rose Park','201-211-3344','Military'),
('Tacoma Civil Prison','1/B Lincoln Street','201-201-3344','Civil'),
('Tacoma Military Prison','1/D Beach Way','201-201-3984','Military'),
('Bothell Psychiatric Jail','1/B Ranier Park','201-201-3904','Psychiatric'),
('Bothell Civil Prison','11/5 Camp Park','201-201-3344','Civil'),
('Seattle Psychiatric Prison','1/17 Disney Park','201-201-3344','Psychiatric'),
('Tacoma Psychiatric Jail','1/l2 5th Ave 34st Street','201-201-3344','Psychiatric'),
('Redmond Civil Prison','12/B Walt Park','201-201-3344',NULL);


/*Create a table named AddressDetails*/
CREATE TABLE AddressDetails(
[Address ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[House Number] VARCHAR(10) NOT NULL,
[Street Name] VARCHAR(50) NOT NULL,
[City] VARCHAR(20) NOT NULL,
[State] VARCHAR(20) NOT NULL,
[Country] VARCHAR(20) NOT NULL,
[ZipCode] VARCHAR(20));

/* Inserting data into AddressDetails table*/
INSERT INTO AddressDetails VALUES
('404',' 1/6 Bush Street', 'Seattle','WA','United States','98100'),
('904','1/C Jackson Street','Tacoma','WA','United States',NULL),
('606','2/B Crimson Park', 'Seattle','WA','United States','98110'),
('4890','3/D Rose Valley','Bothell','WA','United States','98107'),
('6745','B-1 Broadway Road','Bothell','WA','United States',NULL),
('908','16/A Green Valley','Seattle','WA','United States','98102'),
('108','6/C Jackson Street','Seattle','WA','United States','98120'),
('4567',' 432 North Way 8th Avenue','Tacoma','WA','United States','98106'),
('4672','42nd Street 15th Avenue','Tacoma','WA','United States','98108'),
('736','50th Street 16th Avenue', 'Bothell','WA','United States','98123'),
('444',' 23th Samuel Street', 'Seattle','WA','United States','98109'),
('912','2/W Mills Avenue','Arizona','PHX','United States',NULL),
('689','221B Baker Street', 'Seattle','WA','United States','98120'),
('1233','2/Q Peer Valley','Bothell','WA','United States','98007'),
('989','B-11 Century Road','Bothell','WA','United States',NULL),
('900','16th Shallow Lake','Seattle','WA','United States','98142'),
('1123','M/29 George Avenue','Seattle','WA','United States','98140'),
('4532',' 555 South Mills 8th Avenue','Tacoma','WA','United States','98206'),
('4233','12/W James 11th Avenue','Tacoma','WA','United States','98118'),
('700','53th Street 17th Avenue', 'Bothell','WA','United States','98113'),
('2323','112/T Gandhi Valley','Seattle','WA','United States','98133'),
('1111','44/E Watson Street','Seattle','WA','United States','98144'),
('4332',' 411 Sally Street 8th Avenue','Tacoma','WA','United States','98136'),
('4321','41nd Street 105th Avenue','Tacoma','WA','United States','98111'),
('999','55th Street 66th Avenue', 'Bothell','WA','United States','98523');


/*Create a table named OfficersinCharge*/
CREATE TABLE OfficersInCharge(
[OIC ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[OIC First Name] VARCHAR(50) NOT NULL,
[OIC Last Name] VARCHAR(50) NOT NULL,
[OIC PhoneNo] VARCHAR(15) NOT NULL);

/* Inserting data into OfficersInCharge table*/
INSERT INTO OfficersInCharge VALUES
('Xuan','Lio','209-989-1111'),
('Leo','Cooper','209-989-1210'),
('Penny','Lopez','209-989-0123'),
('Sheldon','Clinton','209-988-2233'),
('Benedict','Nyen','209-988-3545'),
('Swara','Hudson','209-9898-0009'),
('Kate','Lopez','209-898-0010'),
('Ben','Chopra','209-988-0020'),
('Jack','Affleck','209-998-0066'),
('Jayson','Wright','209-988-0980');


/* Create a table named Biometrics*/
CREATE TABLE Biometrics(
[Biometric ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Prisoner ID] INT NOT NULL,
[Biometric Type] VARCHAR(50) NOT NULL,
[Biometric Value] VARBINARY(MAX));

/* Inserting data into Biometrics table*/
INSERT INTO Biometrics VALUES 
(1,'Signature',NULL),
(1,'Fingerprint',NULL),
(2,'Fingerprint',NULL),
(3,'Retina Scan',NULL),
(4,'Fingerprint',NULL),
(5,'Signature',NULL),
(6,'Fingerprint',NULL),
(6,'Signature',NULL),
(6,'Retina Scan',NULL),
(7,'Signature',NULL);


/* Create a table named CrimesCommitted*/
CREATE TABLE CrimesCommitted(
[Crime ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Crime Description] VARCHAR(100) NULL,
[Crime Location Address] VARCHAR(250) NOT NULL,
[Crime Type ID] INT NOT NULL,
[Prisoner ID] INT NOT NULL);

/* Inserting data into CrimesCommitted table*/
INSERT INTO CrimesCommitted VALUES 
('Homicide','6532, University Way, Seattle, WA',1, 3),
('Burglary','3456, University Way, Seattle, WA',2, 4),
('Assault','432, East St, Redmond, WA',1, 1),
('Receipt of Stolen Goods','234, Washington St, Seattle, WA',2,5),
('Battery','234, Washington St, Seattle, WA',1,5),
('Robbery','XYZ Stores, UDistrict, Seattle, WA',2,1),
('Drunk Driving','4567, University Way, Seattle, WA',4,10),
('Solicitation','234, Broadway, Redmond, WA',3,9),
('Arson','2785, Roosevelt St, Seattle, WA',2,7),
('Conspiracy','3467, Jackson St, Seattle WA',3,8);


/* Create a table named EmployerAddress*/
CREATE TABLE EmployerAddress(
[Employer Address ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Employer ID] INT NOT NULL,
[Address ID] INT NOT NULL,
[Start Date] DATE,
[End Date] DATE);

/* Inserting data into EmployerAddress table*/
INSERT INTO EmployerAddress VALUES 
(1,1,'04/16/2010', NULL),
(1,3,'03/20/2006', '04/13/2010'),
(2,8,'11/01/2010', NULL),
(3,8,'07/10/1994', '07/10/1996'),
(4,8,'02/11/2000', '04/11/2010'),
(5,4,'02/26/2000', NULL),
(6,6,'02/16/2003', NULL),
(7,7,'07/10/1996', '07/10/1999'),
(7,9,'04/23/2010', '04/23/2010'),
(10,2,'04/06/1984', NULL);


/* Create a table named Health*/
CREATE TABLE Health(
[Health ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Prisoner ID] INT NOT NULL,
[Health Information Type] VARCHAR(50) NOT NULL,
[Health Information Description] VARCHAR(100) NOT NULL);

/* Inserting data into Health table*/
INSERT INTO Health VALUES 
(1,'Blood Group','A+'),
(2,'Blood Group','O+'),
(2,'Disease','Diabetic'),
(3,'Blood Group','B+'),
(3,'Disease','Cardiovascular Disease'),
(3,'Disability','Hearing Impaired'),
(4,'Blood Group','O+'),
(4,'Disability','Speech Impaired'),
(5,'Blood Group','AB-'),
(6,'Blood Group','AB+');


/* Create a table named ImprisonmentTerm*/
CREATE TABLE ImprisonmentTerm(
[Imprisonment Term ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Prisoner ID] INT NOT NULL,
[Start Date] DATE NOT NULL,
[End Date] DATE NOT NULL,
--Duration is computed based on Start Date and End Date
[Duration] AS DATEDIFF(DAY,[Start Date],[End Date]),
[Prison Cell ID] INT NOT NULL);

/* Inserting data into ImprisonmentTerm table*/
INSERT INTO ImprisonmentTerm VALUES 
(1,'01/23/2009','01/23/2018',1),
(2,'01/01/2000','01/01/2020',1),
(2,'05/14/1996','05/14/1999',2),
(3,'11/21/2012','11/21/2019',2),
(4,'12/12/2014','12/12/2016',1),
(4,'12/01/2013','12/01/2014',3),
(4,'01/25/2009','01/25/2012',6),
(5,'01/10/1999','01/10/2009',3),
(6,'02/23/2009','02/23/2018',4),
(7,'06/05/2015','06/05/2017',5);


/* Create a table named OfficerAddress*/
CREATE TABLE OfficerAddress(
[Officer Address ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Officer ID] INT NOT NULL,
[Address ID] INT NOT NULL);

/* Inserting data into OfficerAddress table*/
INSERT INTO OfficerAddress VALUES 
(1,11),
(2,12),
(3,13),
(4,14),
(5,15),
(6,15),
(7,16),
(8,7),
(9,4),
(10,4);


/* Create a table named PrisonCell*/
CREATE TABLE PrisonCell(
[Prison Cell ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Prison ID] INT NOT NULL,
[Cell Number] VARCHAR(10) NOT NULL,
[OIC ID] INT NOT NULL);

/* Inserting data into PrisonCell table*/
INSERT INTO PrisonCell VALUES 
(1,'002',1),
(2,'111',8),
(2,'112',7),
(3,'212',10),
(3,'213',10),
(3,'214',10),
(4,'000',2),
(4,'001',3),
(5,'110',5),
(6,'343',4);


/* Create a table named PrisonerAddress*/
CREATE TABLE PrisonerAddress(
[Prisoner Address ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Prisoner ID] INT NOT NULL,
[Address ID] INT NOT NULL,
[Start Date] DATE,
[End Date] DATE);

/* Inserting data into PrisonerAddress table*/
INSERT INTO PrisonerAddress VALUES 
(1,2,'06/05/1999','06/05/2010'),
(2,2,'01/23/1996','01/23/2008'),
(3,3,'01/01/2000','01/01/2002'),
(4,4,'05/14/1996','05/14/1999'),
(5,10,'11/21/2012','12/21/2013'),
(6,7,'12/12/2014','01/01/2000'),
(7,6,'12/01/1998','12/01/2014'),
(8,5,'01/25/2009','01/25/2012'),
(9,8,'01/10/1999','01/10/2009'),
(9,9,'02/23/2009','02/23/2010');


/* Create a table named PrisonerEmployer*/	 
CREATE TABLE PrisonerEmployer(
[Prisoner ID] INT NOT NULL,
[Employer ID] INT NOT NULL,
CONSTRAINT PK_PrisonerEmployer_PrisonerID_EmployerID PRIMARY KEY CLUSTERED ([Prisoner ID], [Employer ID]));

/* Inserting data into PrisonerEmployer table*/
INSERT INTO PrisonerEmployer VALUES 
(1,2),
(2,2),
(3,1),
(4,1),
(5,10),
(5,7),
(7,6),
(8,5),
(9,8),
(10,9);


/* Create a table named PrisonerParole*/
CREATE TABLE PrisonerParole(
[Prisoner Parole ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Prisoner ID] INT NOT NULL,
[Parole ID] INT NOT NULL);

/* Inserting data into PrisonerParole table*/
INSERT INTO PrisonerParole VALUES 
(1,9),
(2,2),
(2,4),
(6,9),
(4,7),
(4,9),
(1,10),
(5,3),
(6,9),
(6,10);


/* Create a table named PrisonerRelative*/
CREATE TABLE PrisonerRelative(
[Prisoner ID] INT NOT NULL,
[Relative ID] INT NOT NULL,
CONSTRAINT PK_PrisonerRelative_PrisonerID_RelativeID PRIMARY KEY CLUSTERED ([Prisoner ID], [Relative ID]));

/* Inserting data into PrisonerRelative table*/
INSERT INTO PrisonerRelative VALUES 
(1,1),
(2,10),
(2,3),
(3,2),
(3,5),
(3,6),
(4,1),
(4,7),
(5,8),
(6,9);


/* Create a table named RelativeAddress*/
CREATE TABLE RelativeAddress(
[Relative Address ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
[Relative ID] INT NOT NULL,
[Address ID] INT NOT NULL);

/* Inserting data into RelativeAddress table*/
INSERT INTO RelativeAddress VALUES 
(1,2),
(2,5),
(3,7),
(4,3),
(5,4),
(6,3),
(7,6),
(8,1),
(9,1),
(10,10);


/* Create a table named Visitor*/
CREATE TABLE Visitor(
[Visitor ID] INT IDENTITY (1,1) NOT NULL,
[Prisoner ID] INT NOT NULL,
[Visitor SSN] VARCHAR(15),
[Visitor Unique ID] VARCHAR(15),
[Visitor First Name] VARCHAR(50) NOT NULL,
[Visitor Last Name] VARCHAR(50),
[Visitor Middle Name] VARCHAR(50),
[Visitor Address] VARCHAR(250) NOT NULL,
[Visitor Phone Number] VARCHAR(15),
[Visit Date] DATE NOT NULL,
CONSTRAINT PK_Visitor_VisitorID_PrisonerID PRIMARY KEY CLUSTERED ([Visitor ID], [Prisoner ID])
);

/* Inserting data into Visitors table*/
INSERT INTO Visitor VALUES 
(1,'000-010-2345',NULL,'Eric','Brown',NULL,'23/A Jackson St 98104',NULL,'01-01-2016'),
(2,'212-654-5874',NULL,'Bill','Murray',NULL,'453 Falkner St 98103','206-334-6854','10-01-2015'),
(2,'432-287-2548',NULL,'Samantha','Jackson',NULL,'23 Roosevelt 98104','206-342-4378','01-10-2016'),
(3,'507-444-4541',NULL,'Tracy','Stevens',NULL,'584 Udistrict 98105','206-455-2341','01-01-2012'),
(3,NULL,'ABC-XYZ-3445','Bryan','Clark',NULL,'5451 Udistrict 98105',NULL,'03-03-2016'),
(7,'500-584-5845',NULL,'Tom','Lydick',NULL,'8745 Redmond 98112','206-324-4345','02-10-2016'),
(4,'032-874-5542',NULL,'Shannon','Bryce',NULL,'123 Broadway St 98105','220-632-2541','02-24-2016'),
(4,'102-587-8754',NULL,'Paul','Bryce',NULL,'123 Broadway St 98105','445-541-8411','03-01-2015'),
(5,NULL,'ACD-GSH-2436','Frank','Mann',NULL,'456 Eastlake 98105',NULL,'09-10-2015'),
(6,'422-638-5752',NULL,'Sarah','Walker',NULL,'65 Westlake 98105','206-874-5412','01-11-2016');
		   

--ADDING FOREIGN KEY CONSTRAINTS

/* Adding foreign keys for Biometrics table*/
ALTER TABLE Biometrics ADD CONSTRAINT FK_Biometrics_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);

/* Adding foreign keys for CrimesCommitted table*/
ALTER TABLE CrimesCommitted ADD CONSTRAINT FK_CrimesCommitted_CrimeType FOREIGN KEY ([Crime Type ID]) REFERENCES CrimeType([Crime Type ID]);
ALTER TABLE CrimesCommitted ADD CONSTRAINT FK_CrimesCommitted_Prsioner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);

/* Adding foreign keys for EmployerAddress table*/
ALTER TABLE EmployerAddress ADD CONSTRAINT FK_EmployerAddress_Employer FOREIGN KEY ([Employer ID]) REFERENCES Employer([Employer ID]);
ALTER TABLE EmployerAddress ADD CONSTRAINT FK_EmployerAddress_Address FOREIGN KEY ([Address ID]) REFERENCES AddressDetails([Address ID]);

/* Adding foreign keys for Health table*/
ALTER TABLE Health ADD CONSTRAINT FK_Health_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);

/* Adding foreign keys for ImprisonmentTerm table*/
ALTER TABLE ImprisonmentTerm ADD CONSTRAINT FK_ImprisonmentTerm_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);
ALTER TABLE ImprisonmentTerm ADD CONSTRAINT FK_ImprisonmentTerm_PrisonCell FOREIGN KEY ([Prison Cell ID]) REFERENCES PrisonCell([Prison Cell ID]);

/* Adding foreign keys for OfficerAddress table*/
ALTER TABLE OfficerAddress ADD CONSTRAINT FK_OfficerAddress_OIC FOREIGN KEY ([Officer ID]) REFERENCES OfficersInCharge([OIC ID]);
ALTER TABLE OfficerAddress ADD CONSTRAINT FK_OfficerAddress_Address FOREIGN KEY ([Address ID]) REFERENCES AddressDetails([Address ID]);

/* Adding foreign keys for PrisonCell table*/
ALTER TABLE PrisonCell ADD CONSTRAINT FK_PrisonCell_Prison FOREIGN KEY ([Prison ID]) REFERENCES Prisons([Prison ID]);
ALTER TABLE PrisonCell ADD CONSTRAINT FK_PrisonCell_OIC FOREIGN KEY ([OIC ID]) REFERENCES OfficersInCharge([OIC ID]);

/* Adding foreign keys for PrisonerAddress table*/
ALTER TABLE PrisonerAddress ADD CONSTRAINT FK_PrisonerAddress_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);
ALTER TABLE PrisonerAddress ADD CONSTRAINT FK_PrisonerAddress_Address FOREIGN KEY ([Address ID]) REFERENCES AddressDetails([Address ID]);

/* Adding foreign keys for PrisonerEmployer table*/
ALTER TABLE PrisonerEmployer ADD CONSTRAINT FK_PrisonerEmployer_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);
ALTER TABLE PrisonerEmployer ADD CONSTRAINT FK_PrisonerEmployer_Employer FOREIGN KEY ([Employer ID]) REFERENCES Employer([Employer ID]);

/* Adding foreign keys for PrisonerParole table*/
ALTER TABLE PrisonerParole ADD CONSTRAINT FK_PrisonerParole_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);
ALTER TABLE PrisonerParole ADD CONSTRAINT FK_PrisonerParole_Parole FOREIGN KEY ([Parole ID]) REFERENCES Parole([Parole ID]);

/* Adding foreign keys for PrisonerRelative table*/
ALTER TABLE PrisonerRelative ADD CONSTRAINT FK_PrisonerRelative_Prisoner FOREIGN KEY ([Prisoner ID]) REFERENCES Prisoners([Prisoner ID]);
ALTER TABLE PrisonerRelative ADD CONSTRAINT FK_PrisonerRelative_Relative FOREIGN KEY ([Relative ID]) REFERENCES Relatives([Relative ID]);

/* Adding foreign keys for RelativeAddress table*/
ALTER TABLE RelativeAddress ADD CONSTRAINT FK_RelativeAddress_Relative FOREIGN KEY ([Relative ID]) REFERENCES Relatives([Relative ID]);
ALTER TABLE RelativeAddress ADD CONSTRAINT FK_RelativeAddress_Address FOREIGN KEY ([Address ID]) REFERENCES AddressDetails([Address ID]);


--CREATING VIEWS FOR REPORTS


/* Creating a view which reports the visitors who visited prisons within the last 2 years */
CREATE VIEW [Last 2Yr Visits Report] AS
SELECT p.[First Name]+' '+COALESCE(p.[MiddleName]+' ','')+p.[Last Name] AS Prisoner
, v.[Visitor First Name]+' '+COALESCE(v.[Visitor Middle Name]+' ','')+v.[Visitor Last Name] AS Visitor
, v.[Visit Date]
FROM Visitor v
JOIN Prisoners p
ON v.[Prisoner ID]=p.[Prisoner ID]
WHERE DATEPART(YEAR,v.[Visit Date]) >= YEAR(GETDATE())-2;
GO

/*Generating the report*/
SELECT * FROM [Last 2Yr Visits Report];

/* Creating a view which reports the officer information for military prisons*/
CREATE VIEW [OIC by Prison Report] AS
SELECT o.[OIC First Name]+' '+o.[OIC Last Name] AS OIC,
o.[OIC PhoneNo], c.[Cell Number], pr.[Prison Name],
p.[First Name]+' '+COALESCE(p.[MiddleName]+' ','')+p.[Last Name] AS Prisoner
FROM PRISONERS p
JOIN ImprisonmentTerm i
ON i.[Prisoner ID]=p.[Prisoner ID]
JOIN PrisonCell c
ON c.[Prison Cell ID]=i.[Prison Cell ID]
JOIN OfficersInCharge o
ON o.[OIC ID]=c.[OIC ID]
JOIN Prisons pr
ON pr.[Prison ID]=c.[Prison ID]
WHERE pr.[Prison Type]='Military'
AND i.[End Date]>= GETDATE();
GO

/*Generating the report*/
SELECT * FROM [OIC by Prison Report];

/* Creating a view which reports the imprisonment duration (in days) left to be served for prisoners who have 
at least a year more worth of imprisonment*/
CREATE VIEW [Term Duration Left Report] AS
SELECT p.[Prisoner ID]
, p.[First Name]+' '+COALESCE(p.[MiddleName]+' ','')+p.[Last Name] AS Prisoner
, i.[Prison Cell ID]
, c.[Cell Number]
, pr.[Prison Name]
, pr.[Prison Type]
, DATEDIFF(DAY,GETDATE(),i.[End dATE]) AS [Time Left] 
FROM Prisoners p
JOIN ImprisonmentTerm i
ON p.[Prisoner ID] = i.[Prisoner ID]
JOIN PrisonCell c
ON c.[Prison Cell ID]=i.[Prison Cell ID]
JOIN Prisons pr
ON pr.[Prison ID]=c.[Prison ID]
WHERE DATEDIFF(DAY,GETDATE(),i.[End dATE]) >= 365;
GO

/*Generating the report*/
SELECT * FROM [Term Duration Left Report];


/*Creating a view of prisoners above the age of 21 with blood group information*/
CREATE VIEW [BloodGroup21] AS
SELECT p.[First Name],p.[Last Name],p.Age, h.[Health Information Description]
FROM Prisoners AS p join Health AS h
ON p.[Prisoner ID]=h.[Prisoner ID]
WHERE p.Age>21 AND h.[Health Information Type]='Blood Group';
GO

/*Generating the report*/
SELECT * FROM [BloodGroup21];