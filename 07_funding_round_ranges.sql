SELECT funded_at,
       MAX(raised_amount) AS max_raised_amount,
       MIN(raised_amount) AS min_raised_amount
FROM funding_round
GROUP BY funded_at
HAVING MIN(raised_amount) <> 0
   AND MIN(raised_amount) <> MAX(raised_amount);
