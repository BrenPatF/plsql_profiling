# Oracle PL/SQL Profiling / Hierarchical Profiler

The Oracle PL/SQL Profiling module contains the code for a series of articles demonstrating the use of three PL/SQL profiling methods on two example program structures. The examples are designed to illustrate their behaviour over as many different scenarios as possible, while keeping the examples as simple as possible. This submodule, on Oracle's hierarchical profiler, is one of three covering each of the profilers individually.

Blog: [PL/SQL Profiling 2: Hierarchical Profiler](http://aprogrammerwrites.eu/?p=2861)

The root README shows the scenarios covered with call structure diagrams for the two examples, and has a table summarising the features of the different profilers. These are extracted from the Overview article. It also has full installation instructions for running the three profilers on the two example program structures.

- [README: Root](../README.md)

The current, detail, README shows the data model for the hierarchical profiler, summaries of results, with network diagrams, on the second, simpler, example, and a query structure diagram for the network query. These are extracted from the detail article linked above. It also shows how to install and run just the hierarchical profiler on the two examples.

## In this README...
- [Data Model](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Data-Model)
- [Network Diagrams for Example 2: Sleep](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Network-Diagram-for-Example-2--Sleep)
- [Query Structure Diagram](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Query-Structure-Diagram)
- [Running Driver Scripts](https://github.com/BrenPatF/plsql_profiling#running-driver-scripts)

## Data Model
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#in-this-readme)

<img src="plsql_profiling - HP ERD.png">

## Network Diagrams for Example 2: Sleep
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#in-this-readme)
- [Query Output](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Query-Output)
- [Basic Network Diagram with Dummy Root](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Basic-Network-Diagram-with-Dummy-Root)
- [Extended Network Diagram with Function Names and Times](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Extended-Network-Diagram-with-Function-Names-and-Times)

### Query Output

    Function tree                   Sy Owner Module           Inst.  Subtree MicroS Function MicroS Calls Row
    ------------------------------ --- ----- ---------------- ------ -------------- --------------- ----- ---
    SLEEP                            8 SYS   DBMS_LOCK        1 of 2        8998195         8998195     2   1
    __static_sql_exec_line6         10                                      2005266            5660     1   2
      __plsql_vm                     1                                      1999606               4     1   3
        SLEEP_BI                     3 APP   SLEEP_BI                       1999602             327     1   4
          SLEEP                      4 LIB   UTILS                          1999268          999837     1   5
            SLEEP                    8 SYS   DBMS_LOCK        2 of 2         999431          999431     1   6
          __pkg_init                 6 LIB   UTILS                                5               5     1   7
          __pkg_init                 5 LIB   UTILS                                2               2     1   8
    STOP_PROFILING                   2 APP   HPROF_UTILS                         87              87     1   9
      STOP_PROFILING                 7 SYS   DBMS_HPROF                           0               0     1  10
    __static_sql_exec_line700       11 SYS   DBMS_HPROF                          77              77     1  11
    __pkg_init                       9 SYS   DBMS_LOCK                            3               3     1  12
    
    12 rows selected.

### Basic Network Diagram with Dummy Root
- [Network Diagrams for Example 2: Sleep](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Network-Diagrams-for-Example-2--Sleep)

<img src="plsql_profiling - net-slp.png">

### Extended Network Diagram with Function Names and Times
- [Network Diagrams for Example 2: Sleep](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#Network-Diagrams-for-Example-2--Sleep)

<img src="plsql_profiling - net-slp-time.png">

The extended network diagram with function names and times included shows 9 seconds of time used by the SLEEP function in two root-level calls and 1 second in a third call as the child of the custom Utils Sleep function.

## Query Structure Diagram
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#in-this-readme)

<img src="plsql_profiling - qsd.png">

## Running Driver Scripts
[Schema: app; Folder: hprof]
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/hprof/README_HP.md#in-this-readme)

You need to have first run the [prerequisite installation](..\README.md#installation)

### Create Hierarchical Profiler Components
If the script has not already been run from the root README:
- Run script from slqplus:
```
SQL> @install_hprof_app
```

### Run Driver Scripts
- Run scripts from slqplus for general and sleep examples (output will be in .log files):
```
SQL> @hp_example_general
SQL> @hp_example_sleep
```

The driver scripts, as well as the SQL output reports in the log files, also create standard HTML reports hp_example_general.html and hp_example_sleep.html, and these are written to the folder in the Oracle directory INPUT_DIR. They are included in the current GitHub folder for reference. 