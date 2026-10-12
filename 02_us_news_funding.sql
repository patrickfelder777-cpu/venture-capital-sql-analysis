SELECT funding_total
FROM company
WHERE country_code = 'USA'
  AND category_code = 'news'
ORDER BY funding_total DESC;
