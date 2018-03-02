USE [EmmetBlue]
GO
INSERT INTO Staffs.DepartmentGroup (GroupName) VALUES ('Administration');
GO
INSERT INTO Staffs.Department (Name, GroupID) VALUES ('IT', 1);
GO
INSERT INTO Staffs.Role (Name, DepartmentID) VALUES ('Sysadmin', 1);
GO
INSERT INTO Staffs.DepartmentRootUrl (DepartmentID, Url) VALUES (1, 'human-resources/it/dashboard');
GO
INSERT INTO Staffs.StaffRecordsFieldTitle (FieldTitleName, FieldTitleType) VALUES ('First Name', 'Text'), ('Last Name', 'Text'), ('StaffProfile', 'Text');
GO