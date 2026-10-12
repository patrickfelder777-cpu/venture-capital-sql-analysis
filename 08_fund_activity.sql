SELECT f.*,
       CASE
           WHEN f.invested_companies >= 100 THEN 'high_activity'
           WHEN f.invested_companies >= 20 THEN 'middle_activity'
           ELSE 'low_activity'
       END AS activity_level
FROM fund f;
