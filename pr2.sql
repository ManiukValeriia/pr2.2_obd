CREATE DATABASE IF NOT EXISTS SwineFarm;
USE SwineFarm;

-- Таблиця для зберігання інформації про тварин
CREATE TABLE Animal (
    AnimalID INT AUTO_INCREMENT PRIMARY KEY,
    Nickname VARCHAR(50) UNIQUE NOT NULL,
    Gender ENUM('male', 'female') NOT NULL,
    Age INT NOT NULL,
    Purpose ENUM('slaughter', 'sale', 'breeding') NOT NULL,
    PigletsCount INT DEFAULT NULL,
    PigletsBirthDate DATE DEFAULT NULL,
    FatherNickname VARCHAR(50) DEFAULT 'unknown',
    MotherNickname VARCHAR(50) DEFAULT 'unknown'
);

-- Таблиця зберігання інформації про вакцинацію
CREATE TABLE Vaccination (
    VaccinationID INT AUTO_INCREMENT PRIMARY KEY,
    AnimalID INT NOT NULL,
    VaccineName VARCHAR(50) NOT NULL,
    VaccinationDate DATE NOT NULL,
    FOREIGN KEY (AnimalID) REFERENCES Animal(AnimalID) ON DELETE CASCADE
);

-- Таблиця для зберігання інформації про доглядачів за свинею
CREATE TABLE Caretaker (
    CaretakerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) UNIQUE NOT NULL,
    AssignedAnimalID INT NOT NULL,
    FOREIGN KEY (AssignedAnimalID) REFERENCES Animal(AnimalID) ON DELETE CASCADE
);

-- Таблиця для зберігання інформації про корм
CREATE TABLE Feed (
    FeedID INT AUTO_INCREMENT PRIMARY KEY,
    FeedName VARCHAR(50) NOT NULL,
    AnimalID INT NOT NULL,
    Month VARCHAR(10) NOT NULL,
    Quantity DECIMAL(5, 2) NOT NULL, -- Кількість корма
    FOREIGN KEY (AnimalID) REFERENCES Animal(AnimalID) ON DELETE CASCADE
);

-- Таблиця для зберігання інформації про вимірювання ваги
CREATE TABLE WeightMeasurement (
    MeasurementID INT AUTO_INCREMENT PRIMARY KEY,
    AnimalID INT NOT NULL,
    Date DATE NOT NULL,
    Weight DECIMAL(5, 2) NOT NULL, -- Вага тварини
    FOREIGN KEY (AnimalID) REFERENCES Animal(AnimalID) ON DELETE CASCADE
);

-- Таблиця для зберігання інформації про сімейство тварин
CREATE TABLE Family (
    FamilyID INT AUTO_INCREMENT PRIMARY KEY,
    AnimalID INT NOT NULL,
    FatherID INT DEFAULT NULL,
    MotherID INT DEFAULT NULL,
    FOREIGN KEY (AnimalID) REFERENCES Animal(AnimalID) ON DELETE CASCADE,
    FOREIGN KEY (FatherID) REFERENCES Animal(AnimalID) ON DELETE SET NULL,
    FOREIGN KEY (MotherID) REFERENCES Animal(AnimalID) ON DELETE SET NULL
);

