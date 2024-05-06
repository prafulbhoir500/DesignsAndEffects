CREATE TABLE UserInfo (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    FullName VARCHAR(100),
    BirthDate DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    City VARCHAR(50),
    Country VARCHAR(50),
    PostalCode VARCHAR(20),
    PhoneNumber VARCHAR(20),
    CreatedOn DATETIME DEFAULT GETDATE(),
    UpdatedOn DATETIME
);


--SELECT * FROM UserInfo


--INSERT INTO UserInfo (Username,Email,Password) VALUES('admin','prafulbhoir500@gmail.com','admin')