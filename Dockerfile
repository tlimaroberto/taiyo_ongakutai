version: '3.1'
 
services:
   db:
     image: mysql:8.0
     restart: always
     container_name: mysql_compose
     networks:
      - net-backend
     volumes:
       - db_data:/var/lib/mysql
     environment:
       MYSQL_ROOT_PASSWORD: root
       MYSQL_DATABASE: ongakutai_nucleo_sul_oeste
       MYSQL_USER: tarcio
       MYSQL_PASSWORD: ongakutai
 
   wordpress:
     depends_on:
       - db
     image: wordpress:4.7-php5.6
     restart: always
     container_name: wordpress_compose
     networks:
      - net-backend
     ports:
       - "9080:80"
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_NAME: wordpress
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
 
networks:
  net-backend:
 
volumes:
    db_data:
