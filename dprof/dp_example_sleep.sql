@..\install_prereq\initspool dp_example_sleep
/***************************************************************************************************
Name: dp_example_sleep.sql              Author: Brendan Furey                      Date: 21-Jun-2020

Driver script component in the PL/SQL Profiling module.

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are driver SQL scripts for two examples to demonstrate profiling via DBMS_Profiler: One is a 
general example and the other involves calls to a system sleep procedure. Each of the three methods
of profiling demonstrated has a similar pair of driver scripts.

DRIVER SCRIPTS
====================================================================================================
|  SQL Script          |  Calls                          |  Notes                                  |
|===================================================================================================
|  dp_example_general  |  DBMS_Profiler.Start_Profiling  |  Start profiling with DBMS_Profiler     |
|                      |  Prof_Test.A_Calls_B            |  Entry point for mutually recursive     |
|                      |                                 |  calls                                  |
|                      |  Prof_Test.DBFunc               |  Database function called by query      |
|                      |  Table_Count_Type               |  Object type used to demonstrate PL/SQL |
|                      |                                 |  profiling                              |
|                      |  Prof_Test.R_Calls_R            |  Entry point for recursive calls        |
|                      |  DBMS_Profiler.Stop_Profiling   |  Stop profiling                         |
|                      |  dprof_queries.sql              |  Query script to show results           |
----------------------------------------------------------------------------------------------------
| *dp_example_sleep*   |  DBMS_Profiler.Start_Profiling  |  Start profiling with DBMS_Profiler     |
|                      |  DBMS_Lock.Sleep                |  Sleep for a number of seconds          |
|                      |  DBMS_Profiler.Stop_Profiling   |  Stop profiling                         |
|                      |  dprof_queries.sql              |  Query script to show results           |
----------------------------------------------------------------------------------------------------
|  dprof_queries       |  SQL script                     |  Query script to show results           |
====================================================================================================
This file has the driver script for the sleep example used to demonstrate PL/SQL profiling via 
DBMS_Profiler.

***************************************************************************************************/
SET TIMING ON
VAR RUN_ID NUMBER
PROMPT B1: Start profiling; DBMS_Lock.Sleep, 3 + 6; insert to trigger_tab; stop profiling
DECLARE
  l_result           PLS_INTEGER;
BEGIN

  l_result := DBMS_Profiler.Start_Profiler(
  				run_comment => 'Profile for DBMS_Lock.Sleep example',
  				run_number  => :RUN_ID);

  Utils.W('Start: profile run id = ' || :RUN_ID);

  DBMS_Lock.Sleep(3);

  INSERT INTO trigger_tab VALUES (2, 0.5);

  DBMS_Lock.Sleep(6);

  Utils.W('Stop: result = ' || DBMS_Profiler.Stop_Profiler);

END;
/
SET TIMING OFF
@dprof_queries :RUN_ID
@..\install_prereq\endspool