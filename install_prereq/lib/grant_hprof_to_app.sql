DEFINE APP=&1
/***************************************************************************************************
Name: grant_hprof_to_app.sql              Author: Brendan Furey                      Date: 21-Jun-2020

Prerequisites installation script in the PL/SQL Profiling module for the lib schema.

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are prerequisitea installation scripts for sys, lib and app schemas:

	install_sys_all.sql  -   Overall install prerequisites script for the sys schema
    install_lib_all.sql  -   Overall driver install prerequisites script for the lib schema
    c_syns_all.sql       -   Overall synonyms script for the app schema

INSTALL SCRIPTS - prerequisites for the lib schema
====================================================================================================
|  Script / Procedure          |  Notes                                                            |
|==================================================================================================|
|  install_utils.sql           |  Driver script for the Utils module, calls scripts below.         |
|                              |  Files are copied from that module.                               |
|==================================================================================================|
|  utils.pks                   |  Utils package spec                                               |
|--------------------------------------------------------------------------------------------------|
|  utils.pkb                   |  Utils package body                                               |
|--------------------------------------------------------------------------------------------------|
|  grant_utils_to_app.sql      |  Grants Utils components to the app schema                        |
|==================================================================================================|
|  install_timer_set.sql       |  Driver script for the Timer_Set module, calls scripts below.     |
|                              |  Files are copied from that module.                               |
|==================================================================================================|
|  timer_set.pks               |  Timer_Set package spec                                           |
|--------------------------------------------------------------------------------------------------|
|  timer_set.pkb               |  Timer_Set package body                                           |
|--------------------------------------------------------------------------------------------------|
|  grant_timer_set_to_app.sql  |  Grants Timer_Set components to the app schema                    |
|==================================================================================================|
|  install_hprof.sql           |  Driver script for the hierarchical profiler, calls as below      |
|==================================================================================================|
|  DBMS_HProf.Create_Tables    |  Oracle procedure to create the hierarchical profiler tables      |
|--------------------------------------------------------------------------------------------------|
| *grant_hprof_to_app.sql*     |  Grants hierarchical profiler components to the app schema        |
|==================================================================================================|
|  install_dprof.sql           |  Driver script for the flat profiler, calls scripts below         |
|==================================================================================================|
|  proftab.sql                 |  Oracle script to create the flat profiler tables                 |
|--------------------------------------------------------------------------------------------------|
|  grant_dprof_to_app.sql      |  Grants flat profiler components to the app schema                |
====================================================================================================
This file is the driver script for the hierarchical profiler prerequisite components to be run in 
the lib schema.

This file grants privileges on hierarchical profiler components from lib to app schema.

Grants applied:

    Privilege          Object                   Object Type
    =================  =======================  ================
    ALL                dbmshp_runs              Table
    ALL                dbmshp_function_info     Table
    ALL                dbmshp_parent_child_info Table
    ALL                dbmshp_trace_data        Table
    SELECT             dbmshp_runnumber         Sequence
    SELECT             dbmshp_tracenumber       Sequence

***************************************************************************************************/
PROMPT Granting dbmshp components to &APP...
GRANT ALL ON dbmshp_runs TO &APP
/
GRANT ALL ON dbmshp_function_info TO &APP
/
GRANT ALL ON dbmshp_parent_child_info TO &APP
/
GRANT ALL ON dbmshp_trace_data TO &APP
/
GRANT SELECT ON dbmshp_runnumber TO &APP
/
GRANT SELECT ON dbmshp_tracenumber TO &APP
/