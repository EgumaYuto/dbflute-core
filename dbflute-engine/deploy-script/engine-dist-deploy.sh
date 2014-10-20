cd ..
ant -f build.xml dist
ant -f build.xml reflect-to-test-active-dockside
ant -f build.xml reflect-to-test-active-hanger
ant -f build.xml reflect-to-test-dbms-mysql
ant -f build.xml reflect-to-test-dbms-postgresql
ant -f build.xml reflect-to-test-option-compatible10x

cd ..
export answer=y

cd ../dbflute-test-active-dockside/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-active-hanger/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-dbms-mysql/dbflute_maihamadb
rm ./log/*.log
# not replace-schema because of big data
. manage.sh regenerate
cd ..
mvn -e compile

cd ../dbflute-test-dbms-postgresql/dbflute_maihamadb
rm ./log/*.log
# not replace-schema because of big data
. manage.sh regenerate
cd ..
mvn -e compile

cd ../dbflute-test-option-compatible10x/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile