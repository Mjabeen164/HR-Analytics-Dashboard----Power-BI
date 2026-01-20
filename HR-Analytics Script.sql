-- Workforce Overview
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_employees,
    SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female_employees,
    SUM(CASE WHEN employment_status = 'On Service' THEN 1 ELSE 0 END) AS active_employees,
    SUM(CASE WHEN employment_status = 'Retrenched' THEN 1 ELSE 0 END) AS retrenched_employees
FROM hr_employee_data;

-- Promotion Eligibility Analysis
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN promotion_due = 'Yes' THEN 1 ELSE 0 END) AS due_for_promotion,
    SUM(CASE WHEN promotion_due = 'No' THEN 1 ELSE 0 END) AS not_due_for_promotion,
    ROUND(
        SUM(CASE WHEN promotion_due = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS promotion_due_percentage
FROM hr_employee_data;

-- Service Year (Tenure) Distribution
SELECT
    service_years,
    COUNT(*) AS employee_count
FROM hr_employee_data
GROUP BY service_years
ORDER BY employee_count DESC;

-- Employee Level Distribution
SELECT
    employee_level,
    COUNT(*) AS employee_count
FROM hr_employee_data
GROUP BY employee_level
ORDER BY employee_level;
