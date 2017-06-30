# alpine-mysql
a docker image base on alpine with mysql

# build image
```
docker build -t cc/alpine-mysql .
docker run -it --rm -v $(pwd):/data/mysql -p 3306:3306 cc/alpine-mysql
```

# Usage 
默认ROOT密码为：mysqladmin，也可在参数中指定，传参数也可指定创建数据库名称，用户名：

```
$MYSQL_ROOT_PASSWORD 
MYSQL_DATABASE=${MYSQL_DATABASE:-""}
MYSQL_USER=${MYSQL_USER:-""}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}
```

```
docker run -it --name mysql -p 3306:3306 -v $(pwd):/data/mysql -e MYSQL_DATABASE=admin -e MYSQL_USER=cc -e MYSQL_PASSWORD=mysqlpasswd -e MYSQL_ROOT_PASSWORD=mysqladmin cc/alpine-mysql
```

例子中创建了一个数据库admin，用户cc，密码为mysqladmin，默认root密码为mysqladmin。


