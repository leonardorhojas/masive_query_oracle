SET SERVEROUTPUT ON
SET DEFINE OFF
set colsep |     
set pagesize 0   
set trimspool on 
set headsep off  
set linesize 5000
set numw 10      
set define off trims on newp none heads off echo off feed off pagesize 0 null null verify off

spool ../output/myfile.csv append


select
(select name from v$database)||';'||
--(select host_name||';'||UTL_INADDR.get_host_address(HOST_NAME)||';'||
--version from v$instance)||';'||
trunc("Reserved_Space(GB)",1)||';'|| trunc("Reserved_Space(GB)" - "Free_Space(GB)",1)||';'||trunc("Free_Space(GB)",1)
from(
    select 
    (select sum(bytes/(1014*1024*1024)) from dba_data_files) "Reserved_Space(GB)",
    (select sum(bytes/(1024*1024*1024)) from dba_free_space) "Free_Space(GB)"
    from dual
);



SPOOL OFF;
SET DEFINE ON
SET SERVEROUTPUT OFF
exit;