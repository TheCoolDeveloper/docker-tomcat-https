FROM sandhya/https24:latest
MAINTAINER Sandhya Nayak

RUN echo setting tomcat port as environment var
ENV TOMCAT_PORT 8080
WORKDIR $HTTPD_PREFIX/conf

ADD deploy_war.sh .
RUN chmod 777 *.sh


RUN echo Copying the war files to tomcat
COPY webapps $CATALINA_HOME/webapps

RUN echo Setting httpd.conf using script for wars
#Add script
RUN ./deploy_war.sh

CMD /usr/local/tomcat/bin/startup.sh && /usr/local/apache2/bin/apachectl -DFOREGROUND