-- Додавання тварин
INSERT INTO Animal (Nickname, Gender, Age, Purpose, PigletsCount, PigletsBirthDate, FatherNickname, MotherNickname)
VALUES
    ('Max', 'male', 4, 'sale', NULL, NULL, 'unknown', 'unknown'),
    ('Bella', 'female', 3, 'breeding', 3, '2025-02-14', 'Max', 'unknown'),
    ('Olga', 'female', 5, 'slaughter', NULL, NULL, 'unknown', 'unknown'),
    ('Lucy', 'female', 4, 'breeding', 4, '2025-03-20', 'Boris', 'Luna'),
    ('Oscar', 'male', 3, 'sale', NULL, NULL, 'unknown', 'Olga'),
    ('Mia', 'female', 3, 'breeding', 2, '2025-04-15', 'Boris', 'Bella'),
    ('Boris', 'male', 3, 'breeding', NULL, NULL, 'unknown', 'unknown'),
    ('Charlie', 'male', 2, 'breeding', NULL, NULL, 'Max', 'Luna'),
    ('Sophie', 'female', 2, 'breeding', 6, '2025-02-10', 'Charlie', 'Mia'),
    ('Jack', 'male', 3, 'slaughter', NULL, NULL, 'Oscar', 'Lucy'),
    ('Molly', 'female', 2, 'breeding', 5, '2025-06-01', 'Boris', 'Olga'),
    ('Daisy', 'female', 4, 'breeding', 3, '2025-05-15', 'Max', 'Bella'),
    ('Harry', 'male', 2, 'sale', NULL, NULL, 'unknown', 'Molly'),
    ('George', 'male', 3, 'breeding', NULL, NULL, 'Charlie', 'Sophie'),
    ('Luna', 'female', 2, 'breeding', 5, '2025-01-01', 'unknown', 'unknown'),
    ('Lola', 'female', 3, 'breeding', 4, '2025-03-30', 'Max', 'unknown'),
    ('Rosie', 'female', 4, 'breeding', 2, '2025-04-20', 'Boris', 'unknown'),
    ('Henry', 'male', 3, 'slaughter', NULL, NULL, 'George', 'Daisy'),
    ('Emma', 'female', 2, 'breeding', 3, '2025-01-22', 'Jack', 'Molly'),
    ('Ellie', 'female', 3, 'breeding', 2, '2025-03-01', 'Oscar', 'Lucy'),
    ('Toby', 'male', 4, 'breeding', NULL, NULL, 'Boris', 'Bella'),
    ('Ruby', 'female', 3, 'breeding', 3, '2025-05-05', 'unknown', 'unknown'),
    ('Archie', 'male', 2, 'sale', NULL, NULL, 'unknown', 'Sophie'),
    ('Lily', 'female', 4, 'breeding', 5, '2025-02-25', 'Max', 'unknown'),
    ('Sam', 'male', 3, 'sale', NULL, NULL, 'Boris', 'Daisy'),
    ('Chloe', 'female', 2, 'breeding', 4, '2025-03-10', 'Oscar', 'Mia'),
    ('Ben', 'male', 3, 'sale', NULL, NULL, 'unknown', 'unknown'),
    ('Tom', 'male', 4, 'breeding', NULL, NULL, 'Boris', 'Ellie'),
    ('Grace', 'female', 3, 'breeding', 2, '2025-04-17', 'Jack', 'Lily'),
    ('Ella', 'female', 2, 'breeding', 3, '2025-06-12', 'George', 'unknown'),
    ('Leo', 'male', 3, 'slaughter', NULL, NULL, 'Boris', 'Daisy'),
    ('Sophia', 'female', 4, 'breeding', 4, '2025-05-25', 'Charlie', 'Lola'),
    ('James', 'male', 2, 'sale', NULL, NULL, 'Max', 'Sophie'),
    ('Ava', 'female', 3, 'breeding', 5, '2025-01-20', 'unknown', 'Luna'),
    ('Isla', 'female', 4, 'breeding', 2, '2025-06-30', 'unknown', 'unknown'),
    ('Zoe', 'female', 3, 'breeding', 3, '2025-04-05', 'Boris', 'Mia'),
    ('Finn', 'male', 3, 'sale', NULL, NULL, 'Oscar', 'Ellie'),
    ('Jake', 'male', 4, 'breeding', NULL, NULL, 'Max', 'Lily'),
    ('Anna', 'female', 2, 'breeding', 4, '2025-03-15', 'Charlie', 'Ruby'),
    ('Poppy', 'female', 3, 'breeding', 3, '2025-04-20', 'unknown', 'unknown'),
    ('Rocky', 'male', 2, 'sale', NULL, NULL, 'unknown', 'unknown'),
    ('Maggie', 'female', 2, 'sale', NULL, NULL, 'unknown', 'Luna'),
    ('Zara', 'female', 4, 'breeding', 3, '2025-04-25', 'Boris', 'Zoe'),
    ('Bruce', 'male', 3, 'sale', NULL, NULL, 'Oscar', 'Mia'),
    ('Tina', 'female', 2, 'breeding', 4, '2025-06-05', 'Charlie', 'Ruby'),
    ('Hugo', 'male', 3, 'sale', NULL, NULL, 'Max', 'Daisy'),
    ('Vera', 'female', 4, 'breeding', 5, '2025-07-10', 'Boris', 'Lily'),
    ('Benji', 'male', 2, 'breeding', NULL, NULL, 'Charlie', 'Grace'),
    ('Milly', 'female', 3, 'breeding', 4, '2025-05-10', 'Max', 'Sophie'),
    ('Ivy', 'female', 3, 'breeding', 3, '2025-08-12', 'Max', 'Chloe');
    
