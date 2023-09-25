create database imbd;
use imbd;
1. Movie should have mulitple media(Video or Image)
create table Movie(
    id int auto_increment,
    movieName varchar(255) not null,
    data_publish varchar(255) not null,
    movieDuration varchar(255) not null,
    Director varchar(255) not null,
    Cast varchar(500) not null,
    img_id int not null,
    img_url varchar(500) not null,
    createdAt timestamp default current_timestamp,
    updatedAt timestamp on update current_timestamp,
    primary key(id)
);

insert into  Movie(Movie_name,date_published,movieDuration,Director,Cast,img_url,img_id)
values('Viduthalai','31-03-2023','2hrs 30min','Vetrimaaran','Soori,Vijay Sethupathi,Bhavani Sre','https://rb.gy/focim',1),
  ('Bommai Nayagi','03-02-2023','2hrs 03min','Shan','Yogi Babu,Srimathi,G.M Kumar','https://rb.gy/94eda',2);

   select * from Movie;

2. Movie can belongs to multiple Genre

 create table Genre(
 id int not null auto_increment,
 Genre_id int,
 Genre varchar(255),
 primary key(id),
 foreign key(Genre_id) references Movie(id)
 );

 insert into Genre(Genre_id,Genre) values(1,'Action, Adventure, Thriller'),
 (2,'Action, Drama');

 select * from Genre;


 3. Movie can have multiple reviews and Review can belongs to a user
 create table Reviews(
 id int not null auto_increment,
 user_id int,
 user_name varchar(255) not null,
 rating int not null,
 primary key(id),
 foreign key(user_id) references Movie(id)
 );

 insert into Reviews(user_id,user_name,rating) values(1,'Hema',8),
 (2,'Sathish',9);

 select * from Reviews;


 4. Artist can have multiple skills

 create table Skills(
 id int not null auto_increment,
 Artist_name varchar(255),
 Artist_id int,
 Skills varchar(255),
 primary key(id),
 foreign key(Artist_id) references Movie(id)
 );

 insert into Skills(Artist_name,Artist_id,Skills) values('G.V Prakash',1,'Playback Singer,Actor,Music Director,Producer'),
 ('Nayanthara',2,'Actress,Producer');

 select * from Skills;


  5. Artist can perform multiple role in a single film

 create table Role(
 id int not null auto_increment,
 Artist_id int,
 Artist_name varchar(255),
 movie_name varchar(255),
 Artist_role varchar(255),
 primary key(id),
 foreign key(Artist_id) references Movie(id)
 );

  insert into Role(Artist_id,Artist_name,movie_name,Artist_role) 
  values(1,'G.V Prakash','Bachelor','Actor,Music Director')
  ,(2,'Nayanthara','Netrikann','Actress,Producer');

 select * from Role;