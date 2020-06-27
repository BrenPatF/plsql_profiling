/***************************************************************************************************
Name: table_count_type.tps                 Author: Brendan Furey                   Date: 21-Jun-2020

Object type spec component in the PL/SQL Profiling module.

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
|  Prof_Test         |  Package  |  Procedures and functions to demonstrate PL/SQL profiling       |
|--------------------------------------------------------------------------------------------------|
| *Table_Count_Type* |  Object   |  Object type to demonstrate PL/SQL profiling                    |
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
This file has the Table_Count_Type object type spec.

***************************************************************************************************/
CREATE OR REPLACE TYPE Table_Count_Type AS OBJECT(
             search_str                    VARCHAR2(30),
             num_matches                   NUMBER,
             CONSTRUCTOR FUNCTION Table_Count_Type(
                    p_search_str                  VARCHAR2) 
                    RETURN                        SELF AS RESULT
)
/
SHOW ERROR
