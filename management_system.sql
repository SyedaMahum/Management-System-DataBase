ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mahum1234';

flush privileges;



create database management;
use management;

## creating tables in new database ##

create table student
(
student_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
email VARCHAR(255),  
username VARCHAR(255) UNIQUE, 
password VARCHAR(255) UNIQUE, 
dietary_preferences VARCHAR(255) , 
family_members INT DEFAULT 0
);

create table teachers
(
teacher_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE , 
family_members INT DEFAULT 0
);

create table  announcements
(
announcement_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
title VARCHAR(255),
content VARCHAR(255),
date_posted DATE 
);

create table  menu_items
(
menu_item_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(255), 
itemname VARCHAR(255),
price DECIMAL(10,2),
votes INT DEFAULT 0 
);

create table performance
(
performance_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
performance_type  VARCHAR(255),           #('dance', 'music', 'singing', 'other')
duration INT , 
special_requirements VARCHAR(255),
votes INT DEFAULT 0
);

create table rehearsals
(
rehearsal_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
date DATE,
time TIME,
venue VARCHAR(255)
);

 create table attendance
(
attendance_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
student_id INT,
teacher_id INT,
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
family_attendence INT DEFAULT 0,
arrival_status ENUM('arrived', 'not_arrived')
);

create table budget
(
budget_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
expenses DECIMAL(10,2),
allocated_amount DECIMAL(10,2),
remaining_amount DECIMAL(10,2),
category  VARCHAR(255)
);

create table task 
(
task_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
status VARCHAR(255),
task_description VARCHAR(255),
deadline VARCHAR(255),
assigned_to VARCHAR(255)
);

create table invitation
( 
invitation_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
design  VARCHAR(255),
distribution_method  VARCHAR(255)
);

create table ticket 
(
ticket_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
status ENUM('purchased', 'not_purchased'),
price VARCHAR(255),
purchase_data DATE 

);

create table StudentPerformance 
(
StudentPerformanceID  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
student_id INT,
performance_id INT, 
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (performance_id) REFERENCES performance(performance_id)
);

create table decoration 
(
decore_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
itemname VARCHAR(255),
type VARCHAR(255)
);

# inserting data #

-- Inserting into the 'student' table
INSERT INTO student (name, email, username, password, dietary_preferences, family_members)
VALUES 
('John Doe', 'john.doe@example.com', 'johndoe', 'password123', 'Vegetarian', 2),
('Jane Smith', 'jane.smith@example.com', 'janesmith', 'pass456', 'No dietary restrictions', 1),
('Bob Johnson', 'bob.johnson@example.com', 'bobjohnson', 'securepass', 'Vegan', 3),
('Alice Williams', 'alice.williams@example.com', 'alicewilliams', '12345pass', 'Gluten-free', 0),
('Charlie Brown', 'charlie.brown@example.com', 'charliebrown', 'brown123', 'No dietary restrictions', 1);


-- Inserting into the 'teachers' table
INSERT INTO teachers (name, email, family_members)
VALUES 
('Professor Anderson', 'prof.anderson@example.com', 2),
('Dr. Smith', 'dr.smith@example.com', 1),
('Ms. Johnson', 'ms.johnson@example.com', 0),
('Mr. Davis', 'mr.davis@example.com', 4),
('Mrs. White', 'mrs.white@example.com', 2);

-- Inserting into the 'announcements' table
INSERT INTO announcements (title, content, date_posted)
VALUES 
('Welcome Party Date Change', 'The date for the welcome party has been changed to December 15th.', '2023-11-20'),
('Volunteers Needed', 'We are looking for volunteers to help with event setup. Please sign up!', '2023-11-25'),
('Menu Voting Open', 'Vote for your favorite menu items for the welcome party dinner.', '2023-11-10'),
('Performance Rehearsal Schedule', 'Rehearsal schedule for performance teams is now available. Check your assigned time!', '2023-11-28'),
('Important Notice', 'All students are required to attend a pre-event briefing on December 10th.', '2023-11-15');

-- Inserting into the 'menu_items' table
INSERT INTO menu_items (name, itemname, price, votes)
VALUES 
('Student Choice Platter', 'Mixed Grill', '25.99', '15'),
('Vegan Delight', 'Quinoa Salad', '18.50', '20'),
('Sweet Tooth Paradise', 'Chocolate Fondue', '12.99', '10'),
('Traditional Feast', 'Roast Turkey with Stuffing', '30.00', '18'),
('Mediterranean Flavors', 'Greek Salad', '15.75','25');

