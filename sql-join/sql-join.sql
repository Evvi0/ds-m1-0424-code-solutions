USE telecom;

#SELECT id, location, fault_severity, event_type, severity_type, resource_type, log_feature, volume FROM event_type et
	#LEFT JOIN log_feature lf ON et.location = lf.location;
	
	

SELECT t.id, t.location, t.fault_severity, et.event_type, st.severity_type, rt.resource_type, lf.log_feature, lf.volume FROM train t
	LEFT JOIN event_type et ON t.id = et.id
	LEFT JOIN severity_type st ON et.id  = st.id
	LEFT JOIN resource_type rt ON st.id  = rt.id
	LEFT JOIN log_feature lf ON rt.id = lf.id;

USE loandb;

previous_applicaitons(SK_ID_PREV)
SK_ID_CURR
SK_ID_PREV
AMT_CREDIT
DAYS_DECISION
installment_payments(SK_ID_CURR)
DAYS_INSTALMENT
AMT_PAYMENT

SELECT pa.SK_ID_CURR, pa.SK_ID_PREV, pa.AMT_CREDIT, pa.DAYS_DECISION, ip.DAYS_INSTALMENT, ip.AMT_PAYMENT FROM previous_application pa 
	LEFT JOIN installments_payments ip ON pa.SK_ID_CURR = ip.SK_ID_CURR WHERE AMT_PAYMENT IS NULL AND DAYS_INSTALMENT is NULL;
	
	
SELECT pa.SK_ID_CURR, pa.SK_ID_PREV, pa.AMT_CREDIT, pa.DAYS_DECISION, ip.DAYS_INSTALMENT, ip.AMT_PAYMENT FROM previous_application pa 
	LEFT JOIN installments_payments ip ON pa.SK_ID_CURR = ip.SK_ID_CURR WHERE ip.SK_ID_CURR is NULL;

SELECT COUNT(*) FROM  previous_application pa WHERE SK_ID_CURR is NULL;

SELECT COUNT(*)  FROM installments_payments ip WHERE SK_ID_CURR is NULL;

USE dsstudent;

CREATE TEMPORARY TABLE merged_tables
	(id SMALLINT,
	 location VARCHAR(20),
	 fault_severity SMALLINT,
	 event_type VARCHAR(20),
	 severity_type VARCHAR(20),
	 resource_type VARCHAR(20),
	 log_feature VARCHAR(20),
	 volume SMALLINT);
	
	USE telecom;

INSERT INTO dsstudent.merged_tables
	(id, location, fault_severity, event_type, severity_type, resource_type, log_feature, volume)
SELECT t.id, t.location, t.fault_severity, et.event_type, st.severity_type, rt.resource_type, lf.log_feature, lf.volume FROM train t
	LEFT JOIN event_type et ON t.id = et.id
	LEFT JOIN severity_type st ON et.id  = st.id
	LEFT JOIN resource_type rt ON st.id  = rt.id
	LEFT JOIN log_feature lf ON rt.id = lf.id;


USE dsstudent;
CREATE TEMPORARY TABLE log_feature_table
SELECT id, log_feature, volume FROM dsstudent.merged_tables;
	CASE
		WHEN volume < 100 THEN "low"
		WHEN volume >= 100 AND volume <= 500 THEN "medium"
		WHEN volume > 500 THEN "large"
		ELSE "Unknown"
	END log_feature_table

DROP TABLE log_feature_table;

SELECT log_feature, id, volume, FROM dsstudent.merged_tables
	CASE 
		WHEN volume < 100 THEN "low" 
		WHEN volume >= 100 AND volume <= 500 THEN "medium"
		WHEN volume > 500 THEN "large"
		ELSE "Unknown"
	END volume_1;
	
	
CREATE TEMPORARY TABLE logtable
	(id SMALLINT,
	 log_feature VARCHAR(20),
	 volume SMALLINT);
	
USE telecom;

INSERT INTO logtable
	(id, log_feature, volume)
SELECT log_feature, id, volume, volume_1,
	CASE 
		WHEN volume < 100 THEN "low" 
		WHEN volume >= 100 AND volume <= 500 THEN "medium"
		WHEN volume > 500 THEN "large"
		ELSE "Unknown"
	END volume_1
FROM logtable;
	
	DROP TABLE logtable;
	

SELECT location, COUNT(DISTINCT(event_type)) num_unique_event_type
FROM merged_tables
GROUP BY location;
	
SELECT location, SUM(volume) total_volume
FROM merged_tables
GROUP BY location
ORDER BY total_volume DESC
LIMIT 3;


SELECT fault_severity, COUNT(DISTINCT(location)) num_unique_locations
FROM merged_tables
GROUP BY fault_severity;

SELECT fault_severity, COUNT(DISTINCT(location)) num_unique_locations
FROM merged_tables
GROUP BY fault_severity
HAVING fault_severity > 1;

	


	
    
	
	


	
	
	
	


	