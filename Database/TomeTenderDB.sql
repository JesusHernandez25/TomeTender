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
    library_id INT,
    book_number INT,
    publisher_id INT FOREIGN KEY REFERENCES Publisher(publisher_id),
    year_published INT
);

-- Insert sample data into the BookInfo table
INSERT INTO BookInfo (book_id, library_id, book_number, publisher_id, year_published)
VALUES
    (1, 101, 001, 1, 1895),
    (2, 102, 002, 2, 1902),
    (3, 103, 003, 3, 1813),
    (4, 104, 004, 4, 2003),
    (5, 105, 005, 5, 1997);
    -- Add more book info as needed

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
    city_id INT FOREIGN KEY REFERENCES City(city_id)
);

-- Insert sample data into the Library table
INSERT INTO Libraries (library_name, library_address, city_id)
VALUES
    ('Reading Oasis', '789 Elm Street', '1'),
    ('Silent Stacks Society', '456 Oak Avenue', '2'),
    ('Bookworm Retreat', '789 Maple Lane', '3'),
    ('Wisdom Vault', '321 Pine Street', '4'),
    ('Literary Haven Library', '876 Birch Road', '5');
    -- Add more Libraries as needed


-- Create UserAccount table
CREATE TABLE UserAccount (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100),
    surname VARCHAR(100),
    user_address VARCHAR(100),
    city_id INT FOREIGN KEY REFERENCES City(city_id),
    email_address VARCHAR(100),
    phone_number VARCHAR(20)
);

--INSERT sample data into the UserAccount table
INSERT INTO UserAccount (username, surname, user_address, city_id, email_address, phone_number)
VALUES
    ('Liam', 'Thompson', '456 Pine Street', '1', 'LiamThompson@gmail.com', '8392382948'),
    ('Emily', 'Turner', '789 Birch Road', '2', 'Emily789@gmail.com', '8329237482'),
    ('Mason', 'Reynolds', '234 Cedar Boulevard', '3', 'Masondagoat@yahoo.com', '3488248823'),
    ('Lucas', 'Mitchell', '567 Elm Street', '4', 'Lucasskywalker@aol.om', '2803827492'),
    ('Kim', 'Thompson', '901 Redwood Lane', '5', 'MsThompson@yahoo.com', '3231237364');
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

-- Create the roles
CREATE ROLE Librarian;
CREATE ROLE Administrator;
CREATE ROLE AccountUser;

-- Grant permissions to the Librarian role
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO Librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON AccountUsers TO Librarian;
GRANT SELECT, INSERT, UPDATE ON Transactions TO Librarian;

-- Grant permissions to the Administrator role
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Members TO Administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Transactions TO Administrator;

-- Grant permissions to the AccountUser role
GRANT SELECT ON Books TO AccountUser;
GRANT SELECT ON Transactions TO LibraryUser;

-- Optionally, grant additional permissions as needed

-- Assign roles to users
-- Replace 'username' with the actual usernames of your Librarian, Administrator, and AccountUser
GRANT Librarian TO Gerg,Thomas;
GRANT Administrator TO Destiny,Bannks;
GRANT AccountUser TO Rodney,Stewart;

-- Add more roles to Assign Roles as needed
