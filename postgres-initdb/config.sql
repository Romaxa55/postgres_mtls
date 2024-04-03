ALTER SYSTEM SET ssl_cert_file TO '/var/lib/pgsql/data/server.crt';
ALTER SYSTEM SET ssl_key_file TO '/var/lib/pgsql/data/server.key';
ALTER SYSTEM SET ssl_ca_file TO '/var/lib/pgsql/data/root.crt';
ALTER SYSTEM SET ssl TO 'ON';

