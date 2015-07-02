docker-compose kill PiwikMysql
docker-compose kill PiwikNginx
docker-compose rm PiwikMysql
docker-compose rm PiwikNginx

rm -Rf PiwikMysql
rm -Rf PiwikWww
