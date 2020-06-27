CREATE OR REPLACE PACKAGE BODY Prof_Test AS
/***************************************************************************************************
Name: prof_test.pkb                        Author: Brendan Furey                   Date: 21-Jun-2020

Package spec component in the PL/SQL Profiling module. 

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are several packages used to demonstrate the three profiling methods, some shared and some 
specific to one or two of the methods. Note that installation of this module is dependent on 
prerequisite installs of other modules as described in the README.

TABLE, PACKAGES, TYPES
====================================================================================================
|  Tab/Pkg/Object    |  Type     |  Notes                                                          |
|==================================================================================================|
|  COMMON APP COMPONENTS                                                                           |
|--------------------------------------------------------------------------------------------------|
|  TRIGGER_TAB       |  Table    |  Table with Before Insert trigger that sleeps                   |
|--------------------------------------------------------------------------------------------------|
| *Prof_Test*        |  Package  |  Procedures and functions to demonstrate PL/SQL profiling       |
|--------------------------------------------------------------------------------------------------|
|  Table_Count_Type  |  Object   |  Object type to demonstrate PL/SQL profiling                    |
|--------------------------------------------------------------------------------------------------|
|  DBMS_HPROF COMPONENTS                                                                           |
|--------------------------------------------------------------------------------------------------|
|  HProf_Utils       |  Package  |  Utility procedures and functions for use with PL/SQL profiling |
|                    |           |  by DBMS_HProf                                                  |
|--------------------------------------------------------------------------------------------------|
|  TIMER_SET COMPONENTS                                                                            |
|--------------------------------------------------------------------------------------------------|
|  Timer_Set_Test    |  Package  |  Procedures and functions to demonstrate PL/SQL profiling by    |
|                    |           |  custom code timing via the Timer_Set module                    |
====================================================================================================
This file has the Prof_Test package body.

***************************************************************************************************/

g_num NUMBER := 0;

/***************************************************************************************************

Rest_a_While: Uses up some CPU time by doing a square root calculation in a loop

***************************************************************************************************/
PROCEDURE Rest_a_While(
            p_loop_count                   PLS_INTEGER) IS -- loop count, multiplied by 10
BEGIN

  FOR i IN 1..p_loop_count*10 LOOP

    g_num := g_num + SQRT(i);

  END LOOP;

END Rest_a_While;

PROCEDURE B_Calls_A(x_call_no IN OUT PLS_INTEGER); -- forward declaration of body procedure

/***************************************************************************************************

A_Calls_B: Makes two inlined calls to Rest_a_While, then makes mutually recursive call to
           B_Calls_A, with limit of 4 calls

***************************************************************************************************/
PROCEDURE A_Calls_B(
            x_call_no               IN OUT PLS_INTEGER) IS -- call counter
BEGIN

  x_call_no := x_call_no + 1;
  PRAGMA INLINE (Rest_a_While, 'YES');
  Rest_a_While(1000 * x_call_no);

  PRAGMA INLINE (Rest_a_While, 'YES'); -- Both pragmas are required
  Rest_a_While(2000 * x_call_no);

  IF x_call_no < 4 THEN
    B_Calls_A(x_call_no);
  END IF;

END A_Calls_B;

/***************************************************************************************************

B_Calls_A: Makes an inlined call to Rest_a_While, then makes mutually recursive call to
           A_Calls_B, with limit of 4 calls

***************************************************************************************************/
PROCEDURE B_Calls_A(
            x_call_no               IN OUT PLS_INTEGER) IS -- call counter
BEGIN

  x_call_no := x_call_no + 1;
  PRAGMA INLINE (Rest_a_While, 'YES');
  Rest_a_While(5000 * x_call_no);

  IF x_call_no < 4 THEN
    A_Calls_B(x_call_no);
  END IF;

END B_Calls_A;

/***************************************************************************************************

R_Calls_R: Makes an inlined call to Rest_a_While, then makes recursive call to itself with limit of
           2 calls

***************************************************************************************************/
PROCEDURE R_Calls_R(
            x_call_no               IN OUT PLS_INTEGER) IS -- call counter
BEGIN

  DBMS_Output.Put_Line('In R_Calls_R, x_call_no = ' || x_call_no);
  x_call_no := x_call_no + 1;
  PRAGMA INLINE (Rest_a_While, 'YES');
  Rest_a_While(3000 * x_call_no);

  IF x_call_no < 2 THEN
    R_Calls_R(x_call_no);
  END IF;

END R_Calls_R;

/***************************************************************************************************

DBFunc: Function called by SQL query, just calls Rest_a_While, then returns 99

***************************************************************************************************/
FUNCTION DBFunc 
            RETURN PLS_INTEGER IS -- arbitrary constant of 99
BEGIN

  PRAGMA INLINE (Rest_a_While, 'YES');
  Rest_a_While(10000);

  RETURN 99;

END DBFunc;

END Prof_Test;
/
SHO ERR
