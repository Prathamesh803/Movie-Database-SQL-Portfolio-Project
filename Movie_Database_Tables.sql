--Creating "Actor" Table--

create table actor(
act_id integer constraint a_actid_pk primary key,
act_fname char(20),
act_iname char(20),
act_gender char(1)
);

--Inserting Values in the "Actor" Table--

Insert into Actor (act_id,act_fname,act_iname,act_gender) values (10,'rahul','rawal','m');
Insert into Actor (act_id,act_fname,act_iname,act_gender) values (20,'varun','rathee','m');
Insert into Actor (act_id,act_fname,act_iname,act_gender) values (30,'sara','roberts','f');
Insert into Actor (act_id,act_fname,act_iname,act_gender) values (40,'jatin','deonar','m');
Insert into Actor (act_id,act_fname,act_iname,act_gender) values (50,'gaurav','karun','m');

--Looking at the "Actor" Table

Select * From Actor;

--Creating "director" Table--

create table director(
dir_id integer constraint d_dirid_pk primary key,
dir_fname char(20),
dir_iname char(20)
);

--Inserting Values in the "Director" Table--

Insert into director (dir_id,dir_fname,dir_iname) values (101,'david','dhawan');
Insert into director (dir_id,dir_fname,dir_iname) values (102,'fatim','aslam');
Insert into director (dir_id,dir_fname,dir_iname) values (103,'jacky','paltrow');
Insert into director (dir_id,dir_fname,dir_iname) values (104,'robert ','stevenson');
Insert into director (dir_id,dir_fname,dir_iname) values (105,'harry','hesson');

--Looking at the "director" Table

Select * From director;

--Creating "movie" Table--

create table movie(
mov_id integer constraint m_movid_pk primary key,
mov_title char(50),
mov_year integer,
mov_time integer,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
);

--Changing the date format for this session--

alter session set nls_date_format= 'DD-MM-YYYY';

--Inserting Values in the "movie" Table--

Insert into movie (mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country,mov_dt_rel) values (1001,'THE SHIP',2011,180,'ENGLISH','USA',to_date('23-06-2011','DD-MM-YYYY'));
Insert into movie (mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country,mov_dt_rel) values (1002,'THE BAD BOYS',2014,157,'ENGLISH','AUS',to_date('14-08-2014','DD-MM-YYYY'));
Insert into movie (mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country,mov_dt_rel) values (1003,'BACKBENCHERS',2013,180,'ENGLISH','SL', to_date ('05-04-2013','DD-MM-YYYY'));
Insert into movie (mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country,mov_dt_rel) values (1004,'TRUE SPIRIT',2016,170,'JAPANESE','JAPAN', to_date ('29-06-2016','DD-MM-YYYY'));
Insert into movie (mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country,mov_dt_rel) values (1005,'FIGHTER PILOTS',2010,130,'CHINESE','CHINA', to_date('24-03-2010','DD-MM-YYYY'));

--Looking at the "movie" Table--

select * from movie;

--Creating "movie_direction" Table--

Create table movie_direction (
dir_id integer,foreign key(dir_id) references director(dir_id),
mov_id integer, foreign key(mov_id) references movie(mov_id)
);

--Inserting Values in the "movie_direction" Table--

Insert into movie_direction (dir_id, mov_id) values (101,1003);
Insert into movie_direction (dir_id, mov_id) values (102,1003);
Insert into movie_direction (dir_id, mov_id) values (101,1002);
Insert into movie_direction (dir_id, mov_id) values (103,1002);
Insert into movie_direction (dir_id, mov_id) values (104,1001);
Insert into movie_direction (dir_id, mov_id) values (104,1005);
Insert into movie_direction (dir_id, mov_id) values (102,1005);
Insert into movie_direction (dir_id, mov_id) values (103,1004);
Insert into movie_direction (dir_id, mov_id) values (105,1001);
Insert into movie_direction (dir_id, mov_id) values (105,1004);

--Looking at the "movie_direction" Table--

Select * from movie_direction;

--Creating "movie_cast" Table--

