VERSION=2.37.0
JAR_FILE=selenium-server-standalone-$VERSION.jar
CACHE_DIR="${WERCKER_CACHE_DIR}/wercker/selenium-server"

[ ! -d "${CACHE_DIR}" ] && mkdir -p $CACHE_DIR

cd $CACHE_DIR

if [[ ! -f "${CACHE_DIR}/${JAR_FILE}" ]]; then
  # Download Selenium Standalone Server
  curl -O http://selenium.googlecode.com/files/$JAR_FILE
fi

# Start Selenium and wait for port 4444 to become available
nohup java -jar $JAR_FILE & while ! nc -vz localhost 4444; do sleep 1; done
