# Part 4: SQL
Record your queries and any resulting output below.

## Release 0:  Query the Database
1.  What are all the book titles?

    Query:

    ```sql
    select title from books;
    ```

    Result:

    ```sql
    Rails 4 Test Prescriptions
    Metaprogramming Ruby 2
    Programming Ruby 1.9 & 2.0
    Pragmatic Programmer
    Practical Object Oriented Design in Ruby
    The Rails 4 Way
    Objective-C Programming
    iOS Programming
    JavaScript: The Good Parts
    JavaScript: The Definitive Guide
    Functional JavaScript
    Build iOS Games with SpriteKit
    Test iOS Apps with UI Automation
    Design Patterns in Ruby
    Eloquent Ruby
    Web Design with HTML & CSS
    JavaScript and jQuery
    Well-Grounded Rubyist
    Essential Algorithms
    Introduction to Algorithms
    Data Visualization Toolkit
    ```

2.  Which book titles contain "Ruby"?

    Query:

    ```sql
    select title from books
    where title like '%Ruby%';
    ```

    Result:

    ```sql
    Metaprogramming Ruby 2
    Programming Ruby 1.9 & 2.0
    Practical Object Oriented Design in Ruby
    Design Patterns in Ruby
    Eloquent Ruby
    Well-Grounded Rubyist
    ```

3.  Which book titles were authored by "Jonathan Penn"?

    Query:

    ```sql
    select title from authors
    join books
    on authors.id = books.author_id
    where name = "Jonathan Penn";
    ```

    Result:

    ```sql
    Build iOS Games with SpriteKit
    Test iOS Apps with UI Automation
    ```

4.  What are the names of the publishers with books whose titles contain "iOS"? (Each name should be listed once; no repeats.)

    Query:

    ```sql
    select name from publishers
    join books
    on publishers.id = books.publisher_id
    where title like '%Ruby%'
    group by name;
    ```

    Result:

    ```sql
    Addison-Wesley
    Manning Publications
    Pragmatic Programmers
    ```

5.  What are the names of the publishers with books authored by Russ Olsen? (Each name should be listed once; no repeats.)

    Query:

    ```sql
    select publishers.name from publishers
    join books
    on publishers.id = books.publisher_id
    join authors
    on authors.id = books.author_id
    where authors.name = 'Russ Olsen'
    group by publishers.name;
    ```

    Result:

    ```sql
    Addison-Wesley
    ```

6.  What is the name of the publisher who's published the most books, and how many books has it published?

    Query:
    ************* Incomplete - come back later.  need to list all titles, too.
    ```sql
    select count(title), name, title from publishers
    join books
    on publishers.id = books.publisher_id
    group by publishers.name
    order by count(title) desc
    limit 1;
    ```

    Result:

    ```sql
    6|Addison-Wesley|Data Visualization Toolkit
    ```


### Release 1: Modify the Database  
1.  O'Reilly, one of the publishers in the database, published a book titled "Apprenticeship Patterns".  It was written by Dave Hoover.  Update the database to reflect this.

    Statements run:

    ```sql
    < your SQL statements here >
    ```

2.  There's an author named Obie Fernandez in the database.  The name should be Obed (Obie) Fernandez.  Update the database to reflect this.

    Statements run:

    ```sql
    < your SQL statements here >
    ```

3.  We don't need to store data on books published by Wiley.  Remove this publisher and their books from the database.

    Statements run:

    ```sql
    < your SQL statements here >
    ```
