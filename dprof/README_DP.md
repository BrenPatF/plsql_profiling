# Oracle PL/SQL Profiling / Flat Profiler

The Oracle PL/SQL Profiling module contains the code for a series of articles demonstrating the use of three PL/SQL profiling methods on two example program structures. The examples are designed to illustrate their behaviour over as many different scenarios as possible, while keeping the examples as simple as possible. This submodule, on Oracle's flat profiler, is one of three covering each of the profilers individually.

Blog: [PL/SQL Profiling 2: Flat Profiler](http://aprogrammerwrites.eu/?p=2867)

The root README shows the scenarios covered with call structure diagrams for the two examples, and has a table summarising the features of the different profilers. These are extracted from the overview article. It also has full installation instructions for running the three profilers on the two example program structures.

- [README: Root](../README.md)

The current, detail, README shows the data model for the flat profiler, and summaries of results on the second, simpler, example. These are extracted from the detail article linked above. It also shows how to install and run just the Flat profiler on the two examples.

## In this README...
- [Data Model](https://github.com/BrenPatF/plsql_profiling/blob/master/dprof/README_HP.md#Data-Model)
- [Query Output for Example 2: Sleep - Profiler Data by Time](https://github.com/BrenPatF/plsql_profiling/blob/master/dprof/README_DP.md#Query-Output-for-Example-2-Sleep---Profiler-Data-by-Time)
- [Running Driver Scripts](https://github.com/BrenPatF/plsql_profiling/blob/master/dprof/README_DP.md#running-driver-script)

## Data Model
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/dprof/README_DP.md#in-this-readme)

<img src="plsql_profiling - DP ERD.png">

## Query Output for Example 2: Sleep - Profiler Data by Time
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/dprof/README_DP.md#in-this-readme)

The records produced in the functions table, PLSQL_PROFILER_DATA, are listed below in order of unit name, then unit number and line number. 

    Seconds  Microsecs   Min S   Max S    Calls Unit                 Unit# Type            Line# Line Text
    ------- ---------- ------- ------- -------- -------------------- ----- --------------- ----- ------------------------------------------------------------------
      0.000          0   0.000   0.000        0 <anonymous>              1 ANONYMOUS BLOCK     1
      0.000          2   0.000   0.000        0 <anonymous>              1 ANONYMOUS BLOCK     5
      0.000         23   0.000   0.000        1 <anonymous>              1 ANONYMOUS BLOCK     9
      0.000         10   0.000   0.000        1 <anonymous>              1 ANONYMOUS BLOCK    11
      0.000        199   0.000   0.000        1 <anonymous>              1 ANONYMOUS BLOCK    13
      0.000          3   0.000   0.000        1 <anonymous>              1 ANONYMOUS BLOCK    15
      0.000          5   0.000   0.000        1 <anonymous>              1 ANONYMOUS BLOCK    17
      0.000          0   0.000   0.000        0 <anonymous>              1 ANONYMOUS BLOCK    19
      0.000          2   0.000   0.000        0 SLEEP_BI                 2 TRIGGER             1 TRIGGER sleep_bi
      0.000         20   0.000   0.000        1 SLEEP_BI                 2 TRIGGER             2 BEFORE INSERT
      0.000          1   0.000   0.000        1 SLEEP_BI                 2 TRIGGER             4 FOR EACH ROW
    
    11 rows selected.


## Running Driver Scripts
[Schema: app; Folder: dprof]
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/dprof/README_DP.md#in-this-readme)

You need to have first run the [prerequisite installation](..\README.md#installation)

 ### Create Flat Profiler Components
If the script has not already been run from the root README:
- Run script from slqplus:
```
SQL> @install_dprof_app
```

### Run Driver Scripts
- Run scripts from slqplus for general and sleep examples (output will be in .log files):
```
SQL> @dp_example_general
SQL> @dp_example_sleep
```
