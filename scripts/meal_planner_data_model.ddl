create database meal_planner;
use meal_planner;

create table meal_base (
meal_base_id int not null auto_increment primary key,
meal_base_name varchar(24) not null
);

create table meal_type (
meal_type_id int not null auto_increment primary key,
meal_type_name varchar(24) not null
);

create table side_type (
side_type_id int not null auto_increment primary key,
side_type_name varchar(24) not null
);

create table side (
side_id int not null auto_increment primary key,
side_name varchar(24) not null
);

create table side_dish (
side_dish_id int not null auto_increment primary key,
side_id int not null,
index side_id_ind (side_id),
foreign key (side_id) references side(side_id),
side_type_id int not null,
index side_type_id_ind (side_type_id),
foreign key (side_type_id) references side_type(side_type_id),
is_cooked tinyint not null
);

create table meal (
meal_id int not null auto_increment primary key,
meal_name varchar(50) not null
);

create table meal_dish (
meal_dish_id int not null auto_increment primary key,
meal_id int not null,
index meal_id_ind (meal_id),
foreign key (meal_id) references meal(meal_id),
meal_type_id int not null,
index meal_type_id_ind (meal_type_id),
foreign key (meal_type_id) references meal_type(meal_type_id),
meal_base_id int not null,
index meal_base_id_ind (meal_base_id),
foreign key (meal_base_id) references meal_base(meal_base_id),
is_school_lunch tinyint not null
);

create table meal_dish_has_side_dish (
meal_dish_id int not null,
index meal_dish_id_ind (meal_dish_id),
foreign key (meal_dish_id) references meal_dish(meal_dish_id),
side_dish_id int not null,
index side_dish_id_ind (side_dish_id),
foreign key (side_dish_id) references side_dish(side_dish_id)
);

create table ingredient (
ingredient_id int not null auto_increment primary key,
ingredient_name varchar(50) not null
);

create table meal_has_ingredient (
meal_id int not null,
index meal_id_ind (meal_id),
foreign key (meal_id) references meal(meal_id),
ingredient_id int not null,
index ingredient_id_ind (ingredient_id),
foreign key (ingredient_id) references ingredient(ingredient_id)
);

create table meal_day (
meal_day_id int not null auto_increment primary key,
meal_date date not null
);

create table meal_day_has_meal (
meal_day_id int not null,
index meal_day_id_ind (meal_day_id),
foreign key (meal_day_id) references meal_day(meal_day_id),
meal_dish_id int not null,
index meal_dish_id_ind (meal_dish_id),
foreign key (meal_dish_id) references meal_dish(meal_dish_id),
side_dish_id_1 int,
index side_dish_id_1_ind (side_dish_id_1),
foreign key (side_dish_id_1) references side_dish(side_dish_id),
side_dish_id_2 int,
index side_dish_id_2_ind (side_dish_id_2),
foreign key (side_dish_id_2) references side_dish(side_dish_id),
side_dish_id_3 int,
index side_dish_id_3_ind (side_dish_id_3),
foreign key (side_dish_id_3) references side_dish(side_dish_id)
);

create table note (
note_id int not null auto_increment primary key,
note_text varchar(150) not null
);

create table meal_day_has_note (
meal_day_id int not null,
index meal_day_id_ind (meal_day_id),
foreign key (meal_day_id) references meal_day(meal_day_id),
note_id int not null,
index note_id_ind (note_id),
foreign key (note_id) references note(note_id)
);