SELECT AVG(degree_cnt) AS avg_degrees_per_employee
FROM (
    SELECT p.id AS person_id, COUNT(e.degree_type) AS degree_cnt
    FROM people p
    JOIN education e ON e.person_id = p.id
    WHERE p.company_id IN (
        SELECT DISTINCT c.id
        FROM company c
        JOIN funding_round fr ON fr.company_id = c.id
        WHERE c.status = 'closed'
          AND fr.is_first_round = 1
          AND fr.is_last_round = 1
    )
    GROUP BY p.id
) per_person;
