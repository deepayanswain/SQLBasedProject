CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, department_id) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2022-01-15', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-02-01', 2),
(3, 'Mike', 'Johnson', 'mike.johnson@example.com', '2022-03-10', 3);

-- Sample queries
-- 1. Get all employees with their department names
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 2. Count employees in each department
SELECT d.department_name, COUNT(e.employee_id) as employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 3. Get employees hired in the last 6 months
SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);