-- Додавання вакцинацій
INSERT INTO Vaccination (AnimalID, VaccineName, VaccinationDate)
VALUES
    ('1', 'Porcine Parvovirus Vaccine', '2024-01-15'),
    ('1', 'Swine Influenza Vaccine', '2024-12-28'),
    ('2', 'Porcine Parvovirus Vaccine', '2024-02-18'),
    ('2', 'Erysipelas Vaccine', '2024-08-25'),
    ('3', 'Erysipelas Vaccine', '2024-03-22'),
    ('3', 'Swine Influenza Vaccine', '2024-06-12'),
    ('4', 'Swine Influenza Vaccine', '2024-04-05'),
    ('4', 'Porcine Parvovirus Vaccine', '2024-07-10'),
    ('5', 'Porcine Parvovirus Vaccine', '2024-05-19'),
    ('5', 'Erysipelas Vaccine', '2024-08-25'),
    ('6', 'Swine Influenza Vaccine', '2024-06-11'),
    ('6', 'Porcine Parvovirus Vaccine', '2024-09-04'),
    ('7', 'Erysipelas Vaccine', '2024-07-15'),
    ('7', 'Swine Influenza Vaccine', '2024-12-05'),
    ('8', 'Swine Influenza Vaccine', '2024-08-03'),
    ('8', 'Porcine Parvovirus Vaccine', '2024-11-18'),
    ('9', 'Porcine Parvovirus Vaccine', '2024-09-14'),
    ('9', 'Erysipelas Vaccine', '2024-11-02'),
    ('10', 'Erysipelas Vaccine', '2024-10-20'),
    ('10', 'Swine Influenza Vaccine', '2024-12-20'),
    ('11', 'Swine Influenza Vaccine', '2024-11-03'),
    ('11', 'Porcine Parvovirus Vaccine', '2024-01-16'),
    ('12', 'Porcine Parvovirus Vaccine', '2024-12-01'),
    ('12', 'Erysipelas Vaccine', '2024-04-22'),
    ('13', 'Erysipelas Vaccine', '2024-11-25'),
    ('13', 'Swine Influenza Vaccine', '2024-03-10'),
    ('14', 'Swine Influenza Vaccine', '2024-10-18'),
    ('14', 'Porcine Parvovirus Vaccine', '2024-05-19'),
    ('15', 'Porcine Parvovirus Vaccine', '2024-11-01'),
    ('15', 'Swine Influenza Vaccine', '2024-12-15'),
    ('16', 'Erysipelas Vaccine', '2024-09-10'),
    ('16', 'Porcine Parvovirus Vaccine', '2024-08-05'),
    ('17', 'Swine Influenza Vaccine', '2024-07-20'),
    ('17', 'Erysipelas Vaccine', '2024-06-17'),
    ('18', 'Porcine Parvovirus Vaccine', '2024-05-09'),
    ('18', 'Swine Influenza Vaccine', '2024-11-10'),
    ('19', 'Erysipelas Vaccine', '2024-04-25'),
    ('19', 'Swine Influenza Vaccine', '2024-12-10'),
    ('20', 'Porcine Parvovirus Vaccine', '2024-02-21'),
    ('20', 'Swine Influenza Vaccine', '2024-03-16'),
    ('21', 'Porcine Parvovirus Vaccine', '2024-03-01'),
    ('21', 'Swine Influenza Vaccine', '2024-06-25'),
    ('22', 'Swine Influenza Vaccine', '2024-07-02'),
    ('22', 'Porcine Parvovirus Vaccine', '2024-10-13'),
    ('23', 'Swine Influenza Vaccine', '2024-01-20'),
    ('23', 'Erysipelas Vaccine', '2024-09-03'),
    ('24', 'Porcine Parvovirus Vaccine', '2024-08-21'),
    ('24', 'Swine Influenza Vaccine', '2024-12-22'),
    ('25', 'Swine Influenza Vaccine', '2024-10-14'),
    ('25', 'Porcine Parvovirus Vaccine', '2024-06-05'),
    ('26', 'Erysipelas Vaccine', '2024-07-12'),
    ('26', 'Swine Influenza Vaccine', '2024-11-11'),
    ('27', 'Porcine Parvovirus Vaccine', '2024-05-30'),
    ('27', 'Swine Influenza Vaccine', '2024-04-19'),
    ('28', 'Porcine Parvovirus Vaccine', '2024-01-12'),
    ('28', 'Erysipelas Vaccine', '2024-03-25'),
    ('29', 'Swine Influenza Vaccine', '2024-09-30'),
    ('29', 'Porcine Parvovirus Vaccine', '2024-06-18'),
    ('30', 'Erysipelas Vaccine', '2024-08-15'),
    ('30', 'Swine Influenza Vaccine', '2024-12-08'),
    ('31', 'Swine Influenza Vaccine', '2024-07-30'),
    ('31', 'Erysipelas Vaccine', '2024-05-05'),
    ('32', 'Porcine Parvovirus Vaccine', '2024-04-07'),
    ('32', 'Swine Influenza Vaccine', '2024-10-09'),
    ('33', 'Erysipelas Vaccine', '2024-06-03'),
    ('33', 'Porcine Parvovirus Vaccine', '2024-12-04'),
    ('34', 'Swine Influenza Vaccine', '2024-03-28'),
    ('34', 'Porcine Parvovirus Vaccine', '2024-07-17'),
    ('35', 'Porcine Parvovirus Vaccine', '2024-12-05'),
    ('35', 'Swine Influenza Vaccine', '2024-05-10'),
    ('36', 'Erysipelas Vaccine', '2024-09-07'),
    ('36', 'Swine Influenza Vaccine', '2024-02-22'),
    ('37', 'Porcine Parvovirus Vaccine', '2024-08-30'),
    ('37', 'Swine Influenza Vaccine', '2024-11-12'),
    ('38', 'Erysipelas Vaccine', '2024-04-11'),
    ('38', 'Swine Influenza Vaccine', '2024-03-05'),
    ('39', 'Swine Influenza Vaccine', '2024-10-22'),
    ('39', 'Porcine Parvovirus Vaccine', '2024-09-09'),
    ('40', 'Porcine Parvovirus Vaccine', '2024-06-29'),
    ('40', 'Swine Influenza Vaccine', '2024-07-11'),
    ('41', 'Porcine Parvovirus Vaccine', '2024-08-01'),
    ('41', 'Swine Influenza Vaccine', '2024-02-12'),
    ('42', 'Swine Influenza Vaccine', '2024-05-24'),
    ('42', 'Porcine Parvovirus Vaccine', '2024-11-15'),
    ('43', 'Erysipelas Vaccine', '2024-09-24'),
    ('43', 'Swine Influenza Vaccine', '2024-06-10'),
    ('44', 'Porcine Parvovirus Vaccine', '2024-01-28'),
    ('44', 'Swine Influenza Vaccine', '2024-12-12'),
    ('45', 'Swine Influenza Vaccine', '2024-03-14'),
    ('45', 'Porcine Parvovirus Vaccine', '2024-07-19'),
    ('46', 'Porcine Parvovirus Vaccine', '2024-10-30'),
    ('46', 'Swine Influenza Vaccine', '2024-08-12'),
    ('47', 'Swine Influenza Vaccine', '2024-06-08'),
    ('47', 'Erysipelas Vaccine', '2024-05-26'),
    ('48', 'Porcine Parvovirus Vaccine', '2024-11-22'),
    ('48', 'Swine Influenza Vaccine', '2024-02-02'),
    ('49', 'Erysipelas Vaccine', '2024-04-19'),
    ('49', 'Swine Influenza Vaccine', '2024-12-18'),
    ('50', 'Swine Influenza Vaccine', '2024-01-30'),
    ('50', 'Porcine Parvovirus Vaccine', '2024-11-09');
    
