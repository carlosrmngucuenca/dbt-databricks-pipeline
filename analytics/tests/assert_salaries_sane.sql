{{ config(severity='WARN')}}

SELECT 
    job_title,
    salary_min,
    salary_max,
    salary_period,
    salary_currency
FROM {{ ref('stg_job_postings') }}
WHERE salary_period = 'year' AND salary_currency = 'USD' AND COALESCE(salary_max,salary_min) >= 1000000
