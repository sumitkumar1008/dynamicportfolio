FROM tomcat:9.0-jdk11

ENV CATALINA_HOME /usr/local/tomcat
WORKDIR /tmp/build

# Install utilities
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Download MySQL connector
RUN wget -q https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar -O $CATALINA_HOME/lib/mysql-connector-java.jar

# Copy source and webcontent
COPY src /tmp/build/src
COPY WebContent /tmp/build/WebContent

# Prepare webapp directory
RUN mkdir -p $CATALINA_HOME/webapps/ROOT/WEB-INF/classes

# Compile Java sources (collect list and compile)
RUN find /tmp/build/src -name "*.java" > /tmp/sources.txt \
    && javac -d $CATALINA_HOME/webapps/ROOT/WEB-INF/classes -cp $CATALINA_HOME/lib/mysql-connector-java.jar @/tmp/sources.txt || true

# Copy web content into Tomcat ROOT
RUN cp -R /tmp/build/WebContent/* $CATALINA_HOME/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh","run"]
