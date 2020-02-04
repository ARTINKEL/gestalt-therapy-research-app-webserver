drop database if exists GestaltUsers;
create database GestaltUsers;
use GestaltUsers;

drop table if exists Assignment;
create table Assignment(
	ID int not null auto_increment,
	Assign json,
    primary key(ID)
);

drop table if exists User;
create table User(
	ID smallint not null,
    Password text not null,
    Admin bool,
    AssignmentData int,
    primary key(ID),
    foreign key(AssignmentData) references Assignment(ID)
);

insert into User values(1, sha1("pass"), false, null);
insert into User values(2, sha1("pass"), true, null);
insert into Assignment(Assign) values('{"Assignment":{"Problem":"What?", "Answer":"Yes"}}'), ('["Problem", "Answer"]');

#select * from User;
#select * from Assignment;
#select json_extract(Assign, "$.Assignment") as Assignment, json_extract(Assign, "$.Assignment.Problem") as Problem, json_extract(Assign, "$.Assignment.Answer") as Answer from Assignment;
#select json_array("Problem", "Answer");
#select json_object("Problem", "Answer");
alter user 'root'@'localhost' identified with mysql_native_password by "garchomp";