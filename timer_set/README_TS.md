# Oracle PL/SQL Profiling / Custom Code Timing

The Oracle PL/SQL Profiling module contains the code for a series of articles demonstrating the use of three PL/SQL profiling methods on two example program structures. The examples are designed to illustrate their behaviour over as many different scenarios as possible, while keeping the examples as simple as possible. This submodule, on custom code timing, is one of three covering each of the profilers individually.

Blog: [PL/SQL Profiling 4: Custom Code Timing](http://aprogrammerwrites.eu/?p=2869)

The root README shows the scenarios covered with call structure diagrams for the two examples, and has a table summarising the features of the different profilers. These are extracted from the overview article. It also has full installation instructions for running the three profilers on the two example program structures.

- [README: Root](../README.md)

The current, detail, README shows a general call structure diagram, the data model for the Timer Set profiler, and the results report on the second, simpler, example. These are extracted from the detail article linked above. It also shows how to install and run just the Timer Set profiler on the two examples.

## In this README...
- [Call structure Diagram](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#Call-structure-Diagram)
- [Data Model](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#Data-Model)
- [Timer Set Report for Example 2: Sleep](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#Timer-Set-Report-for-Example-2--Sleep)
- [Running Driver Scripts](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#running-driver-scripts)

## Call Structure Diagram
In both examples a new timer set object is created, calls are made to increment timers within the set, and at the end a report on the timings is written to log. The way the timer set operates in general is illustrated by this diagram:

<img src="Oracle PLSQL API Demos - TimerSet-Flow.png">

## Data Model
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#in-this-readme)

<img src="plsql_profiling - TS ERD.png">

## Timer Set Report for Example 2: Sleep
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#in-this-readme)

### Timer Set Report

    Timer Set: Profiling DBMS_Lock.Sleep, Constructed at 27 Jun 2020 07:53:00, written at 07:53:11
    ==============================================================================================
    Timer                                       Elapsed         CPU       Calls       Ela/Call       CPU/Call
    ---------------------------------------  ----------  ----------  ----------  -------------  -------------
    3 second sleep                                 3.00        0.00           1        3.00000        0.00000
    INSERT INTO trigger_tab VALUES (2, 0.5)        2.00        1.00           1        1.99900        1.00000
    6 second sleep                                 6.00        0.00           1        6.00000        0.00000
    (Other)                                        0.00        0.00           1        0.00000        0.00000
    ---------------------------------------  ----------  ----------  ----------  -------------  -------------
    Total                                         11.00        1.00           4        2.74975        0.25000
    ---------------------------------------  ----------  ----------  ----------  -------------  -------------
    [Timer timed (per call in ms): Elapsed: 0.00980, CPU: 0.00980]


## Running Driver Scripts
[Schema: app; Folder: timer_set]
- [In this README...](https://github.com/BrenPatF/plsql_profiling/blob/master/timer_set/README_TS.md#in-this-readme)

You need to have first run the [prerequisite installation](..\README.md#installation)

### Create Timer Set Components
If the script has not already been run from the root README:
- Run script from slqplus:
```
SQL> @install_timer_set_app
```

### Run Driver Scripts
- Run scripts from slqplus for general and sleep examples (output will be in .log files):
```
SQL> @ts_example_general
SQL> @ts_example_sleep
```
