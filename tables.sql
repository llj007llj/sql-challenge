CREATE TABLE titles (
    title_id VARCHAR(20) NOT NULL PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_no BIGINT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL, 
    FOREIGN KEY(emp_title_id) REFERENCES titles(title_id) ON DELETE CASCADE
);

CREATE TABLE salaries (
    emp_no BIGINT NOT NULL PRIMARY KEY,
    salary BIGINT NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

CREATE TABLE departments (
    dept_no VARCHAR(20) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no BIGINT NOT NULL,
    dept_no VARCHAR(20) NOT NULL,
    UNIQUE(emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL,
    emp_no BIGINT NOT NULL,
    UNIQUE(dept_no, emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);