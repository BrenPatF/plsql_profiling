echo 'Usage (passing example ORACLE_HOME): ./cp_plsql_profiling_prereq.sh "C:/oracle_193"'
if [ "$1" != "" ]; then
    echo "ORACLE_HOME parameter = " $1
	ORACLE_HOME=$1
else
    echo "ORACLE_HOME parameter is empty - please supply a value!"
    exit 1
fi

cp ../../oracle_plsql_utils/c_user.sql .
cp ../../oracle_plsql_utils/drop_utils_users.sql .
cp ../../oracle_plsql_utils/endspool.sql .
cp ../../oracle_plsql_utils/initspool.sql .
cp ../../oracle_plsql_utils/install_sys.sql .
cp ../../oracle_plsql_utils/sys.bat .

cp ../../oracle_plsql_utils/lib/grant_utils_to_app.sql ./lib
cp ../../oracle_plsql_utils/lib/install_utils.sql ./lib
cp ../../oracle_plsql_utils/lib/lib.bat ./lib
cp ../../oracle_plsql_utils/lib/utils.pkb ./lib
cp ../../oracle_plsql_utils/lib/utils.pks ./lib

cp ../../oracle_plsql_utils/app/app.bat ./app
cp ../../oracle_plsql_utils/app/c_utils_syns.sql ./app

cp ../../timer_set_oracle/lib/grant_timer_set_to_app.sql ./lib
cp ../../timer_set_oracle/lib/install_timer_set.sql ./lib
cp ../../timer_set_oracle/lib/timer_set.pkb ./lib
cp ../../timer_set_oracle/lib/timer_set.pks ./lib

cp ../../timer_set_oracle/app/c_timer_set_syns.sql ./app

cp $ORACLE_HOME/rdbms/admin/proftab.sql ./lib