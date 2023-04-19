CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE platform_enum AS ENUM('google','discord');

-- it contains posts
CREATE TABLE public.posts (
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	title varchar(255) NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	"source" varchar(255) NULL,
	tags _varchar NULL,
	description text NULL,
	image_url varchar(255) NULL,
	image_reference text NULL,
	CONSTRAINT posts_pkey PRIMARY KEY (id)
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

INSERT INTO public.posts (id,title,created_at,updated_at,"source",tags,description,image_url,image_reference) VALUES
	 ('9b588811-c8d2-47e4-bc86-30c933520731','Future of web development','2023-04-16 19:23:09.307508','2023-04-16 19:23:09.307508','https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/FUTURE_OF_WEB_DEVELOPMENT.md','{"web development"}','Web development has come a long way since the early days of static HTML pages. Today, the web is a dynamic and interactive platform that allows for real-time communication, multimedia content, and complex data processing. As technology continues to evolve at a rapid pace, the future of web development is poised to bring even more exciting innovations to the table.','https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/kobu-agency-7okkFhxrxNw-unsplash.jpg','https://unsplash.com/@kobuagency?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText'),
	 ('5f1ccc79-945c-4f7d-945a-721997c0a3e0','Introduction to React','2023-04-16 19:45:49.96016','2023-04-16 19:45:49.96016','https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/INTRODUCTION_TO_REACT.md','{"web development",react,frontend}','React is an open-source JavaScript library for building user interfaces or UI components. It was developed and maintained by Facebook and was released in 2013. Since then, React has become one of the most popular frontend libraries, and is widely used by developers to build modern web applications.','https://symmetrical-carnival.s3.ap-south-1.amazonaws.com/publicprefix/lautaro-andreani-xkBaqlcqeb4-unsplash.jpg','https://unsplash.com/@lautaroandreani?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText');