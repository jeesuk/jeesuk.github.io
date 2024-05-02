WITH tech_skills AS
(
    SELECT CONCAT(first_name, ' ', last_name) as full_name, sql, python, looker_tableau, git, excel 
    FROM languages_tools 
    WHERE sql = 1 AND python = 1 AND looker_tableau = 1 AND git = 1 AND excel = 1
)
, finance_exp AS
(
    SELECT CONCAT(first_name, ' ', last_name) as full_name, biz_acumen, comms_skills, ROUND(SUM(duration)/12, 0) AS finance_yrs_exp 
    FROM experience 
    WHERE role_type IN ('investment banking', 'private equity', 'finance')
)
, analytics_exp AS
(
    SELECT CONCAT(first_name, ' ', last_name) as full_name, stats, machine_learn, ab_test, etl_elt, ROUND(SUM(duration)/12, 0) AS analytics_yrs_exp 
    FROM experience 
    WHERE role_type = 'analytics' AND ugrad_major = 0
)
SELECT a.full_name, sql, python, looker_tableau, git, excel, stats 
       , machine_learn, ab_test, etl_elt, biz_acumen, comms_skills 
       , analytics_yrs_exp, finance_yrs_exp 
  FROM tech_skills AS a
       JOIN finance_exp AS b ON a.full_name = b.full_name
       JOIN analytics_exp AS c ON a.full_name = c.full_name;

1 rows:
| full_name  | sql | python | looker_tableau | git | excel | stats | machine_learn | ab_test | etl_elt | biz_acumen | comms_skills | analytics_yrs_exp | finance_yrs_exp |
|------------|-----|--------|----------------|-----|-------|-------|---------------|---------|---------|------------|--------------|-------------------|-----------------|
| Justin Koh | 1   | 1      | 1              | 1   | 1     | 1     | 1             | 1       | 1       | High       | Excellent    | 7                 | 7               |





