echo "Install Starting..."
apt-get install wget
apt-get install unzip
apt-get install curl

mkdir PiwikMysql
mkdir PiwikWww

cd PiwikWww
wget http://builds.piwik.org/piwik.zip
unzip piwik.zip
rm How\ to\ install\ Piwik.html
rm piwik.zip
mv piwik/* .
cd ../

curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker-compose up -d
docker-compose ps

rm PiwikWww/index.html
echo "Install Complete..."
