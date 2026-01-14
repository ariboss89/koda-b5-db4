-- CREATE TABLE IF NOT EXISTS employees (
--     employee_id int generated always as identity primary key,
--     name varchar(255) not null,
--     manager_id int REFERENCES employees(employee_id)
-- );

-- INSERT INTO employees (name, manager_id) VALUES
-- ('Alice', NULL),
-- ('Bob', 1),
-- ('Charlie', 2);

-- SELECT * FROM employees;

-- SELECT e.name AS "Employee", e2.name AS "Manager"
-- FROM employees e
-- LEFT JOIN employees e2 ON e.manager_id = e2.employee_id;

CREATE TABLE IF NOT EXISTS events (
    event_id int generated always as identity primary key,
    event_name varchar(255) not null,
    start_date DATE NOT NULL
);

INSERT INTO events (event_name, start_date) VALUES 
('Event A', '2024-01-01'),
('Event B', '2024-01-05'),
('Event C', '2024-01-10');

SELECT e.event_name, string_agg(e2.event_name, ', ')
FROM events e
LEFT JOIN events e2 ON e2.start_date > e.start_date
GROUP BY e.event_id
ORDER BY e.event_id;
