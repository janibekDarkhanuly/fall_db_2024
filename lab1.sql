Create table users(
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);

Alter table users add isadmin integer;

alter table users alter column isadmin type boolean using isadmin::boolean;
alter table users alter column isadmin set default false;

Select * from users;

alter table users add primary key(id);

create table tasks(
    id serial,
    name varchar(50),
    user_id integer
);

drop table tasks;