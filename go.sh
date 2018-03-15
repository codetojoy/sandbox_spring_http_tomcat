
MY_TOMCAT_HOME=$MY_TOOLS_HOME/tomcat_7062_on_5150

echo "Stopping tomcat..."
$MY_TOMCAT_HOME/bin/shutdown.sh 

echo "Cleaning ..."
rm $MY_TOMCAT_HOME/logs/* 
rm -rf $MY_TOMCAT_HOME/webapps/User*
rm -rf $MY_TOMCAT_HOME/webapps/Billing*
rm -rf $MY_TOMCAT_HOME/webapps/Compound*

echo "Building ..."
gradle :UserService:clean :UserService:war
gradle :BillingService:clean :BillingService:war
gradle :CompoundService:clean :CompoundService:war
gradle :client:clean :client:iD

cp UserService/build/libs/UserService.war $MY_TOMCAT_HOME/webapps
cp BillingService/build/libs/BillingService.war $MY_TOMCAT_HOME/webapps
cp CompoundService/build/libs/CompoundService.war $MY_TOMCAT_HOME/webapps

echo "Starting tomcat..."
$MY_TOMCAT_HOME/bin/startup.sh

echo "Ready."
