
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






	


	
    
	
	


	
	
	
	


	