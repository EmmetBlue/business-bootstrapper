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
INSERT INTO Staffs.Staff (StaffUUID) VALUES ('[uuid]');
GO
INSERT INTO Staffs.StaffPassword (StaffID, StaffUsername, PasswordHash) VALUES (1, '[username]', '[password]');
GO
INSERT INTO Staffs.StaffDepartment (DepartmentID, StaffID) VALUES (1, 1);
GO
INSERT INTO Staffs.StaffRole (RoleID, StaffID) VALUES (1, 1);
GO
INSERT INTO Staffs.StaffProfile (StaffID, StaffFullName) VALUES (1, '[fullname]');
GO
INSERT INTO Staffs.StaffRecordsFieldValue (StaffID, FieldTitle, FieldValue) VALUES  (1, 'First Name', '[firstname]'), (1, 'Last Name', '[lastname]'), (1, 'StaffProfile', '1');
GO