--UC1
CREATE DATABASE Address_Book_SystemService_Database;
USE Address_Book_SystemService_Database;

--UC2
CREATE TABLE AddressBookTable
(
FirstName VARCHAR(15) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(15) NOT NULL,
State VARCHAR(15) NOT NULL,
Zip Int NOT NULL,
MobNo Int NOT NULL,
Email VARCHAR(30) NOT NULL
)
SELECT * From AddressBookTable;

--UC3
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Akash','Mane','Bhigwan','Pune','Maharashtra',410506,987654321,'maneakash3938@gmail.com');
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Shreeram','Jadhav','Talegaon','Pune','Maharashtra',410506,963852741,'shreeramjadhav@gmail.com');
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Satyajeet','Jadhav','Ekvira Nagar','Kolhapur','Maharashtra',422771,741852963,'satyejeetjadhav@gmail.com');
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Pubg','Mobile','Pochinki','Errangel','New State',416,123456789,'mpubg192837@gmail.com');
SELECT * From AddressBookTable;

--UC4
UPDATE AddressBookTable SET Zip = 411506 WHERE FirstName = 'Akash';

--UC5
DELETE FROM AddressBookTable WHERE FirstName = 'Vaibhav';

--UC6
SELECT * From AddressBookTable WHERE State='Maharashtra' AND City='Pune';
--UC7
SELECT COUNT(*) From AddressBookTable WHERE State='Maharashtra' AND City='Pune';
--UC8
SELECT * FROM AddressBookTable WHERE City = 'Pune' ORDER BY FirstName;
--UC9
ALTER TABLE AddressBookTable ADD Type VARCHAR(15);
ALTER TABLE AddressBookTable ADD AddressBookName VARCHAR(30);
UPDATE AddressBookTable SET Type='Family' WHERE FirstName='Shreeram';
UPDATE AddressBookTable SET Type='Family' WHERE FirstName='Akash';
UPDATE AddressBookTable SET Type='Profession' WHERE FirstName='Pubg';
UPDATE AddressBookTable SET AddressBookName='FamilyZone' WHERE Type='Family';

--UC10
SELECT Type,COUNT(Type) From AddressBookTable Group By Type;
--UC11
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email,Type,AddressBookName)VALUES('UC','Greed','ShivajiNagar','Hulsur','Karnataka',546546,789654123,'ucgreed@gmail.com','Friend','FriendZone');
SELECT * From AddressBookTable;

--UC12
CREATE DATABASE Address_Book_SystemService_Database_2
USE Address_Book_SystemService_Database_2
CREATE TABLE AddressBook
(
AddressBookId int primary key identity(1,1),
AddressBookName varchar(255)
)
Insert Into AddressBook values('AddressBook1')
Insert Into AddressBook values('AddressBook2')
Insert Into AddressBook values('AddressBook3')
Select * From AddressBook

CREATE TABLE Person
(
PersonId int primary key identity(101,1),
AddressBookId int references AddressBook(AddressBookId),
FirstName VARCHAR(255) NOT NULL,
LastName VARCHAR(255) NOT NULL,
Address VARCHAR(255) NOT NULL,
City VARCHAR(255) NOT NULL,
State VARCHAR(255) NOT NULL,
Zip Int NOT NULL,
MobNo Int NOT NULL,
Email VARCHAR(255) NOT NULL,
)
Insert Into Person values(1,'Oggy','Melon','Khadki','Pune','Maharashtra',410506,987654321,'oggy123@gmail.com')
Insert Into Person values(2,'Jack','Silva','pimpri','Noida','Delhi',506410,123456789,'jack321@gmail.com')
Insert Into Person values(3,'Olivia','Gracia','Lonavala','Aurangabad','Karnataka',510406,741258963,'olivia123@gmail.com')
Insert Into Person values(1,'Joey','Angels','Indore','Myanmad','Gujrat',420153,786214593,'joey123@gmail.com')
Insert Into Person values(3,'DeeDee','Martin','Indore','Myanmad','Gujrat',654231,879546213,'deedee123@gmail.com')
Select * From Person

CREATE TABLE Type
(
TypeId int primary key identity(1001,1),
TypeName varchar(255)
)
Insert Into Type values('Friend')
Insert Into Type values('Family')
Insert Into Type values('Profession')
Insert Into Type values('Friend')
Insert Into Type values('Profession')

Select * From Type

CREATE TABLE PersonType
(
PersonId int references Person(PersonId),
TypeId int references Type(TypeId)
)
Insert Into PersonType values(101,1001)
Insert Into PersonType values(102,1002)
Insert Into PersonType values(103,1003)
Insert Into PersonType values(104,1004)
Insert Into PersonType values(105,1005)
Select * From PersonType

--UC13
--UC6_Redo--
Select AddressBookName,FirstName,LastName,Address,City,State,Zip,MobNo,Email,TypeName
From AddressBook
INNER Join Person ON AddressBook.AddressBookId=Person.AddressBookId AND City='Myanmad' AND State='Gujrat'
INNER Join PersonType ON Person.PersonId=PersonType.PersonId
INNER Join Type ON Type.TypeId=PersonType.TypeId

--UC7_Redo--
Select City,Count(City),State,COUNT(State)
From AddressBook
INNER Join Person ON AddressBook.AddressBookId=Person.AddressBookId Group By City,State

--UC8_Redo--
Select AddressBookName,FirstName,LastName,Address,City,State,Zip,MobNo,Email,TypeName
From AddressBook
INNER Join Person ON AddressBook.AddressBookId=Person.AddressBookId AND City='Myanmad'
INNER Join PersonType ON Person.PersonId=PersonType.PersonId
INNER Join Type ON Type.TypeId=PersonType.TypeId
Order By FirstName

--UC10_Redo--
Select TypeName,Count(*)
From Person
INNER Join AddressBook ON AddressBook.AddressBookId=Person.AddressBookId
INNER Join PersonType ON Person.PersonId=PersonType.PersonId
INNER Join Type ON Type.TypeId=PersonType.TypeId
Group By TypeName
