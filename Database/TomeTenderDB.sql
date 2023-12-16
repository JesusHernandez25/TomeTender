-- create database/ 
CREATE DATABASE NEWLibraryDatabase;
GO
-- Use the newly created database
USE NEWLibraryDatabase;

-- Create Category table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY IDENTITY(1,1),
    genre_name VARCHAR(50) NOT NULL
);

-- Insert sample data into the Category table
INSERT INTO Genre(Genre_name)
VALUES
    ('Science Fiction'),
    ('Mystery'),
    ('Romance'),
    ('Thriller'),
    ('Fantasy'),
    ('Historical Fiction');
    -- Add more categories as needed

-- Create Book table
CREATE TABLE Book (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(100) NOT NULL,
    genre_id INT FOREIGN KEY REFERENCES Genre(genre_id)
);

-- Insert sample data into the Book table
INSERT INTO Book (title, genre_id)
VALUES
    ('The Time Machine', 1),
    ('The Hound of the Baskervilles', 2),
    ('Pride and Prejudice', 3),
    ('The Da Vinci Code', 4),
    ('Harry Potter and the Sorcerer''s Stone', 5);
    -- Add more books as needed

-- Create Publisher table
CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL
);

-- Insert sample data into the Publisher table
INSERT INTO Publisher (name)
VALUES
    ('Penguin Books'),
    ('HarperCollins'),
    ('Random House'),
    ('Simon & Schuster'),
    ('Macmillan');
    -- Add more publishers as needed

-- Create BookInfo table
CREATE TABLE BookInfo (
    info_id INT PRIMARY KEY IDENTITY(1,1),
    book_id INT FOREIGN KEY REFERENCES Book(book_id),
    publisher_id INT FOREIGN KEY REFERENCES Publisher(publisher_id),
    year_published INT,
	Summary VARCHAR(255)
);
-- Insert sample data into the BookInfo table
-- Will need to be tested
INSERT INTO BookInfo (book_id,  publisher_id, year_published, Summary)
VALUES
    (1, 1, 1895, 3),
    (2, 2, 1902, 3),
    (3, 3, 1813, 3),
    (4, 4, 2003, 3),
    (5, 5, 1997, 3);
    -- Add more book info as needed
	
--New tables

-- Create Library_Event Table
CREATE TABLE Library_Event (
    Library_Event_ID INT PRIMARY KEY IDENTITY(1,1),
    Event_Description VARCHAR(100) NOT NULL
);

	SET IDENTITY_INSERT Library_Event ON

INSERT INTO Library_Event (Library_Event_ID, Event_Description)
VALUES
	(1, 'Party'),
	(2, 'Holiday');

	SET IDENTITY_INSERT Library_Event OFF

-- Create Reading_List Table
CREATE TABLE Reading_List (
    Reading_List_ID INT PRIMARY KEY IDENTITY(1,1),
	Book_Info_ID int FOREIGN KEY REFERENCES BookInfo(Info_ID)
);

	SET IDENTITY_INSERT Reading_List ON

INSERT INTO Reading_List (Reading_List_ID, Book_Info_ID)
VALUES
	(1, 1),
	(2, 2);

	SET IDENTITY_INSERT Reading_List OFF

-- Create Wishlist Table
CREATE TABLE Wishlist (
    Wishlist_ID INT PRIMARY KEY IDENTITY(1,1),
	Book_Info_ID int FOREIGN KEY REFERENCES BookInfo(Info_ID)
);

	SET IDENTITY_INSERT Wishlist ON

INSERT INTO Wishlist (Wishlist_ID, Book_Info_ID)
VALUES
	(1, 1),
	(2, 2);

	SET IDENTITY_INSERT Wishlist OFF

-- Create Author table
CREATE TABLE Author (
    author_id INT PRIMARY KEY IDENTITY(1,1),
    author_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    date_of_death DATE
);

-- Insert sample data into the Author table
INSERT INTO Author (author_name, date_of_birth, date_of_death)
VALUES
    ('H.G. Wells', '1866-09-21', '1946-08-13'),
    ('Arthur Conan Doyle', '1859-05-22', '1930-07-07'),
    ('Jane Austen', '1775-12-16', '1817-07-18'),
    ('Dan Brown', '1964-06-22', NULL),
    ('J.K. Rowling', '1965-07-31', NULL);
    -- Add more authors as needed

-- Create BookAuthor table
CREATE TABLE BookAuthor (
    book_id INT FOREIGN KEY REFERENCES Book(book_id),
    author_id INT FOREIGN KEY REFERENCES Author(author_id),
    PRIMARY KEY (book_id, author_id)
);

