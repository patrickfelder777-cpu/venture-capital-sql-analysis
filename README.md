# Venture Capital Analysis with SQL

**Patrick Felder | TripleTen SQL coursework**

Ten SQL queries exploring startup status, funding, acquisitions, fund activity, and employee education in a relational database. The coursework scenario is an analyst supporting investment research; it is not employment at the fictional research firm described in the assignment.

## Analysis questions

| Query | Business question | SQL techniques |
|---|---|---|
| 01 | How many companies are closed? | COUNT, WHERE |
| 02 | How much funding have US news companies raised individually? | Multiple filters, ORDER BY |
| 03 | What is the total value of cash acquisitions during 2011–2013? | SUM, EXTRACT, date filtering |
| 04 | Which people have usernames starting with Silver? | LIKE, column selection |
| 05 | Which usernames contain money and have surnames starting with K? | LIKE, combined filters |
| 06 | How does recorded company funding differ by country? | SUM, GROUP BY, ORDER BY |
| 07 | Which dates have nonzero, unequal minimum and maximum funding rounds? | MIN, MAX, GROUP BY, HAVING |
| 08 | How can funds be classified by invested-company count? | CASE |
| 09 | How do mean total funding-round counts differ by activity category? | CASE, AVG, ROUND, GROUP BY |
| 10 | What is the average recorded degree count at selected closed startups? | JOIN, subquery, COUNT, AVG |

## Source and execution

The SQL files were transcribed from the supplied screenshots of completed coursework. Query 02's cropped SELECT keyword was reconstructed from its visible selected column and task. The screenshots show completion checkmarks. A later screenshot also supplies the visible output from query 06; the other original result tables have not been captured. Displayed funding values are rounded scientific notation, not full-precision exports.

Run each file in the TripleTen SQL environment, or a compatible PostgreSQL database containing the coursework schema. The original database is not included. Do not run all queries as one batch if the environment accepts only one task at a time.

The referenced tables are `company`, `acquisition`, `people`, `funding_round`, `fund`, and `education`. Their columns must match the source schema. No database connection credentials are included.

## Interpretation limits

- Query 01 counts closed companies; a failure rate requires a denominator and a defined population.
- Query 06 aggregates funding recorded in this dataset. It does not establish current country rankings, returns, or causal effects.
- Query 07 measures a same-date range, not a statistical volatility estimate over time.
- Query 08 sends NULL invested-company counts to low_activity through ELSE. Review missing values before interpreting the categories.
- Query 09 compares total rounds per fund; it does not calculate rounds per portfolio company.
- Query 10's INNER JOIN excludes employees without an education record, and COUNT(degree_type) counts only non-NULL degree values. It does not compare successful and failed firms or establish education's effect on success.

## Recorded finding

Query 06 ranks USA first in recorded company funding, at approximately **$310.6 billion**, compared with **$17.7 billion** for GBR. The USA total is approximately **17.5 times** the GBR total, calculated from the rounded displayed values.

| Country code | Displayed total | Approximate USD billions |
|---|---:|---:|
| USA | 3.10588e+11 | 310.588 |
| GBR | 1.77056e+10 | 17.7056 |
| CHN | 1.06897e+10 | 10.6897 |
| CAN | 9.86636e+09 | 9.86636 |

These are selected rows from the supplied Task 6 screenshot, not a complete export. One intervening row has no visible country code; missing country labels should be investigated before calculating country shares. The analysis describes funding totals in this historical coursework dataset, not current markets, investment returns, or company success rates.

The finding suggests examining geographic concentration during investment research. It does not by itself justify investing in one country. Query 09's activity-category results and the other outputs would further strengthen the analysis.

## Validation

Eight SQL files were checked against a minimal SQLite schema for basic syntax and referenced-column consistency only. PostgreSQL-specific EXTRACT and the aggregate ROUND expression in queries 03 and 09 need the source environment for validation. No original-database result was reproduced.
