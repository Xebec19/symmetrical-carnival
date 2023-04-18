CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE platform_enum AS ENUM('google','discord');

-- it contains posts
create table posts (
    id uuid default uuid_generate_v4() primary key,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- it contains comments by users on one post
create table comments (
    id uuid default uuid_generate_v4() primary key,
    post_id uuid references posts(id) on delete cascade,
    author_id VARCHAR(255) NOT NULL,
    platform platform_enum default 'google' not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    body TEXT NOT NULL
);

-- alter column name in posts
alter table posts 
drop column content;

alter table posts 
add column source varchar(255);

-- add tags column
alter table posts add column tags varchar(255)[] ;

-- add first record
INSERT INTO public.posts
(title, created_at, updated_at, "source", tags)
VALUES('Future of web development', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/FUTURE_OF_WEB_DEVELOPMENT.md', '{"web development"}');

-- add second record
INSERT INTO public.posts
(title, created_at, updated_at, "source", tags)
VALUES('Introduction to React', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/INTRODUCTION_TO_REACT.md', '{"web development","react","frontend"}');

-- added description for post
alter table posts 
add column description text;

update posts 
set description = 'Web development has come a long way since the early days of static HTML pages. Today, the web is a dynamic and interactive platform that allows for real-time communication, multimedia content, and complex data processing. As technology continues to evolve at a rapid pace, the future of web development is poised to bring even more exciting innovations to the table.'
where id = '5f1ccc79-945c-4f7d-945a-721997c0a3e0';

update posts 
set description = 'React is an open-source JavaScript library for building user interfaces or UI components. It was developed and maintained by Facebook and was released in 2013. Since then, React has become one of the most popular frontend libraries, and is widely used by developers to build modern web applications.'
where id = '5f1ccc79-945c-4f7d-945a-721997c0a3e0';

-- added image url column in post table
alter table posts add column image_url varchar(255);

-- added image reference which will help me to show credits of image
alter table posts add column image_reference text;

-- added image for posts
update posts 
set image_url = 'https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/kobu-agency-7okkFhxrxNw-unsplash.jpg', 
image_reference = 'https://unsplash.com/@kobuagency?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText'
where id = '9b588811-c8d2-47e4-bc86-30c933520731';

update posts 
set image_url = 'https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/lautaro-andreani-xkBaqlcqeb4-unsplash.jpg', 
image_reference = 'https://unsplash.com/@lautaroandreani?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText'
where id = '5f1ccc79-945c-4f7d-945a-721997c0a3e0';

