SELECT SUM(price_amount) AS total_cash_acquisitions_usd
FROM acquisition
WHERE term_code = 'cash'
  AND EXTRACT(YEAR FROM acquired_at) BETWEEN 2011 AND 2013;