-- Додавання доглядачів
INSERT INTO Caretaker (FullName, AssignedAnimalID)
VALUES
('John Doe', 1),
('Jane Smith', 2),
('Michael Johnson', 3),
('Sarah Williams', 4),
('David Brown', 5),
('Emily Davis', 6),
('Daniel Wilson', 7),
('Laura Moore', 8),
('James Taylor', 9),
('Anna Anderson', 10),
('Robert Martinez', 11),
('Sophia Harris', 12),
('William Clark', 13),
('Olivia Lewis', 14),
('Charles Young', 15),
('Mia Hall', 16),
('Joseph Allen', 17),
('Ava King', 18),
('Ethan Wright', 19),
('Isabella Scott', 20),
('Alexander Green', 21),
('Amelia Adams', 22),
('Benjamin Baker', 23),
('Ella Gonzalez', 24),
('Lucas Perez', 25),
('Lily Nelson', 26),
('Henry Carter', 27),
('Chloe Mitchell', 28),
('Samuel Roberts', 29),
('Victoria Walker', 30),
('Daniel Hernandez', 31),
('Grace Lee', 32),
('Nathaniel Gonzalez', 33),
('Samantha Wilson', 34),
('Dylan Morgan', 35),
('Charlotte White', 36),
('Jackson Harris', 37),
('Madison Thompson', 38),
('Oliver King', 39),
('Harper Adams', 40),
('Jack Nelson', 41),
('Mason Campbell', 42),
('Sophia Wright', 43),
('Liam Evans', 44),
('Megan Mitchell', 45),
('Chloe Turner', 46),
('Isaac Thomas', 47),
('Evelyn Robinson', 48),
('Leo Rodriguez', 49),
('Mackenzie Green', 50);
    
-- Додавання інформації про корм
INSERT INTO Feed (FeedName, AnimalID, Month, Quantity)
VALUES
('Corn', 1, 'December', 25.00),
('Corn', 1, 'January', 30.00),
('Wheat', 2, 'December', 22.50),
('Wheat', 2, 'January', 27.50),
('Soy', 3, 'December', 20.00),
('Soy', 3, 'January', 25.00),
('Barley', 4, 'December', 18.50),
('Barley', 4, 'January', 23.00),
('Oats', 5, 'December', 21.00),
('Oats', 5, 'January', 26.00),
('Corn', 6, 'December', 24.50),
('Corn', 6, 'January', 29.00),
('Wheat', 7, 'December', 23.00),
('Wheat', 7, 'January', 28.00),
('Soy', 8, 'December', 19.50),
('Soy', 8, 'January', 24.00),
('Barley', 9, 'December', 17.00),
('Barley', 9, 'January', 22.00),
('Oats', 10, 'December', 20.50),
('Oats', 10, 'January', 25.50),
('Corn', 11, 'December', 25.50),
('Corn', 11, 'January', 30.50),
('Wheat', 12, 'December', 21.50),
('Wheat', 12, 'January', 26.50),
('Soy', 13, 'December', 18.00),
('Soy', 13, 'January', 23.50),
('Barley', 14, 'December', 22.50),
('Barley', 14, 'January', 27.00),
('Oats', 15, 'December', 19.00),
('Oats', 15, 'January', 24.50),
('Corn', 16, 'December', 26.00),
('Corn', 16, 'January', 31.00),
('Wheat', 17, 'December', 20.00),
('Wheat', 17, 'January', 25.00),
('Soy', 18, 'December', 22.00),
('Soy', 18, 'January', 27.00),
('Barley', 19, 'December', 21.50),
('Barley', 19, 'January', 26.50),
('Oats', 20, 'December', 23.00),
('Oats', 20, 'January', 28.00),
('Corn', 21, 'December', 27.50),
('Corn', 21, 'January', 32.00),
('Wheat', 22, 'December', 24.00),
('Wheat', 22, 'January', 29.00),
('Soy', 23, 'December', 21.00),
('Soy', 23, 'January', 26.00),
('Barley', 24, 'December', 18.00),
('Barley', 24, 'January', 23.00),
('Oats', 25, 'December', 19.50),
('Oats', 25, 'January', 24.00),
('Corn', 26, 'December', 28.00),
('Corn', 26, 'January', 33.00),
('Wheat', 27, 'December', 22.50),
('Wheat', 27, 'January', 27.00),
('Soy', 28, 'December', 19.00),
('Soy', 28, 'January', 24.50),
('Barley', 29, 'December', 25.00),
('Barley', 29, 'January', 30.00),
('Oats', 30, 'December', 20.00),
('Oats', 30, 'January', 25.00),
('Corn', 31, 'December', 29.50),
('Corn', 31, 'January', 34.50),
('Wheat', 32, 'December', 24.50),
('Wheat', 32, 'January', 29.50),
('Soy', 33, 'December', 20.50),
('Soy', 33, 'January', 25.50),
('Barley', 34, 'December', 23.00),
('Barley', 34, 'January', 28.00),
('Oats', 35, 'December', 21.50),
('Oats', 35, 'January', 26.50),
('Corn', 36, 'December', 30.00),
('Corn', 36, 'January', 35.00),
('Wheat', 37, 'December', 27.00),
('Wheat', 37, 'January', 32.00),
('Soy', 38, 'December', 22.00),
('Soy', 38, 'January', 27.00),
('Barley', 39, 'December', 25.50),
('Barley', 39, 'January', 30.50),
('Oats', 40, 'December', 23.50),
('Oats', 40, 'January', 28.50),
('Corn', 41, 'December', 31.00),
('Corn', 41, 'January', 36.00),
('Wheat', 42, 'December', 25.00),
('Wheat', 42, 'January', 30.00),
('Soy', 43, 'December', 21.00),
('Soy', 43, 'January', 26.00),
('Barley', 44, 'December', 27.00),
('Barley', 44, 'January', 32.00),
('Oats', 45, 'December', 24.00),
('Oats', 45, 'January', 29.00),
('Corn', 46, 'December', 32.50),
('Corn', 46, 'January', 37.50),
('Wheat', 47, 'December', 28.00),
('Wheat', 47, 'January', 33.00),
('Soy', 48, 'December', 23.50),
('Soy', 48, 'January', 28.50),
('Barley', 49, 'December', 30.00),
('Barley', 49, 'January', 35.00),
('Oats', 50, 'December', 27.50),
('Oats', 50, 'January', 32.50);
    