create table movie_cast(
act_id integer, foreign key(act_id) references actor(act_id),
mov_id integer, foreign key(mov_id) references movie(mov_id),
role char(30)
);

--Inserting Values in the "movie_cast" Table--

insert into movie_cast (act_id,mov_id,role) values (10,1001,'carpenter');
insert into movie_cast (act_id,mov_id,role) values (10,1001,'mechanic');
insert into movie_cast (act_id,mov_id,role) values (20,1005,'car driver');
insert into movie_cast (act_id,mov_id,role) values (30,1004,'fisherman');
insert into movie_cast (act_id,mov_id,role) values (20,1003,'villian');
insert into movie_cast (act_id,mov_id,role) values (30,1005,'gym trainer');
insert into movie_cast (act_id,mov_id,role) values (50,1002,'hero');
insert into movie_cast (act_id,mov_id,role) values (40,1004,'watchman');
insert into movie_cast (act_id,mov_id,role) values (50,1003,'iron vendor');
insert into movie_cast (act_id,mov_id,role) values (40,1002,'ticket collector');

--Looking at the "movie_cast" Table--

Select * from movie_cast;

--Creating "reviewer" Table--

create table reviewer(
rev_id integer constraint r_revid_pk primary key,
rev_name char(30)
);

--Inserting Values in the "reviewer" Table--

insert into reviewer (rev_id, rev_name) values (1,'gaurav');
insert into reviewer (rev_id, rev_name) values (2,'rupesh');
insert into reviewer (rev_id, rev_name) values (3 ,'arun');
insert into reviewer (rev_id, rev_name) values (4,'vicky');
insert into reviewer (rev_id, rev_name) values (5,'anvay');

--Looking at the "reviewer" Table--

Select * from reviewer;

--Creating "rating" Table--

create table rating (
mov_id integer,foreign key (mov_id) references movie(mov_id),
rev_id integer,foreign key(rev_id) references reviewer(rev_id),
rev_stars integer,
num_o_ratings integer
);

--Inserting Values in the "rating" Table--

insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1001,2,3,3);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1002,4,3,5);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1001,5,3,4);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1002,4,6,9);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1005,3,2,6);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1004,2,3,7);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1005,3,9,8);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1003,5,9,8);
insert into rating (mov_id, rev_id, rev_stars, num_o_ratings) values (1004,1,9,8);

--Looking at the "rating" Table--

Select * from rating;

--Creating "genres" Table--

create table genres(
gen_id integer constraint g_genid_pk primary key,
gen_title char(20)
);

--Inserting Values in the "genres" Table--

insert into genres (gen_id, gen_title) values (10001,'COMEDY');
insert into genres (gen_id, gen_title) values (10002,'THRILLER');
insert into genres (gen_id, gen_title) values (10003,'ANIMATION');
insert into genres (gen_id, gen_title) values (10004,'ACTION COMEDY');
insert into genres (gen_id, gen_title) values (10005,'ACTION');

--Looking at the "genres" Table--

Select * from genres;

--Creating "movie_genres" Table--

create table movie_genres(
mov_id integer, foreign key(mov_id) references movie(mov_id),
gen_id integer,foreign key(gen_id) references genres(gen_id)
);

--Inserting Values in the "genres" Table--

insert into movie_genres (mov_id, gen_id) values (1001,10001);
insert into movie_genres (mov_id, gen_id) values (1004,10002);
insert into movie_genres (mov_id, gen_id) values (1003,10005);
insert into movie_genres (mov_id, gen_id) values (1002,10003);
insert into movie_genres (mov_id, gen_id) values (1002,10004);
insert into movie_genres (mov_id, gen_id) values (1001,10005);
insert into movie_genres (mov_id, gen_id) values (1003,10004);
insert into movie_genres (mov_id, gen_id) values (1004,10002);
insert into movie_genres (mov_id, gen_id) values (1005,10001);
insert into movie_genres (mov_id, gen_id) values (1005,10003);

--Looking at the "movie_genres" Table--

Select * from movie_genres;


