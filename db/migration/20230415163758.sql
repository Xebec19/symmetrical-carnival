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