-- Додавання інформації зважування
INSERT INTO WeightMeasurement (AnimalID, Date, Weight)
VALUES
(1, '2024-12-31', 120.50),
(1, '2025-01-31', 125.00),
(2, '2024-12-31', 115.75),
(2, '2025-01-31', 119.25),
(3, '2024-12-31', 130.00),
(3, '2025-01-31', 133.50),
(4, '2024-12-31', 110.25),
(4, '2025-01-31', 112.75),
(5, '2024-12-31', 105.50),
(5, '2025-01-31', 108.00),
(6, '2024-12-31', 118.00),
(6, '2025-01-31', 122.50),
(7, '2024-12-31', 123.00),
(7, '2025-01-31', 126.50),
(8, '2024-12-31', 113.25),
(8, '2025-01-31', 116.75),
(9, '2024-12-31', 117.50),
(9, '2025-01-31', 121.00),
(10, '2024-12-31', 125.75),
(10, '2025-01-31', 129.00),
(11, '2024-12-31', 132.00),
(11, '2025-01-31', 136.50),
(12, '2024-12-31', 120.75),
(12, '2025-01-31', 124.25),
(13, '2024-12-31', 118.50),
(13, '2025-01-31', 122.00),
(14, '2024-12-31', 112.00),
(14, '2025-01-31', 115.50),
(15, '2024-12-31', 110.50),
(15, '2025-01-31', 113.00),
(16, '2024-12-31', 122.00),
(16, '2025-01-31', 125.50),
(17, '2024-12-31', 126.00),
(17, '2025-01-31', 130.00),
(18, '2024-12-31', 116.00),
(18, '2025-01-31', 120.50),
(19, '2024-12-31', 119.75),
(19, '2025-01-31', 123.25),
(20, '2024-12-31', 113.50),
(20, '2025-01-31', 117.00),
(21, '2024-12-31', 118.75),
(21, '2025-01-31', 122.25),
(22, '2024-12-31', 121.00),
(22, '2025-01-31', 125.00),
(23, '2024-12-31', 116.50),
(23, '2025-01-31', 120.00),
(24, '2024-12-31', 122.50),
(24, '2025-01-31', 127.00),
(25, '2024-12-31', 124.25),
(25, '2025-01-31', 128.75),
(26, '2024-12-31', 130.50),
(26, '2025-01-31', 134.00),
(27, '2024-12-31', 113.75),
(27, '2025-01-31', 117.25),
(28, '2024-12-31', 115.25),
(28, '2025-01-31', 118.75),
(29, '2024-12-31', 121.50),
(29, '2025-01-31', 126.00),
(30, '2024-12-31', 110.00),
(30, '2025-01-31', 113.50),
(31, '2024-12-31', 124.00),
(31, '2025-01-31', 128.50),
(32, '2024-12-31', 119.25),
(32, '2025-01-31', 122.75),
(33, '2024-12-31', 125.00),
(33, '2025-01-31', 129.50),
(34, '2024-12-31', 118.25),
(34, '2025-01-31', 121.75),
(35, '2024-12-31', 121.00),
(35, '2025-01-31', 125.50),
(36, '2024-12-31', 126.25),
(36, '2025-01-31', 130.75),
(37, '2024-12-31', 122.00),
(37, '2025-01-31', 126.00),
(38, '2024-12-31', 118.75),
(38, '2025-01-31', 122.50),
(39, '2024-12-31', 114.50),
(39, '2025-01-31', 118.00),
(40, '2024-12-31', 120.00),
(40, '2025-01-31', 124.50),
(41, '2024-12-31', 129.00),
(41, '2025-01-31', 133.50),
(42, '2024-12-31', 125.00),
(42, '2025-01-31', 128.50),
(43, '2024-12-31', 116.75),
(43, '2025-01-31', 120.25),
(44, '2024-12-31', 118.50),
(44, '2025-01-31', 122.00),
(45, '2024-12-31', 120.25),
(45, '2025-01-31', 124.00),
(46, '2024-12-31', 130.75),
(46, '2025-01-31', 134.25),
(47, '2024-12-31', 127.50),
(47, '2025-01-31', 131.00),
(48, '2024-12-31', 121.00),
(48, '2025-01-31', 125.50),
(49, '2024-12-31', 114.75),
(49, '2025-01-31', 118.25),
(50, '2024-12-31', 119.00),
(50, '2025-01-31', 123.50);
    
