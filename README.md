# Data_Engineering

## Pulling data from the database

**sql2csv**
This is a format we can use to rub sql queries on the commandline without the need for sql clients like *pgadmin*.It works on a variety of databases like MS Sql, MySql, PostgresSQL and SQL lite.
It excecutes the command given pulls the data from the database and saves the results as a local csv file.
You can run the following command on your terminal for full documentation and understanding of the optional arguments

```sql2csv -h```

The syntax is as follows:

```
sql2csv --db "<databsetype>:///<databasename>"\
        --query "<sqlquery>"\
        > <the csv file to be saved into>
```

For example;

```
sql2csv --db "mysql:///spotify"\
        ---query "SELECT * FROM spotify-songs"\
        > spotify-songs.csv
```

The backslash (\) enables the commandline to know that this command has not finished and needs to continue in the next line.
The --db line tell the sql2csv how to connect to the database and is followed by a database connection string.This string varies for each type of database eg:
 SQLITE starts with *sqllite:///* and ends with *.db*
 POSTGRES/MYSQL starts with *postgres:/// or mysql:///* and with no *.db* at the end.
The --query option is used to pass the query used to pull the data from the database.It is a string and thus required to be within ("")double quotes.Remember to always use the syntax of the database spesified.The query should always be written in one single line no matter how long or complex it is.
Finally, the redirect(>) will save the output in a csv file.If the output is not redirected it will be saved in the console log.

**csvsql**
So now we have our data stored in a csv file ,how do we manipulate it using the command line?
The **csvsql** allow us to apply sql like syntax to local csv files without needing to set up a local database.
How this works is , the csvsql creates an in memory sql database that temporarily host the file being processed.
This is only suitable for small and medium files only.For full documentation, use ```csvsql -h```

```csvsql --query "SELECT * FROM spotify-songs LIMIT 1" spotify-songs.csv```



##  Python Recap

> Python is on of the various tools which are very important in terms of analysis and interpretation of various datasets.It uterlises features such as *packages, modules and functions* to perform its tasks. 
**Packages** - they hold the other parts of the program. One significant feature is that, they must contain an *__init__.py* file in them in order to make te file and its folders accessible. Packages can be inbuilt eg *numpy* or can be created by the user as required.
*Pypi* gives us an easy platform to leverage inbuilt functions like *panadas and numpy*.
-We can usterlise the __init__.py function to import a file which is in our package.Assuming we have a package containing  a file called utils , with a function called sing, we can do as shown in the __init__.py file.

```
from .utils import sing
```

>Python also enables package sharing using *requirements.txt*(defines spesific version required to run the package) and *setup.txt*(tells pip how to install te packages eg on a n environment level using **pip install .** / **pip install -r requirements.txt** for the required version ) files.These files fall into tte same directory as the package.


**Modules** are similar to files or classes in any other programming language.They consist of the *attributes and functions* used in defining our module.

**Fuctions** describe how a particular action especially concerning a module is defined.

> We also have a help function which comes in handy when learning more about a character.

```
#learning about numpy's busday_count method
help(numpy.busday_count)
```

### PEP 8
> The Python Enhancement Protocol enables us to format our code in such a way that other pytonistas will be able to understand and articulate using tools like *pycodestyle*
It instructs that **all** package names to be in **lowercase** and only use **underscores** if it improves **readability**.
It also states that all classes should be written in **camelcase** eg:

```
class MyClass:
    def __init__(self):
        # attributes and methods
```



