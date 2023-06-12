alter table posts add column slug varchar(100);

update posts 
set slug='future-of-web-development' 
where title='Future of web development';

update posts 
set slug='introduction-to-react' 
where title='Introduction to React';

update posts 
set slug='database-migration-in-go-with-soda' 
where title='Database Migration in Go Projects with Soda: A Concise Guide';

update posts 
set slug='html-sse' 
where title='HTML SSE: Simplifying Real-Time Web Communication';

