/***************************************************************************************************
Name: install_sys_all .sql              Author: Brendan Furey                      Date: 21-Jun-2020

Prerequisites installation script in the PL/SQL Profiling module for the sys schema.

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are prerequisitea installation scripts for sys, lib and app schemas:

   *install_sys_all.sql* -   Overall install prerequisites script for the sys schema
    install_lib_all.sql  -   Overall driver install prerequisites script for the lib schema
    c_syns_all.sql       -   Overall synonyms script for the app schema

INSTALL SCRIPTS - prerequisites for the sys schema
====================================================================================================
|  Script                      |  Notes                                                            |
|==================================================================================================|
|  install_sys.sql             |  Install sys script for the Utils module (copied from there)      |
|--------------------------------------------------------------------------------------------------|
|  install_sys_hprof.sql       |  Install sys script for the hierarchical profiler                 |
====================================================================================================
This script calls the sys install scripts for the Utils and PL/SQL Profiling modules, and grants
execute on DBMS_Lock, and CREATE TRIGGER, to the app schema

***************************************************************************************************/
DEFINE APP_USER=app
@install_sys
@install_sys_hprof
PROMPT Grant Execute DBMS_Lock to &APP_USER
GRANT EXECUTE ON DBMS_Lock TO &APP_USER
/
GRANT CREATE TRIGGER TO &APP_USER
/
