#!/bin/bash
FILES=$CATALINA_HOME/webapps/*.war

for file in $FILES
do
  FILENAME="$(echo "$file" | sed "s/.*\///" | sed "s/\..*//")"
  echo $FILENAME
  echo "ProxyPass /"$FILENAME" http://"$domainname":"$TOMCAT_PORT"/"$FILENAME"" >> httpd.conf
  echo "ProxyPassReverse /"$FILENAME" http://"$domainname":"$TOMCAT_PORT"/"$FILENAME"" >> httpd.conf
done
