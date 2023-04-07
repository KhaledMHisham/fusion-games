# fusion-games
Overview:

Fusion Games is a platform that aims to provide gamers with an easy-to-use inteface where they can browse and purchase their favorite games conveniently. It also includes features such as a user account system, a shopping cart, and a checkout system. Additionally, users can also download the games they purchase directly from the platform, making the experience even more convenient.

As an admin, you will have access to a wide range of features to help manage the platform. You can add and edit games to the platform, view user orders.

Getting Started



* Dependencies:
    * JAVA:
        * You can find Java17 [here](https://www.oracle.com/eg/java/technologies/downloads/#java17).
        * **JAVA_HOME**: **path/to/java**
        * Add **path/to/java/bin** to **PATH**
        * Run Command: **java -version**
    * MYSQL Database v8.0.32:
        * You can find the database server  [here](https://dev.mysql.com/downloads/installer/).
        * Import the schema file fusion.sql provided in the repository from your MySQL Workbench.
    * Apache Tomcat 10.1.7:
        * You can find the apache tomcat server [here](https://tomcat.apache.org/download-10.cgi).
        * Download the Windows Zip file then extract it.
        * Unpack then add the following Environment Variables:
            * **CATALINA_HOME** : **path/to/tomcat**
            * Add **path/to/tomcat/bin** to **PATH**
            * Run command: **catalina start** to start the server
    * Apache Maven :
        * You can find Apache Maven [here](https://maven.apache.org/download.cgi).
        * Download the Binary Zip Archive.
        * Unpack then add the following Environment Variables:
            * Add **path/to/maven/bin** to **PATH**
            * Run Command: **mvn -version**
* Go to the project file in the same directory as the pom.xml file and run the following command: **mvn package tomcat7:redeploy**

* Create a new admin account.
* Add games.