-- Додавання інформації про родини тварин
INSERT INTO Family (AnimalID, FatherID, MotherID)
VALUES
    (2, 1, NULL), -- Bella (батько: Max, мати: невідомо)
    (4, 7, 15), -- Lucy (батько: Boris, мати: Luna)
    (6, 7, 2), -- Mia (батько: Boris, мати: Bella)
    (9, 8, 6), -- Sophie (батько: Charlie, мати: Mia)
    (11, 7, 3), -- Molly (батько: Boris, мати: Olga)
    (12, 1, 2), -- Daisy (батько: Max, мати: Bella)
    (15, NULL, NULL), -- Luna (батько: невідомо, мати: невідомо)
    (16, 1, NULL), -- Lola (батько: Max, мати: невідомо)
    (17, 7, NULL), -- Rosie (батько: Boris, мати: невідомо)
    (19, 10, 11), -- Emma (батько: Jack, мати: Molly)
    (20, 5, 4), -- Ellie (батько: Oscar, мати: Lucy)
    (22, NULL, NULL), -- Ruby (батько: невідомо, мати: невідомо)
    (24, 1, NULL), -- Lily (батько: Max, мати: невідомо)
    (26, 5, 6), -- Chloe (батько: Oscar, мати: Mia)
    (29, 10, 24), -- Grace (батько: Jack, мати: Lily)
    (30, 14, NULL), -- Ella (батько: George, мати: невідомо)
    (32, 8, 16), -- Sophia (батько: Charlie, мати: Lola)
    (34, NULL, 15), -- Ava (батько: невідомо, мати: Luna)
    (35, NULL, NULL), -- Isla (батько: невідомо, мати: невідомо)
    (36, 7, 6), -- Zoe (батько: Boris, мати: Mia)
    (39, 8, 22), -- Anna (батько: Charlie, мати: Ruby)
    (40, NULL, NULL), -- Poppy (батько: невідомо, мати: невідомо)
    (43, 7, 36), -- Zara (батько: Boris, мати: Zoe)
    (45, 8, 22), -- Tina (батько: Charlie, мати: Ruby)
    (47, 7, 24), -- Vera (батько: Boris, мати: Lily)
    (49, 1, 9), -- Milly (батько: Max, мати: Sophie)
    (50, 1, 26); -- Ivy (батько: Max, мати: Chloe)
    
DESCRIBE Animal;
DESCRIBE Vaccination;
DESCRIBE Caretaker;
DESCRIBE Feed;
DESCRIBE WeightMeasurement;
DESCRIBE Family;

SELECT * FROM Animal;
SELECT * FROM Vaccination;
SELECT * FROM Caretaker;
SELECT * FROM Feed;
SELECT * FROM WeightMeasurement;
SELECT * FROM Family;

DROP TABLE Animal;
DROP TABLE Vaccination;
DROP TABLE Caretaker;
DROP TABLE Feed;
DROP TABLE WeightMeasurement;
DROP TABLE Family;

-- WHERE
--  Тварини, які є самками та мають більше трьох поросят
SELECT * FROM Animal
WHERE Gender = 'female' AND PigletsCount > 3;

-- Вакцинації свиней, які отримали вакцину проти свинячого грипу
SELECT * FROM Vaccination
WHERE VaccineName = 'Swine Influenza Vaccine';

-- Тварини, народжених від батька "Max"
SELECT * FROM Animal
WHERE FatherNickname = 'Max';

-- Корм, який був виданий тваринам у січні
SELECT * FROM Feed
WHERE Month = 'January';

-- Доглядачі, закріплені за тваринами з ID більше 10
SELECT * FROM Caretaker
WHERE AssignedAnimalID > 10;

-- WHERE + логічні оператори
-- Тварини, які мають чоловічу стать і народилися після 1 лютого 2025 року
SELECT * FROM Animal 
WHERE Gender = 'male' AND Age > 2;

-- Тварини, які жіночої статі або використовуються для розведення (breeding)
SELECT * FROM Animal
WHERE Gender = 'female' OR Purpose = 'breeding';

-- Тварини, яких годують кормом у січні з кількістю більше 30 кг
SELECT * FROM Feed
WHERE Month = 'January' AND Quantity > 30;

-- Вакцинації, які не є для захисту від свинячого грипу (Swine Influenza Vaccine)
SELECT * FROM Vaccination
WHERE NOT VaccineName = 'Swine Influenza Vaccine';

-- Тварии, які чоловічої статі або використовуються для продажу (sale)
SELECT * FROM Animal
WHERE Gender = 'male' OR Purpose = 'sale';

-- LIKE
-- Тварини, чиї клички починаються на літеру "M"
SELECT * FROM Animal
WHERE Nickname LIKE 'M%';

