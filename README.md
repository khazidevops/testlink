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

