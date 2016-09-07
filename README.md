# CrudValdeJava

CONFIGURACIÓN

context.xml

<?xml version="1.0" encoding="UTF-8"?>
<Context path="/CrudValde">
    <ResourceLink global="jdbc/clientes" name="jdbc/clientes" type="javax.sql.DataSource" />
</Context>

server.xml

<GlobalNamingResources>
      <Resource name="jdbc/clientes" auth='container'
            type="javax.sql.DataSource"
            maxActive='100' maxIdle="30" maxWait="10000"
            username="****"
            password="****"
            driverClassName='com.mysql.jdbc.Driver'
            url='jdbc:mysql://localhost/clientes'/>
    <Resource auth="Container" description="User database that can be updated and saved" factory="org.apache.catalina.users.MemoryUserDatabaseFactory" name="UserDatabase" pathname="conf/tomcat-users.xml" type="org.apache.catalina.UserDatabase"/>
  </GlobalNamingResources>
