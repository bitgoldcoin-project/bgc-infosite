##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# http://wiki.nginx.org/Pitfalls
# http://wiki.nginx.org/QuickStart
# http://wiki.nginx.org/Configuration
#
# Generally, you will want to move this file somewhere, and start with a clean
# file but keep this around for reference. Or just disable in sites-enabled.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

#
# HTTPS server
#
        server {
            listen 80;
            server_name coin.bgc-e.com ;

            #access_log   /var/log/nginx/coin.bgc-e.com-access.log;
            #error_log    /var/log/nginx/coin.bgc-e.com-error.log;
            access_log off;

            location / {
                 root /home/odinsoft/ubsvc5/solution/bitgold/bgc-infosite/src/;
                 index index.html index.htm default.aspx Default.aspx;
                 
                 fastcgi_index bgc.html;
                 fastcgi_pass 127.0.0.1:9003;
                 
                 include /etc/nginx/fastcgi_params;
            }
        }