-- Insert sample data into the BookAuthor table
INSERT INTO BookAuthor (book_id, author_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
    -- Add more book-author relationships as needed

-- Create City table
CREATE TABLE City (
    city_id INT PRIMARY KEY IDENTITY(1,1),
    post_code INT,
    city_name VARCHAR(100)
);

--Insert sample data into the City table
INSERT INTO City ( post_code, city_name)
VALUES
    ('45678', 'Harbor City'),
    ('56789', 'Smallville, CA'),
    ('89012', 'Rivertown, NY'),
    ('34567', 'Mountainview, TX'),
    ('67890', 'Lakeside, FL');
    -- Add more Cities as needed

-- Create Library table
CREATE TABLE Libraries (
    library_id INT PRIMARY KEY IDENTITY(1,1),
    library_name VARCHAR(100),
    library_address VARCHAR (100),
    city_id INT FOREIGN KEY REFERENCES City(city_id),
	Library_Event_ID INT FOREIGN KEY REFERENCES Library_Event(Library_Event_ID)
);

-- Insert sample data into the Library table
INSERT INTO Libraries (library_name, library_address, city_id, Library_Event_ID)
VALUES
    ('Reading Oasis', '789 Elm Street', '1','1'),
    ('Silent Stacks Society', '456 Oak Avenue', '2','2'),
    ('Bookworm Retreat', '789 Maple Lane', '3','1'),
    ('Wisdom Vault', '321 Pine Street', '4','2'),
    ('Literary Haven Library', '876 Birch Road', '5','1');

	--New tables
-- Create Book_Location Table
CREATE TABLE Book_Location (
    info_id INT FOREIGN KEY REFERENCES BookInfo(info_id),
    library_ID INT FOREIGN KEY REFERENCES Libraries(Library_ID),
    PRIMARY KEY (info_ID, Library_ID),
	Book_Amount INT
);

	-- Create UserAccount table
CREATE TABLE UserAccount (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100),
    surname VARCHAR(100),
    user_address VARCHAR(100),
    city_id INT FOREIGN KEY REFERENCES City(city_id),
    email_address VARCHAR(100),
    phone_number VARCHAR(20),
	Wishlist_ID INT FOREIGN KEY REFERENCES Wishlist(Wishlist_ID),
	Reading_List_ID INT FOREIGN KEY REFERENCES Reading_List(Reading_List_ID)
);

--INSERT sample data into the UserAccount table
INSERT INTO UserAccount (username, surname, user_address, city_id, email_address, phone_number, Wishlist_ID, Reading_List_ID)
VALUES
    ('Liam', 'Thompson', '456 Pine Street', '1', 'LiamThompson@gmail.com', '8392382948', '1', '1'),
    ('Emily', 'Turner', '789 Birch Road', '2', 'Emily789@gmail.com', '8329237482', '2', '2'),
    ('Mason', 'Reynolds', '234 Cedar Boulevard', '3', 'Masondagoat@yahoo.com', '3488248823', '2', '2'),
    ('Lucas', 'Mitchell', '567 Elm Street', '4', 'Lucasskywalker@aol.om', '2803827492', '2', '1'),
    ('Kim', 'Thompson', '901 Redwood Lane', '5', 'MsThompson@yahoo.com', '3231237364', '2', '1');
    -- Add more User Accounts as needed
	
-- Create LoanedBook table
CREATE TABLE LoanedBook (
    loan_id INT PRIMARY KEY IDENTITY(1,1),
    book_id INT FOREIGN KEY REFERENCES Book(book_id),
    account_id INT FOREIGN KEY REFERENCES UserAccount(account_id),
    date_lent DATE,
    date_due DATE,
    date_returned DATE,
    overdue_fine VARCHAR(3),
    loaned_status_id INT,
    booktimestamp VARCHAR(100)
);

--INSERT sample data into the LoanedBook table
INSERT INTO LoanedBook (book_id, account_id, date_lent, date_due, date_returned, overdue_fine, loaned_status_id, booktimestamp)
VALUES
    ('1', '1', '2023-03-23', '2023-04-23', '2023-11-03', '$0', '1', 'IN'),
    ('2', '2', '2023-01-10', '2023-01-19', '2022-02-20', '$5', '2', 'IN'),
    ('3', '3', '2023-05-25', '2023-06-09', null, '$35', '3', 'OUT'),
    ('4', '4', '2023-06-10', '2023-06-24', '2023-06-24', '$0', '4', 'IN'),
    ('5', '5', '2020-03-08', '2020-04-08', '2023-05-10', '$50', '5', 'IN');
    -- Add more LoanedBooks as needed

-- Create LoanedStatus table
CREATE TABLE LoanedStatus (
    loan_id INT FOREIGN KEY REFERENCES LoanedBook(loan_id),
    loanstatus VARCHAR(100)
);

--INSERT sample data into the LoanedStatus table
INSERT INTO LoanedStatus (loan_id, loanstatus)
VALUES
    ('1', 'Returned'),
    ('2', 'Returned'),
    ('3', 'Overdued'),
    ('4', 'Returned'),
    ('5', 'Returned');
    -- Add more LoanedStatus as needed


-- Create Roles table

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);

-- Create Permissions table
CREATE TABLE Permissions (
    PermissionID INT PRIMARY KEY,
    PermissionName VARCHAR(50) NOT NULL
);

-- Create RolePermissions junction table
CREATE TABLE RolePermissions (
    RoleID INT,
    PermissionID INT,
    PRIMARY KEY (RoleID, PermissionID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
    FOREIGN KEY (PermissionID) REFERENCES Permissions(PermissionID)
);

-- Insert sample data into Roles table
INSERT INTO Roles (RoleID, RoleName) VALUES
(1, 'Administrator'),
(2, 'UserAccount'),
(3, 'Librarian');

-- Insert sample data into Permissions table
INSERT INTO Permissions (PermissionID, PermissionName) VALUES
(1, 'Read Data'),
(2, 'Write Data'),
(3, 'Delete Data');

-- Assign permissions to roles in the RolePermissions table
INSERT INTO RolePermissions (RoleID, PermissionID) VALUES
(1, 1), -- Administrator has Read Data permission
(1, 2), -- Administrator has Write Data permission
(1, 3), -- Administrator has Delete Data permission
(2, 1), -- UserAccount has Read Data permission
(3, 2), -- Librarian has Write Data permission
(3, 3); -- Librarian has Delete Data permission

