echo "Install Starting..."
mkdir piwik-mysql
mkdir piwik-www

cd piwik-www
wget http://builds.piwik.org/piwik.zip
unzip piwik.zip
rm How\ to\ install\ Piwik.html
rm piwik.zip
mv piwik/* .
cd ../

docker-compose up -d
docker-compose ps

rm index.html
echo "Install Complete..."
