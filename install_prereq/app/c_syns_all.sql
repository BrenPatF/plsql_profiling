/***************************************************************************************************
Name: c_syns_all .sql                   Author: Brendan Furey                      Date: 21-Jun-2020

Prerequisite synonyms script in the PL/SQL Profiling module for the app schema.

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are prerequisitea installation scripts for sys, lib and app schemas:

	install_sys_all.sql  -   Overall install prerequisites script for the sys schema
    install_lib_all.sql  -   Overall driver install prerequisites script for the lib schema
   *c_syns_all.sql*      -   Overall synonyms script for the app schema

INSTALL SCRIPTS - prerequisite synonyms for the app schema
====================================================================================================
|  Script                      |  Notes                                                            |
|==================================================================================================|
|  c_utils_syns.sql            |  Synonyms script for the Utils module (copied from there)         |
|--------------------------------------------------------------------------------------------------|
|  c_timer_set_syns.sql        |  Synonyms script for the Timer_Set module (copied from there)     |
|--------------------------------------------------------------------------------------------------|
|  c_hprof_syns.sql            |  Synonyms script for the hierarchical profiler                    |
|--------------------------------------------------------------------------------------------------|
|  c_dprof_syns.sql            |  Synonyms script for the flat profiler                            |
====================================================================================================
This file is the overall synonyms script for the prerequisite components to be run in the app schema

***************************************************************************************************/
@c_utils_syns lib
@c_timer_set_syns lib
@c_hprof_syns lib
@c_dprof_syns lib