-- Доглядачі, чиє ім'я містить слово "John"
SELECT * FROM Caretaker
WHERE FullName LIKE '%John%';

-- Тварини, чия кличка закінчується на "a"
SELECT * FROM Animal
WHERE Nickname LIKE '%a';

-- Тварини, яких годували кормом назва якого починається на "C" і містить три символи
SELECT * FROM Feed
WHERE FeedName LIKE 'C___';

-- Тварини, чиї батьки мають кличку, що починається на "B"
SELECT * FROM Animal
WHERE FatherNickname LIKE 'B%' OR MotherNickname LIKE 'B%';

-- JOIN
-- Отримання інформації про свиней, їхні вакцини та дати вакцинації
SELECT a.Nickname, a.Gender, a.Age, v.VaccineName, v.VaccinationDate
FROM Animal a
JOIN Vaccination v ON a.AnimalID = v.AnimalID;

-- Отримання інформації про тварин і їхніх доглядачів
SELECT a.Nickname, a.Gender, a.Age, c.FullName AS CaretakerName
FROM Animal a
JOIN Caretaker c ON a.AnimalID = c.AssignedAnimalID;

-- Отримання інформації про свиней і їхній корм за місяць
SELECT a.Nickname, a.Gender, a.Age, f.FeedName, f.Month, f.Quantity
FROM Animal a
JOIN Feed f ON a.AnimalID = f.AnimalID;

-- Отримання інформації про вимірювання ваги свиней
SELECT a.Nickname, a.Gender, w.Date, w.Weight
FROM Animal a
JOIN WeightMeasurement w ON a.AnimalID = w.AnimalID;

-- Отримання інформації про свиней і їхніх батьків
SELECT a.Nickname AS Animal, a.FatherNickname, a.MotherNickname
FROM Animal a
JOIN Family f ON a.AnimalID = f.AnimalID;

-- LEFT JOIN, RIGHT JOIN, FULL JOIN
-- Вивести всі свині та їхні вакцинації (якщо вони є)
SELECT Animal.Nickname, Vaccination.VaccineName, Vaccination.VaccinationDate
FROM Animal
LEFT JOIN Vaccination ON Animal.AnimalID = Vaccination.AnimalID;

-- Вивести всіх доглядачів та свиней, за якими вони доглядають (якщо є)
SELECT Caretaker.FullName, Animal.Nickname
FROM Caretaker
RIGHT JOIN Animal ON Caretaker.AssignedAnimalID = Animal.AnimalID;

-- Вивести всі свині, їхні ваги та дати вимірювань, навіть якщо для деяких свиней немає записів про вагу
SELECT Animal.Nickname, WeightMeasurement.Weight, WeightMeasurement.Date
FROM Animal
LEFT JOIN WeightMeasurement ON Animal.AnimalID = WeightMeasurement.AnimalID;

-- Вивести всіх доглядачів і корм, які їм призначено, навіть якщо деякі корми не мають призначеного доглядача
SELECT Caretaker.FullName, Feed.FeedName, Feed.Quantity
FROM Caretaker
RIGHT JOIN Feed ON Caretaker.CaretakerID = Feed.AnimalID;

-- Вивести дані про свиней і типи кормів для них, включаючи записи, де для свині немає корму
SELECT Animal.AnimalID, Animal.Nickname, Feed.FeedName, Feed.Quantity
FROM Animal
RIGHT JOIN Feed ON Animal.AnimalID = Feed.AnimalID;

-- SUBQUERY
-- Запит для отримання всіх тварин, які мали вакцинацію проти "Porcine Parvovirus Vaccine" після 1-го травня 2024 року
SELECT Nickname, Gender, Age, Purpose
FROM Animal
WHERE AnimalID IN (
    SELECT AnimalID
    FROM Vaccination
    WHERE VaccineName = 'Porcine Parvovirus Vaccine' AND VaccinationDate > '2024-05-01'
);

-- Запит для отримання всіх свиней, яких годували кормом з назвою "Corn" у січні
SELECT Nickname, Gender, Age
FROM Animal
WHERE AnimalID IN (
    SELECT AnimalID
    FROM Feed
    WHERE FeedName = 'Corn' AND Month = 'January'
);

-- Запит для отримання свиней, яких вакцинували проти "Erysipelas Vaccine", але вони не були вакциновані проти "Swine Influenza Vaccine"
SELECT Nickname, Gender, Age
FROM Animal
WHERE AnimalID IN (
    SELECT AnimalID
    FROM Vaccination
    WHERE VaccineName = 'Erysipelas Vaccine'
)
AND AnimalID NOT IN (
    SELECT AnimalID
    FROM Vaccination
    WHERE VaccineName = 'Swine Influenza Vaccine'
);

-- Запит для отримання всіх свиней, які мають кількість поросят більше, ніж середнє значення по всіх свинях
SELECT Nickname, PigletsCount
FROM Animal
WHERE PigletsCount > (
    SELECT AVG(PigletsCount)
    FROM Animal
    WHERE PigletsCount IS NOT NULL
);

-- Запит для отримання всіх тварин, які мають вакцину "Swine Influenza Vaccine"
SELECT Nickname
FROM Animal
WHERE AnimalID IN (
    SELECT AnimalID
    FROM Vaccination
    WHERE VaccineName = 'Swine Influenza Vaccine'
);

