# Bookmark Manager

- A project to learn about Databases, SQL, and how to incorporate them into simple web applications. 


First user story: 

```
As a user
So I can access my favourite websites quickly
I want to be able to see a list of my bookmarks.
```

Second user story:

```
As a user 
So I can add to my favourite websites
I want to be able to add new bookmarks.
```

Third user story:

```
As a user 
So I can comment on favourite websites
I want to be able to add and view comments on bookmarks.
```
### Functionality
- A user can add bookmarks with a name and a url.
- The bookmarks are displayed by name, with a link to the URL.
- A user can add and view comments on each bookmark.

### Tools used:
- Sinatra/Ruby
- Capybara
- PG
- PostgreSQL
- HTML

### To use: 
- Clone repo, run bundle install 
- Create a database in PSQL entitled 'bookmark_manager' and (if you want to run tests) 'bookmark_manager_test'.
- Run the following in psql in the databases:

```
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));
```

- Enter 'rackup' on command line.
- Navigate in browser to 'localhost:9292'
