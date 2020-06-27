@..\install_prereq\initspool ts_example_sleep
/***************************************************************************************************
Name: ts_example_general.sql            Author: Brendan Furey                      Date: 21-Jun-2020

Driver script component in the PL/SQL Profiling module.

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are driver SQL scripts for two examples to demonstrate profiling via Timer_Set: One is a 
general example and the other involves calls to a system sleep procedure. Each of the three methods
of profiling demonstrated has a similar pair of driver scripts.

DRIVER SCRIPTS
====================================================================================================
|  SQL Script          |  Calls                          |  Notes                                  |
|===================================================================================================
|  ts_example_general  |  Timer_Set_Test.A_Calls_B       |  Entry point for mutually recursive     |
|                      |                                 |  calls                                  |
|                      |  Timer_Set_Test.DBFunc          |  Database function called by query      |
|                      |  Table_Count_Type               |  Object type used to demonstrate PL/SQL |
|                      |                                 |  profiling                              |
|                      |  Timer_Set_Test.Increment_Time  |  Increment time within timer set        |
|                      |  Timer_Set_Test.R_Calls_R       |  Entry point for recursive calls        |
|                      |  Timer_Set_Test.Write_Times     |  Write timing results                   |
----------------------------------------------------------------------------------------------------
| *ts_example_sleep*   |  Timer_Set.Construct            |  Construct timer set                    |
|                      |  DBMS_Lock.Sleep                |  Sleep for a number of seconds          |
|                      |  Timer_Set.Increment_Time       |  Increment time within timer set        |
|                      |  Timer_Set.Format_Results       |  Format timing results as list          |
|                      |  Utils.W                        |  Write list of results                  |
====================================================================================================
This file has the driver script for the sleep example used to demonstrate PL/SQL profiling via 
Timer_Set.

***************************************************************************************************/
SET TIMING ON
PROMPT B1: Construct timer set; DBMS_Lock.Sleep, 3 + 6; insert to trigger_tab; write timer set
DECLARE
  l_timer_set       PLS_INTEGER;
BEGIN
  l_timer_set := Timer_Set.Construct('Profiling DBMS_Lock.Sleep');
  DBMS_Lock.Sleep(3);
  Timer_Set.Increment_Time(l_timer_set, '3 second sleep');

  INSERT INTO trigger_tab VALUES (2, 0.5);
  Timer_Set.Increment_Time(l_timer_set, 'INSERT INTO trigger_tab VALUES (2, 0.5)');

  DBMS_Lock.Sleep(6);
  Timer_Set.Increment_Time(l_timer_set, '6 second sleep');
  Utils.W(Timer_Set.Format_Results(l_timer_set));

END;
/
SET TIMING OFF
@..\install_prereq\endspool