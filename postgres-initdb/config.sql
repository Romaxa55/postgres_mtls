ALTER SYSTEM SET ssl_cert_file TO '/etc/ssl/server.crt';
ALTER SYSTEM SET ssl_key_file TO '/etc/ssl/server.key';
ALTER SYSTEM SET ssl_ca_file TO '/etc/ssl/root.crt';
ALTER SYSTEM SET ssl TO 'ON';