-- Inserting into the 'performance' table
INSERT INTO performance (performance_type, duration, special_requirements, votes)
VALUES 
('Dance', 120, 'Indoor stage with special lighting', 25),
('Music', 90, 'Need a grand piano on stage', 15),
('Singing', 75, 'Require a microphone setup', 20),
('Other', 60, 'Surprise act! No special requirements.', 12),
('Dance', 100, 'Outdoor performance with fireworks', 18);

-- Inserting into the 'rehearsals' table
INSERT INTO rehearsals (date, time, venue)
VALUES 
('2023-12-05', '16:00:00', 'Event Hall A'),
('2023-12-08', '18:30:00', 'Outdoor Stage'),
('2023-12-10', '15:00:00', 'Rehearsal Room B'),
('2023-12-12', '17:45:00', 'Event Hall B'),
('2023-12-14', '19:00:00', 'Outdoor Stage');


-- Inserting into the 'attendance' table
INSERT INTO attendance (student_id, teacher_id, family_attendence, arrival_status)
VALUES 
(1, 1, 3, 'arrived'),
(2, 3, 1, 'arrived'),
(3, 2, 2, 'not_arrived'),
(4, 4, 0, 'arrived'),
(5, 5, 1, 'arrived');

-- Inserting into the 'budget' table
INSERT INTO budget (expenses, allocated_amount, remaining_amount, category)
VALUES 
(5000.00, 10000.00, 5000.00, 'Venue Booking'),
(2000.00, 5000.00, 3000.00, 'Catering'),
(1000.00, 1500.00, 500.00, 'Decorations'),
(800.00, 1000.00, 200.00, 'Printing and Invitations'),
(1200.00, 2000.00, 800.00, 'Entertainment');

-- Inserting into the 'task' table
INSERT INTO task (status, task_description, deadline, assigned_to)
VALUES 
('Pending', 'Set up venue decorations', '2023-12-13', 'Decor Team'),
('In Progress', 'Finalize dinner menu', '2023-12-07', 'Menu Team'),
('Completed', 'Send out event invitations', '2023-12-05', 'Invitation Team'),
('Pending', 'Coordinate rehearsal schedule', '2023-12-09', 'Performance Team'),
('In Progress', 'Monitor budget expenditures', '2023-12-15', 'Budget Manager');

-- Inserting into the 'invitation' table
INSERT INTO invitation (design, distribution_method)
VALUES 
('Welcome Party E-Card', 'Email'),
('Classic Invitation Card', 'Printed Mail'),
('Digital Invitation', 'Social Media'),
('Formal Paper Invitation', 'Hand Delivery'),
('Creative Theme Invitation', 'Event Website');

-- Inserting into the 'ticket' table
INSERT INTO ticket (status, price, purchase_data)
VALUES 
('purchased', '20.00', '2023-11-28'),
('not_purchased', '20.00', NULL),
('purchased', '25.00', '2023-11-30'),
('purchased', '15.00', '2023-12-02'),
('not_purchased', '15.00', NULL);

-- Inserting into the 'StudentPerformance' table
INSERT INTO StudentPerformance (student_id, performance_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert some sample data into the "decoration" table
INSERT INTO decoration (itemname, type) VALUES
    ('Flower Vases', 'Centerpiece'),
    ('Balloons', 'Balloon Arch'),
    ('Candles', 'Table Decor'),
    ('Streamers', 'Wall Decor');
    
    SHOW TABLES;

select *
from menu_items;


## queries ## 

#1 --> names of those students and teacher who are bringing more than 1 members as budgeting will effect
SELECT s.name AS student_name, s.family_members AS members, t.name AS teacher_name  , t.family_members AS teacher_members
FROM student s
JOIN attendance a ON s.student_id = a.student_id
JOIN teachers t ON a.teacher_id = t.teacher_id
where s.family_members >1  AND t.family_members > 1;


#2 --> count of teachers and students attending to organize that much things accordingly
SELECT COUNT(DISTINCT s.student_id) AS student_count, COUNT(DISTINCT a.teacher_id) AS teacher_count
FROM student s
LEFT JOIN attendance a ON s.student_id = a.student_id;


#3  --> Getting details of student performances, including student names and performance types by using join 
SELECT sp.StudentPerformanceID, s.name AS student_name, p.performance_type
FROM StudentPerformance sp
JOIN student s ON sp.student_id = s.student_id
JOIN performance p ON sp.performance_id = p.performance_id;



#4 --> total votes for each performance type and the count of distinct students who have participated 
#      in each type of performance.
SELECT p.performance_type, SUM(p.votes) AS total_votes, COUNT(DISTINCT sp.student_id) AS total_students
FROM performance p
JOIN StudentPerformance sp ON p.performance_id = sp.performance_id
GROUP BY p.performance_type;

