drop database if exists vk;
create database vk;
use vk;

drop table if exists users;
create table users (
	id bigint unsigned not null auto_increment primary key, 
    firstname varchar(50),
    lastname varchar(50),
    email varchar(120) UNIQUE,
 	password_hash varchar(100),
	phone bigint unsigned unique, 
	
    index users_firstname_lastname_idx(firstname, lastname)
);

drop table if exists profiles;
create table profiles (
	user_id bigint unsigned not null unique,
    gender char(1),
    birthday date,
    hometown varchar(100),
	photo_id bigint unsigned not null,
    created_at datetime default now()
);

alter table profiles add constraint fk_user_id
    foreign key (user_id) references users(id)
    on update cascade
    on delete restrict;

drop table if exists messages;
create table messages (
	id serial,
	from_user_id bigint unsigned not null,
    to_user_id bigint unsigned not null,
    body text,
    created_at datetime default now(),
    foreign key (from_user_id) references users(id),
    foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests (

	initiator_user_id bigint unsigned not null,
    target_user_id bigint unsigned not null,
    status enum('requested', 'approved', 'declined', 'unfriended'),
	requested_at datetime default now(),
	updated_at datetime on update current_timestamp,
    
	primary key (initiator_user_id, target_user_id),
    foreign key (initiator_user_id) references users(id),
    foreign key (target_user_id) references users(id)
);

alter table friend_requests 
add check(initiator_user_id <> target_user_id);

drop table if exists communities;
create table communities(
	id serial,
	name varchar(100),
	admin_user_id bigint unsigned not null,
	
	index communities_name_idx(name),
	foreign key (admin_user_id) references users(id)
);

drop table if exists users_communities;
create table users_communities(
	user_id bigint unsigned not null,
	community_id bigint unsigned not null,
  
	primary key (user_id, community_id),
    foreign key (user_id) references users(id),
    foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
	id serial,
    name varchar(10),
    created_at datetime default now(),
    updated_at datetime on update current_timestamp
);

drop table if exists media;
create table media(
	id serial,
    media_type_id bigint unsigned not null,
    user_id bigint unsigned not null,
  	body text,
    filename varchar(10),   	
    `SIZE` int,
	metadata json,
    created_at datetime default now(),
    updated_at datetime on update current_timestamp,

    foreign key (user_id) references users(id),
    foreign key (media_type_id) references media_types(id)
);

drop table if exists likes;
create table likes(
	id serial,
    user_id bigint unsigned not null,
    media_id bigint unsigned not null,
    created_at datetime default now()
    
);

drop table if exists photo_albums;
create table photo_albums (
	id serial,
	name varchar(50),
    user_id bigint unsigned default null,

    foreign key (user_id) references users(id),
  	primary key (id)
);

drop table if exists photos;
create table photos (
	id serial,
	album_id bigint unsigned not null,
	media_id bigint unsigned not null,

	foreign key (album_id) references photo_albums(id),
    foreign key (media_id) references media(id)
);

-- task 2

drop table if exists posts;
create table posts (
	id serial,
	user_id bigint unsigned not null,
	communities_id bigint unsigned not null,
	media_id bigint unsigned not null,
	body text,
	`size` int,
    created_at datetime default now(),
    updated_at datetime on update current_timestamp,

	foreign key (user_id) references users(id),
	foreign key (communities_id) references communities(id),
    foreign key (media_id) references media(id)
);

alter table likes add constraint fk_likes_media 
foreign key (media_id) references media(id);

alter table likes add constraint fk_likes_user
foreign key (user_id) references users(id);

alter table likes add posts_id bigint unsigned not null;

alter table likes add constraint fk_likes_posts
foreign key (posts_id) references posts(id);

