# Oracle PL/SQL Profiling
<img src="mountains.png">

Oracle PL/SQL profiling demo module.

:stopwatch:

This module contains the code for a series of articles demonstrating the use of three PL/SQL profiling methods on two example program structures. The examples are designed to illustrate profiler behaviour over as many different scenarios as possible, while keeping the examples as simple as possible. The first two profilers are Oracle's hierarchical and flat profiling tools, while the third is the author's own custom code timing package, Timer_Set.

The first article, <a href="http://aprogrammerwrites.eu/?p=703" target="_blank">PL/SQL Profiling 1: Overview</a>, has links to three detail articles, one for each profiler. The module is structured similarly to the articles, with a root folder for the overview, and subfolders for the individual profilers.

This, the root README, shows the scenarios covered with call structure diagrams for the two examples, and has a table summarising the features of the different profilers. These are extracted from the overview article. It also has full installation instructions for running the three profilers on the two example program structures. 

The detail READMEs show the data model for the profiler concerned, and summaries of results on the second, simpler, example. These are extracted from the relevant detail article. They also show how to install and run the profiler on the two examples.

- [README: Hierarchical Profiler](hprof/README_HP.md)
- [README: Flat Profiler](dprof/README_DP.md)
- [README: Timer Set](timer_set/README_TS.md)

## In this README...
- [Screen Recordings on this Module](https://github.com/BrenPatF/plsql_profiling#screen-recordings-on-this-module)
- [Scenarios](https://github.com/BrenPatF/plsql_profiling#Scenarios)
- [Features Summary](https://github.com/BrenPatF/plsql_profiling#Features_Summary)
- [Installation](https://github.com/BrenPatF/plsql_profiling#Installation)
- [Running Driver Scripts](https://github.com/BrenPatF/plsql_profiling#running-driver-script)
- [Operating System/Oracle Versions](https://github.com/BrenPatF/plsql_profiling#operating-systemoracle-versions)

## Screen Recordings on this Module
- [Overview]()
- [Installation and Running]()
- [Hierarchical Profiler]()
- [Flat Profiler]()
- [Timer Set]()

## Scenarios
- [In this README...](https://github.com/BrenPatF/plsql_profiling#in-this-readme)
- [Example 1: General](https://github.com/BrenPatF/plsql_profiling#Example_1__General)
- [Example 2: Sleep](https://github.com/BrenPatF/plsql_profiling#Example_2__Sleep)

<img src="Einstein_Simple_41ur1b0DkJL._AC_.jpg">

### Example 1: General
<img src="plsql_profiling - csd-gen.png">

### Example 2: Sleep
- [Scenarios](https://github.com/BrenPatF/plsql_profiling#Scenarios)

<img src="plsql_profiling - csd-slp.png">

## Features Summary
- [In this README...](https://github.com/BrenPatF/plsql_profiling#in-this-readme)

<img src="Features Table-w30.PNG">

## Installation
- [In this README...](https://github.com/BrenPatF/plsql_profiling#in-this-readme)
- [Install 1: Install prerequisite modules](https://github.com/BrenPatF/plsql_profiling#install-1-install-prerequisite-modules)
- [Install 2: Create Oracle PL/SQL Profiling components](https://github.com/BrenPatF/plsql_profiling#install-2-create-oracle-plsql-api-demos-components)

### Install 1: Install prerequisite modules
- [Installation](https://github.com/BrenPatF/plsql_profiling#installation)

The demo install depends on the prerequisite modules Utils and Timer_Set, and `lib` and `app` schemas refer to the schemas in which Utils and examples are installed, respectively.

The prerequisite modules can be installed by following the instructions for each module at the module root pages listed in the `See also` section below. This allows inclusion of the examples and unit tests for those modules. Alternatively, the next section shows how to install these modules directly without their examples or unit tests here.

#### [Schema: sys; Folder: install_prereq] Create lib and app schemas, Oracle directory and make extra grants
install_sys.sql creates an Oracle directory, `input_dir`, pointing to 'c:\input'
- Update this if necessary to a folder on the database server with read/write access for the Oracle OS user

install_sys_hprof.sql grants execute privilege on DBMS_Hprof to app and lib schemas
- Run driver script from slqplus (calls prior two install scripts, and grants CREATE TABLE to `app`):
```
SQL> @install_sys_all
```

#### [Schema: lib; Folder: install_prereq\lib] Create lib components
- Run script from slqplus:
```
SQL> @install_lib_all
```
#### [Schema: app; Folder: install_prereq\app] Create app synonyms
- Run script from slqplus:
```
SQL> @c_syns_all
```

### Install 2: Create Oracle PL/SQL Profiling components
- [Installation](https://github.com/BrenPatF/plsql_profiling#installation)

Each of the three profiling methods has its own folder, and they can be installed independently.

#### Hierarchical Profiler [Schema: app; Folder: hprof]
- Run script from slqplus:
```
SQL> @install_hprof_app
```

#### Flat Profiler [Schema: app; Folder: profiler]
- Run script from slqplus:
```
SQL> @install_dprof_app
```

#### Timer Set [Schema: app; Folder: timer_set]
- Run script from slqplus:
```
SQL> @install_timer_set_app
```

## Running Driver Scripts
- [In this README...](https://github.com/BrenPatF/plsql_profiling#in-this-readme)

Each of the three profiling methods has its own driver scripts in the folder where it's installed.

#### Hierarchical Profiler [Schema: app; Folder: hprof]
- Run scripts from slqplus for general and sleep examples (output will be in .log files):
```
SQL> @hp_example_general
SQL> @hp_example_sleep
```

The driver scripts, for the case of the hierarchical profiler only, as well as the SQL output reports in the log files, also create standard HTML reports hp_example_general.html and hp_example_sleep.html, and these are written to the folder in the Oracle directory INPUT_DIR. They are included in the current GitHub folder for reference.

#### Flat Profiler [Schema: app; Folder: profiler]
- Run scripts from slqplus:
```
SQL> @dp_example_general
SQL> @dp_example_sleep
```

#### Timer Set [Schema: app; Folder: timer_set]
- Run scripts from slqplus:
```
SQL> @ts_example_general
SQL> @ts_example_sleep
```

## Operating System/Oracle Versions
- [In this README...](https://github.com/BrenPatF/plsql_profiling#in-this-readme)

### Windows
Tested on Windows 10, should be OS-independent

### Oracle
- Tested on Oracle Database Version 19.3.0.0.0 (minimum required: 12.2)

## See also
- [PL/SQL Profiling 1: Overview](http://aprogrammerwrites.eu/?p=703)
- [Utils - Oracle PL/SQL general utilities module](https://github.com/BrenPatF/oracle_plsql_utils)
- [Timer_Set - Oracle PL/SQL code timing module](https://github.com/BrenPatF/timer_set_oracle)

## License
MIT
