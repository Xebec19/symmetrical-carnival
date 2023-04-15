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