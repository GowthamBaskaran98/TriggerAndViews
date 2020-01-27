CREATE TABLE VoterList
(
voterId VARCHAR(10) PRIMARY KEY NOT NULL,
name VARCHAR(15) NOT NULL,
mobileNumber VARCHAR(15) UNIQUE,
age numeric(2),
);

INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('1656465456','Gowtham','9876543210',20)
INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('1656465451','Kowsalya','9876543216',16)
INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('1656461453','Priya','9876543014',21)
DELETE FROM VoterList WHERE voterId = '1656461456';
UPDATE VoterList SET name = 'Monisha' where voterId = '1656461453';
SELECT * FROM VOTERLIST


--VIEWS

CREATE VIEW EligibleList AS
SELECT voterId,name,mobileNumber,age FROM VOTERLIST
WHERE age > 18;

SELECT * FROM EligibleList

---------------------------------------------------------------------------------------------------------------
--INSERT TRIGGER

CREATE TRIGGER AfterInsert
ON VOTERLIST
FOR INSERT
AS
BEGIN
	DECLARE @voterId int
	select @voterId = voterId from inserted
	INSERT INTO TriggerDemo_History (voterid,modifiedAt) VALUES (cast(@voterid as nvarchar(10)),'Inserted at ' + CAST(GETDATE() as varchar(50)))
END

--DELETE TRIGGER
CREATE TRIGGER AfterDelete
ON VOTERLIST
FOR DELETE
AS
BEGIN
	DECLARE @voterId int
	select @voterId = voterId from deleted
	INSERT INTO TriggerDemo_History (voterid,modifiedAt) VALUES (cast(@voterid as nvarchar(10)),'Deleted at '+ CAST(GETDATE() as varchar(50)))
END

CREATE TABLE TriggerDemo_History
(
voterid varchar(10),
modifiedAt varchar(50)
);

SELECT * FROM TriggerDemo_History