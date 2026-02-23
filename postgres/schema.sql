-- 1. Create the Courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    instructor VARCHAR(100),
    price DECIMAL(10, 2) CHECK (price >= 0)
);

-- 2. Create the Students table
CREATE TABLE IF NOT EXISTS students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    course_id INTEGER REFERENCES courses(course_id) ON DELETE SET NULL
);

-- 3. Populate with sample data
INSERT INTO courses (title, instructor, price) VALUES
('Python for Beginners', 'Alex Romanov', 150.00),
('UI/UX Design Essentials', 'Maria Ivanova', 220.50),
('SQL Fundamentals', 'Derek Peterson', 120.00);

INSERT INTO students (full_name, email, course_id) VALUES
('John Doe', 'john.doe@example.com', 1),
('Alice Smith', 'alice.s@example.com', 1),
('Bob Sidorov', 'bob.sid@example.com', 2),
('Elena Kuznets', 'elena.k@example.com', 3);