server {
          listen       80;
          server_name  *.lightschool.com;
          root   /www/lightschool/student/web/;
          if ( $host ~* (.*)\.(.*)\.(.*)){
              set $domain $1;
          }

          location / {
              autoindex  on;
              send_timeout 1800;
              fastcgi_buffers 8 128k;
              fastcgi_intercept_errors on;
      
              if ( !-e $request_filename ) {
                  rewrite ^/(.*)$ /index.php/$1 last;
              }
          }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

        location ~ \.php {
            include        fastcgi_params;
            set $real_script_name $fastcgi_script_name;
            set $path_info "";
            set $real_script_name $fastcgi_script_name;
            if ($fastcgi_script_name ~ "^(.+\.php)(/.+)$") {
                set $real_script_name $1;
                set $path_info $2;
            }
            fastcgi_param TIDEWAYS_SAMPLERATE "25";
            fastcgi_param PHP_VALUE "auto_prepend_file=/www/xhgui/external/header.php";
            fastcgi_param SCRIPT_FILENAME $document_root$real_script_name;
            fastcgi_param SCRIPT_NAME $real_script_name;
            fastcgi_param PATH_INFO $path_info;
            #fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
        }


    }