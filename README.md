IF ID SEQUENCE BECOMES OUT OF SYNC BETWEEN CLIENT AND DATABASE
check if these two are different:

```
SELECT MAX(id) FROM bookmarks;
SELECT nextval('bookmarks_id_seq');
```
get them back in sync by running the following: 

```
SELECT setval('bookmarks_id_seq', max(id)) FROM bookmarks;
```


First user story: 

```
As a user
So I can access my favourite websites quickly
I want to be able to see a list of my bookmarks.
```

![Domain Model Diagram](<imc src = "INSERT DIAGRAM">)

Second user story:

```
As a user 
So I can add to my favourite websites
I want to be able to add new bookmarks.
```

