docker cp revoke_jwt_1:/etc/nginx/conf.d/snakeoil.crt /tmp/jwt.crt
docker cp revoke_jwt_1:/etc/nginx/conf.d/snakeoil.key /tmp/jwt.key
cmp jwt.crt /tmp/jwt.crt
cmp jwt.key /tmp/jwt.key

docker cp revoke_jwt_1:/opt/auth-server-poc/cert/public.pem /tmp/jwt-sign.pem
docker cp revoke_back_1:/usr/src/app/certs/jwt.pem /tmp/back-jwt-sign.pem
cmp /tmp/jwt-sign.pem /tmp/back-jwt-sign.pem

docker cp revoke_jwt_1:/opt/auth-server-poc/userdb/.htpasswd /tmp/jwt-htpasswd
cmp /tmp/jwt-htpasswd htpasswd
