USE AdventureWorksLT2012

Select * from sys.views
Select * from sys.tables
Select * from sys.objects
where type_desc ='VIEW'
Select * from INFORMATION_SCHEMA.TABLES
Select * from sys.dm_exec_connections
Select * from sys.dm_exec_sessions
Select * from sys.dm_exec_requests
Select * from sys.dm_exec_query_stats


SELECT TOP (20) qs.max_logical_reads,
                st.text 
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY qs.max_logical_reads DESC;