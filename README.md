<<<<<<< HEAD

Loin Testlink URL
http://localhost:83/login.php 

Admin Login: admin
Password: Nasru@2022

docker-compose restart
docker-compose up -d


version: '2'
services:
  bugzilla-db:
    container_name: bugzilla-db
    image: postgres:10
    restart: always
    ports:
      - 5432:5432
    volumes:
      - bugzilla-db-data:/var/lib/postgresql/data
      - ./bugs_backup.sql:/docker-entrypoint-initdb.d/bugs_backup.sql  # Mount the SQL file into the container
    environment:
      TZ: "America/New_York" # Set timezone to India Standard Time (IST)
      POSTGRES_DB: "bugs"
      POSTGRES_USER: "bugs"
      POSTGRES_PASSWORD: "bugs"
    networks:
      - bugzilla-net

  bugzilla-svc:
    container_name: bugzilla-svc
    image: bugzilla-image:v1.5
    restart: always
    ports:
      - 8080:80
      - 443:443
    environment:
      TZ: "America/New_York" # Set timezone to India Standard Time (IST)
      BUGZILLA_ADMIN_EMAIL: "khazi.devops@gmail.com"
      BUGZILLA_ADMIN_NAME: "administrator"
      BUGZILLA_ADMIN_PASS: "Nasru@2022"
      BUGZILLA_DB_HOST: "bugzilla-db"
      BUGZILLA_DB_PORT: "5432"
      BUGZILLA_DB_NAME: "bugs"
      BUGZILLA_DB_USER: "bugs"
      BUGZILLA_DB_PASS: "bugs"
      # SMTP Settings
      SMTP_HOST: "smtp.gmail.com"
      SMTP_USER: "testlinkbugzilla@gmail.com"
      SMTP_PASSWORD: "ltgwzaisbvqrmwzo"
      SMTP_PORT: "587"
      SMTP_CONNECTION_MODE: "tls"
    depends_on:
      - bugzilla-db
    networks:
      - bugzilla-net

  tl-mariadb:
    container_name: tl-mariadb
    image: bitnami/mariadb:latest
    ports:
      - "3306:3306"  # Corrected syntax
    volumes:
      - tl-mariadb-data:/bitnami/mariadb
      - ./tl_testlink_backup_utf8.sql:/docker-entrypoint-initdb.d/tl_testlink_backup_utf8.sql
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
      - MARIADB_USER=tl_testlink
      - MARIADB_DATABASE=tl_testlink
    networks:
      - testlink-net

  tl-testlink:
    container_name: tl-testlink
    image: bitnami/testlink-archived
    ports:
      - 83:8080
      - 444:8443
    volumes:
      - tl-testlink-data:/bitnami/testlink
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
      - TESTLINK_DATABASE_HOST=tl-mariadb
      - TESTLINK_DATABASE_PORT_NUMBER=3306
      - TESTLINK_DATABASE_USER=tl_testlink
      - TESTLINK_DATABASE_NAME=tl_testlink
      - TESTLINK_USERNAME=admin
      - TESTLINK_PASSWORD=Nasru@2022
      - TESTLINK_EMAIL=khazi.devops@gmail.com
      - SMTP_ENABLE=true
      - SMTP_HOST=smtp.gmail.com
      - SMTP_USER=khazi.devops@gmail.com
      - SMTP_PASSWORD=ifcqfdcnoraexgtl
      - SMTP_PORT=587
      - SMTP_CONNECTION_MODE=tls
    depends_on:
      - tl-mariadb
    networks:
      - testlink-net

networks:
  bugzilla-net:     
  testlink-net:

volumes:
  bugzilla-db-data:
  tl-mariadb-data:
  tl-testlink-data:
=======
# <img width="1181" alt="image" src="https://github.com/khazidevops/testlink/assets/150345653/9edc5af5-95c7-4af3-a408-3edc6dd4f37e">


docker run -d --name=mysql --restart=always --network=app-net \
    -p 8081:3306 \
    -v /Volumes/mydata/Docker/mysql-1:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=pwd123 \
    mysql

    

    

khazinaseeruddin@khazis-MacBook-Pro testlink12 % docker run -d --name=testlink --restart=always --network=app-net \
    -p 8082:8080 \
    -v testlink_data:/bitnami \
    -e TESTLINK_USERNAME=admin \
    -e TESTLINK_PASSWORD=pwd123 \
    -e TESTLINK_DATABASE_USER=root \
    -e TESTLINK_DATABASE_PASSWORD=pwd123 \
    -e TESTLINK_DATABASE_NAME=testlink \
    -e TESTLINK_DATABASE_HOST=mysql \
    bitnami/testlink-archived
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
ceb0e8073017573544a7770c3149b4ea9494f46052bf287b07b8e9769782c9bd


<img width="1357" alt="image" src="https://github.com/khazidevops/testlink/assets/150345653/fa0e0590-93c1-4129-9178-77b7eb159fee">

>>>>>>> 773f7eea86d50433433f9cd340434b557cafa08c