-- Оператор GROUP BY та умова HAVING у поєднанні з JOIN
-- Загальна кількість корму для кожної свині по місяцях, де кількість корму більше ніж 25
SELECT f.Month, f.AnimalID, SUM(f.Quantity) AS TotalFeed
FROM Feed f
JOIN Animal a ON f.AnimalID = a.AnimalID
GROUP BY f.Month, f.AnimalID
HAVING SUM(f.Quantity) > 25;

-- Середня вага свиней для кожного батька, де середня вага більше ніж 50 кг
SELECT a.FatherNickname, AVG(w.Weight) AS AverageWeight
FROM WeightMeasurement w
JOIN Animal a ON w.AnimalID = a.AnimalID
GROUP BY a.FatherNickname
HAVING AVG(w.Weight) > 50;

-- Кількість свиней з певним батьком, у яких вага більше 110 кг
SELECT a.FatherNickname, COUNT(*) AS NumberOfAnimals
FROM Animal a
JOIN WeightMeasurement w ON a.AnimalID = w.AnimalID
GROUP BY a.FatherNickname
HAVING AVG(w.Weight) > 110;

-- Кількість свиней за кожним кормом, де середнє споживання корму більше 26 кг
SELECT f.FeedName, COUNT(a.AnimalID) AS TotalAnimals
FROM Feed f
JOIN Animal a ON f.AnimalID = a.AnimalID
GROUP BY f.FeedName
HAVING AVG(f.Quantity) > 26;

-- Запит на середню вагу тварин, які проходили вакцинацію "Swine Influenza Vaccine"
SELECT a.Purpose, AVG(w.Weight) AS AvgWeight
FROM Animal a
JOIN WeightMeasurement w ON a.AnimalID = w.AnimalID
JOIN Vaccination v ON a.AnimalID = v.AnimalID
WHERE v.VaccineName = 'Swine Influenza Vaccine'
GROUP BY a.Purpose
HAVING AVG(w.Weight) > 122;

-- Комбінування JOIN, вкладених запитів, групування даних та складних умов фільтрації
-- Запит для отримання інформації про свиней та їх вакцини
SELECT a.Nickname, v.VaccineName, v.VaccinationDate
FROM Animal a
JOIN Vaccination v ON a.AnimalID = v.AnimalID
WHERE a.Purpose = 'breeding'
ORDER BY v.VaccinationDate DESC;

-- Запит для отримання доглядачів, які відповідають за свиней старше 4 років, із зазначенням кількості таких свиней
SELECT c.FullName, COUNT(c.AssignedAnimalID) AS NumberOfAnimals
FROM Caretaker c
JOIN Animal a ON c.AssignedAnimalID = a.AnimalID
WHERE a.Age > 3
GROUP BY c.FullName
HAVING COUNT(c.AssignedAnimalID) > 0;

-- Запит для знаходження середньої ваги свиней з розведення, зважених за останні 2 місяці
SELECT a.Nickname, AVG(w.Weight) AS AverageWeight
FROM Animal a
JOIN WeightMeasurement w ON a.AnimalID = w.AnimalID
WHERE a.Purpose = 'breeding' AND w.Date >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
GROUP BY a.Nickname;

-- Запит для отримання свиней та їх батьків, які народилися протягом останнього року
SELECT a.Nickname, f.FatherID, f.MotherID
FROM Animal a
JOIN Family f ON a.AnimalID = f.AnimalID
WHERE a.PigletsBirthDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Запит для отримання доглядачів, які відповідають за свиней, якщо батько свині відомий
SELECT c.FullName, a.Nickname
FROM Caretaker c
JOIN Animal a ON c.AssignedAnimalID = a.AnimalID
JOIN Family f ON a.AnimalID = f.AnimalID
WHERE f.FatherID IS NOT NULL
ORDER BY c.FullName;

-- Комбінація WHERE та JOIN
-- Отримання всіх свиней, за якими закріплено доглядача, та інформація про їхній вік і стать
SELECT a.Nickname, a.Age, a.Gender, c.FullName AS Caretaker
FROM Animal a
JOIN Caretaker c ON a.AnimalID = c.AssignedAnimalID
WHERE a.Age > 3;

-- Отримання свиней, які отримали вакцину "Porcine Parvovirus Vaccine"
SELECT a.Nickname, v.VaccineName, v.VaccinationDate
FROM Animal a
JOIN Vaccination v ON a.AnimalID = v.AnimalID
WHERE v.VaccineName = 'Porcine Parvovirus Vaccine';

-- Отримання інформації про корм, який дається свиням у січні
SELECT a.Nickname, f.FeedName, f.Quantity, f.Month
FROM Animal a
JOIN Feed f ON a.AnimalID = f.AnimalID
WHERE f.Month = 'January';

-- Отримання всіх свиней з інформацією про їхній вік та батьків, якщо вони мають батька
SELECT a.Nickname, a.Age, fa.Nickname AS FatherNickname
FROM Animal a
JOIN Family f ON a.AnimalID = f.AnimalID
JOIN Animal fa ON f.FatherID = fa.AnimalID
WHERE f.FatherID IS NOT NULL;

-- Отримання свиней та їхніх доглядачів, де свині призначені для розведення
SELECT a.Nickname, c.FullName AS Caretaker, a.Purpose
FROM Animal a
JOIN Caretaker c ON a.AnimalID = c.AssignedAnimalID
WHERE a.Purpose = 'breeding';