https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs

#### generate private key and csr
openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr

Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:New York
Locality Name (eg, city) []:Brooklyn
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Example Brooklyn Company
Organizational Unit Name (eg, section) []:Technology Division
Common Name (e.g. server FQDN or YOUR name) []:examplebrooklyn.com
Email Address []:

openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr -subj "/C=US/ST=New York/L=Brooklyn/O=Example Brooklyn Company/CN=examplebrooklyn.com"

#### generate CSR from existing private key
openssl req -key domain.key -new -out domain.csr

##### Generate a CSR from an Existing Certificate and Private Key
openssl x509 -in domain.crt -signkey domain.key -x509toreq -out domain.csr

