@..\install_prereq\initspool install_dprof_app
/***************************************************************************************************
Name: install_dprof_app.sql             Author: Brendan Furey                      Date: 21-Jun-2020

Installation script for DBMS_Profiler demo components in the PL/SQL Profiling module.  

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are install scripts for each of the three profiling methods for the app schema. Note that
installation of this module is dependent on prerequisite installs of other modules as described in
the README.

INSTALL SCRIPTS
====================================================================================================
|  Script                     |  Notes                                                             |
|==================================================================================================|
|  APP SCHEMA                                                                                      |
|--------------------------------------------------------------------------------------------------|
|  install_hprof_app.sql      |  Installs DBMS_HProf demo components in app schema                 |
|--------------------------------------------------------------------------------------------------|
| *install_dprof_app.sql*     |  Installs DBMS_Profiler demo components in app schema              |
|--------------------------------------------------------------------------------------------------|
|  install_timer_set_app.sql  |  Installs Timer_Set demo components in app schema                  |
====================================================================================================
This file has the install script for the DBMS_Profiler demo components in app schema.

Components created in app schema:

    Types               Description
    ================    ============================================================================
    Table_Count_Type    Object type used to demonstrate PL/SQL profiling with three methods

    Packages            Description
    ==================  ============================================================================
    Prof_Test           Procedures and functions to demonstrate PL/SQL profiling with DBMS_Profiler
                        and DBMS_HProf

***************************************************************************************************/

PROMPT Create type Table_Count
@..\app_common\table_count_type.tps
@..\app_common\table_count_type.tpb

PROMPT Create table with trigger
@..\app_common\trigger_tab.tbl

PROMPT Create package Prof_Test
@..\app_common\prof_test.pks
@..\app_common\prof_test.pkb

@..\install_prereq\endspool