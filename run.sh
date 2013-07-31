VERSION=2.33.0
JAR_FILE=selenium-server-standalone-$VERSION.jar

# Download Selenium Standalone Server
curl -O http://selenium.googlecode.com/files/$JAR_FILE

# Start Selenium and wait for port 4444 to become available
nohup java -jar $JAR_FILE & while ! nc -vz localhost 4444; do sleep 1; done
