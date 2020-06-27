CREATE OR REPLACE PACKAGE Timer_Set_Test AS
/***************************************************************************************************
Name: timer_set_test.pks                   Author: Brendan Furey                   Date: 21-Jun-2020

Package spec component in the PL/SQL Profiling module. 

The module demonstrates the use of Oracle's two profiling utilities, DBMS_Profiler (its original 
flat profiler) and DBMS_HProf (the later hierarchical profiler), and also profiling by custom code
timing instrumentation (Timer_Set). 

    GitHub: https://github.com/BrenPatF/plsql_profiling
    Blog:   'PL/SQL Profiling Notes, 1: Overview', http://aprogrammerwrites.eu/?p=703

There are several packages used to demonstrate the three profiling methods, some shared and some 
specific to one or two of the methods. Note that installation of this module is dependent on 
prerequisite installs of other modules as described in the README.

PACKAGES AND TYPES
====================================================================================================
|  Package/Object    |  Type     |  Notes                                                          |
|===================================================================================================
|  COMMON APP COMPONENTS                                                                           |
----------------------------------------------------------------------------------------------------
|  Prof_Test         |  Package  |  Procedures and functions to test PL/SQL profiling              |
----------------------------------------------------------------------------------------------------
|  Table_Count_Type  |  Object   |  Object type to test PL/SQL profiling                           |
----------------------------------------------------------------------------------------------------
|  DBMS_HPROF COMPONENTS                                                                           |
----------------------------------------------------------------------------------------------------
|  HProf_Utils       |  Package  |  Utility procedures and functions for use with PL/SQL profiling |
|                    |           |  by DBMS_HProf                                                  |
----------------------------------------------------------------------------------------------------
|  TIMER_SET COMPONENTS                                                                            |
----------------------------------------------------------------------------------------------------
| *Timer_Set_Test*   |  Package  |  Procedures and functions to test PL/SQL profiling by custom    |
|                    |           |  code timing via the Timer_set module                           |
====================================================================================================
This file has the Timer_Set_Test package spec.

***************************************************************************************************/

PROCEDURE A_Calls_B(
            x_call_no               IN OUT PLS_INTEGER);
            PROCEDURE R_Calls_R(
            x_call_no               IN OUT PLS_INTEGER);
FUNCTION DBFunc 
            RETURN                         PLS_INTEGER;
PROCEDURE Init;
PROCEDURE Increment_Time(
            p_timer_name                   VARCHAR2);
PROCEDURE Write_Times;

END Timer_Set_Test;
/
SHO ERR