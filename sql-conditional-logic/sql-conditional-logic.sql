USE telecom;

SELECT * FROM log_feature lf 

SELECT id, log_feature, volume, 	
	CASE
		WHEN volume < 100 THEN "low"
		WHEN volume >= 100 AND volume <= 500 THEN "medium"
		WHEN volume > 500 THEN "large"
		ELSE "Unknown"
	END volume_1
FROM log_feature lf 

SELECT 
    CASE
        WHEN volume < 100 THEN 'low'
        WHEN volume >= 100 AND volume <= 500 THEN 'medium'
        WHEN volume > 500 THEN 'high'
        ELSE 'UNKNOWN'
    END AS volume_category,
    COUNT(*) AS quantity
FROM 
    log_feature
GROUP BY 
    CASE
        WHEN volume < 100 THEN 'low'
        WHEN volume >= 100 AND volume <= 500 THEN 'medium'
        WHEN volume > 500 THEN 'high'
        ELSE 'UNKNOWN'
    END;
   
SELECT id, log_feature, volume, 	
	CASE
		WHEN volume < 100 THEN "low"
		WHEN volume >= 100 AND volume <= 500 THEN "medium"
		WHEN volume > 500 THEN "large"
		ELSE "Unknown"
	END volume_1
FROM log_feature lf 


USE hr;

SELECT EmployeeNumber, HourlyRate,
	CASE 
		WHEN HourlyRate >= 80 THEN "high hourly rate"
		WHEN HourlyRate >= 40 AND HourlyRate < 80 THEN "medium hourly rate"
		WHEN HourlyRate < 40 THEN "low hourly rate"
	END HourlyRate_1
FROM employee e 
	
SELECT Gender,
	CASE 
		WHEN Gender = "Female" THEN 0
		ELSE 1
	END Gender_1
FROM employee e 
	






