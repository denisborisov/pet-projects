/*

Данная база данных спроектирована для проекта по созданию личного плана развития и оценки своего прогресса.

*/







drop database if exists skillmatrix;
create database if not exists skillmatrix;


use skillmatrix;


-- $
drop table if exists levels;
create table if not exists levels (
	id serial,
	sequential_order smallint unsigned not null unique,
	title varchar(20) not null unique,
	next_level_storypoints smallint unsigned not null
) comment 'Policies related to levels';


drop table if exists backlogs;
create table if not exists backlogs (
	id serial,
	title varchar(50) not null,
	current_level_id bigint unsigned not null,	-- $
	storypoints_planned smallint unsigned,		-- $
	storypoints_done smallint unsigned,			-- $
	hierarchy_level tinyint unsigned not null,
	
	foreign key (current_level_id) references levels (id)
) comment 'Backlogs';


drop table if exists hierarchy;
create table if not exists hierarchy (
	backlog_id bigint unsigned not null,
	parent_id bigint unsigned,
	
	foreign key (backlog_id) references backlogs (id),
	foreign key (parent_id) references backlogs (id)
) comment 'Hierarchy';


