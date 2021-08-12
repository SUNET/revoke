# Add TLS cerificate
docker cp jwt.crt revoke_jwt_1:/etc/nginx/conf.d/snakeoil.crt
docker cp jwt.key revoke_jwt_1:/etc/nginx/conf.d/snakeoil.key

# Add .htpasswd containing test:test
docker cp htpasswd revoke_jwt_1:/opt/auth-server-poc/userdb/.htpasswd

# Generate public/private JWT signing keypair
docker exec revoke_jwt_1 openssl ecparam -genkey -name prime256v1 -noout -out /opt/auth-server-poc/cert/private.pem
docker exec revoke_jwt_1 openssl ec -in /opt/auth-server-poc/cert/private.pem -pubout -out /opt/auth-server-poc/cert/public.pem
docker exec revoke_jwt_1 chgrp www-data /opt/auth-server-poc/cert/private.pem
docker exec revoke_jwt_1 chmod g+r /opt/auth-server-poc/cert/private.pem

# Copy public JWT signing key to `back`
docker cp revoke_jwt_1:/opt/auth-server-poc/cert/public.pem /tmp/jwt.pem
docker cp /tmp/jwt.pem revoke_back_1:/usr/src/app/certs/jwt.pem
