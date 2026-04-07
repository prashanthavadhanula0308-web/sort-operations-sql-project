-- View all data
SELECT * FROM sort_data;

-- Total units sorted by shift
SELECT shift_name, SUM(units_sorted) AS total_units
FROM sort_data
GROUP BY shift_name;

-- Average productivity (units per hour)
SELECT 
    shift_name,
    SUM(units_sorted) / SUM(hours_worked) AS productivity
FROM sort_data
GROUP BY shift_name;

-- Error rate by shift
SELECT 
    shift_name,
    SUM(errors_count) / SUM(units_sorted) AS error_rate
FROM sort_data
GROUP BY shift_name;

-- Daily performance trend
SELECT 
    date,
    SUM(units_sorted) AS total_units
FROM sort_data
GROUP BY date
ORDER BY date;

-- Top performing day
SELECT 
    date,
    SUM(units_sorted) AS total_units
FROM sort_data
GROUP BY date
ORDER BY total_units DESC
LIMIT 1;
