#                              Employee Activity Logger

Our project The Employee Activity Logger is typically a Web Application that caters the much needed functionalities of the daily working employees under the Steel Plant hood. Not only simply catering the needs but we have taken all the efforts to enhance the efficiency of carrying out their tasks at a comparatively much swifter and flawless fashion.

The actual ingredients of the Employee Activity Logger are as follows:

To start with, the **Database** used in this project was ORACLE 11g Express Edition. The Oracle Database 11_g_ Express Edition (Oracle Database XE) is an entry-level, small-footprint database based on the Oracle Database 11_g_ Release 2 code base. This is purely a relational database and we had used a total of 3 tables, which sufficiently fulfilled the needs of our project&#39;s data storage.

The tables along with their constraints are illustrated though the following sequence of snippets.

![alt text](http://url/to/img.png)

All necessary Database design steps like Normalization, etc were taken in order to eliminate redundant data and erroneous data retrievals.

Achieving for Platform Independence and higher security we have chosen the Java Enterprise Edition as the programming language for the build of this entire web application . JavaEE 6.0 have been used and the Java Database Connectivity (JDBC) API has been used for connecting to the database. We have used the THIN Driver (ojdbc6.jar) as the driver for connecting database of oracle.

The front end of this project includes the HTML5 as its crux and Cascading Style Sheets(CSS3) . We have always tried to maintain a reasonably rich User-Interface and at the end we almost achieved it.

JQuery has been used in achieving the rich user interface which was a result of JQuery&#39;s effects and its highly functional JavaScript library. The entire Front End validations have been done with the help of JQuery library.

Java Server Pages were used to execute the business logic for the entire application. Our project&#39;s architecture was created more robust so that it would be fit for exhibiting the most wanted feature of scalability.

The user initially views a HTML page and is requested to input his mode of Activity.

Here every Employee is authenticated by Registering for the EAL in our ealregister.html page. The following code snippet shows the employee registration page where the employee just enters his/her employee id and the basic details are pre-fetched in order to provide authenticated registration. Then a password matching the required criteria is accepted and the registration would be completed:

 Here there will be no duplicate and proxy registrations whatsoever as we validate the employee id and match with the already present employee database at the RINL-VSP. Every employee is requested to choose a password during his/her registration.

Later the employee Logs in for performing his activities. The following is the snippet showing the EAL&#39;s Log-In page :

Here the user Logs In and enters his workspace to access all his/her activities.

The first and the basic activity is the LOG BOOK ENTRY on a daily basis. The following snippets show the Log Book entry page in the employee workspace.



The next major service being catered by the EAL as a web application is SEARCHING THE PAST ACTIVITIES based on two conditions :

 1) DATE Period                                                 2) ACTIVITY TYPE

The following screenshot clearly depicts the searching activity of the EAL by DATES basis.



The following screenshot clearly depicts the searching activity of the EAL by ACTIVITY basis :



Also facilities are provided for exporting the search results into PDF&#39;s and EXCEL sheets which look as follows.
