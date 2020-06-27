@..\install_prereq\initspool ts_example_general
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
| *ts_example_general* |  Timer_Set_Test.A_Calls_B       |  Entry point for mutually recursive     |
|                      |                                 |  calls                                  |
|                      |  Timer_Set_Test.DBFunc          |  Database function called by query      |
|                      |  Table_Count_Type               |  Object type used to demonstrate PL/SQL |
|                      |                                 |  profiling                              |
|                      |  Timer_Set_Test.Increment_Time  |  Increment time within timer set        |
|                      |  Timer_Set_Test.R_Calls_R       |  Entry point for recursive calls        |
|                      |  Timer_Set_Test.Write_Times     |  Write timing results                   |
----------------------------------------------------------------------------------------------------
|  ts_example_sleep    |  Timer_Set.Construct            |  Construct timer set                    |
|                      |  DBMS_Lock.Sleep                |  Sleep for a number of seconds          |
|                      |  Timer_Set.Increment_Time       |  Increment time within timer set        |
|                      |  Timer_Set.Format_Results       |  Format timing results as list          |
|                      |  Utils.W                        |  Write list of results                  |
====================================================================================================
This file has the driver script for the general example used to demonstrate PL/SQL profiling via 
Timer_Set.

***************************************************************************************************/
SET TIMING ON
PROMPT B1: A_Calls_B 
DECLARE
  l_call_count       PLS_INTEGER := 0;
BEGIN
  Timer_Set_Test.Init;
  Timer_Set_Test.A_Calls_B(l_call_count);

END;
/
PROMPT SQL: Static DB function call
SELECT Timer_Set_Test.DBFunc
  FROM DUAL;

PROMPT B2: Static DB function; dynamic SQL; object constructor
DECLARE
  l_cur              SYS_REFCURSOR;
  l_ret_val          PLS_INTEGER;
  l_tab_count        Table_Count_Type;

BEGIN

  SELECT Timer_Set_Test.DBFunc
    INTO l_ret_val
    FROM DUAL;

  OPEN l_cur FOR 'SELECT Count(*) FROM all_tab_columns'; 
  Timer_Set_Test.Increment_Time('Open cursor');
  FETCH l_cur INTO l_ret_val; 
  Timer_Set_Test.Increment_Time('Fetch from cursor');
  CLOSE l_cur;
  Timer_Set_Test.Increment_Time('Close cursor');

  l_tab_count := Table_Count_Type('EMP');
  Timer_Set_Test.Increment_Time('Construct object');

END;
/
PROMPT B3: R_Calls_R; write times
DECLARE
  l_call_count       PLS_INTEGER := 0;
BEGIN

  Timer_Set_Test.R_Calls_R(l_call_count);

  Timer_Set_Test.Write_Times;

END;
/
SET TIMING OFF
@..\install_prereq\endspool