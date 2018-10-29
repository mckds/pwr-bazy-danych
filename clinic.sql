-- drop tables
drop table if EXISTS accounts;
drop table if EXISTS personal_details;
drop table if EXISTS account_types;
drop table if EXISTS doctors;
drop table if EXISTS patients;
drop table if EXISTS specialities;
drop table if EXISTS schedules;
drop table if EXISTS visits;
drop table if EXISTS doctor_specialities;

-- create tables
create table account_types (
	account_type_id 	INTEGER 	PRIMARY KEY AUTOINCREMENT,
	type				VARCHAR(32)	UNIQUE NOT NULL
);

create table specialities (
	speciality_id		INTEGER 	PRIMARY KEY AUTOINCREMENT,
	name				VARCHAR(64)	UNIQUE NOT NULL
);

create table personal_details (
	personal_details_id	INTEGER		PRIMARY KEY AUTOINCREMENT,
	first_name			VARCHAR(64)	NOT NULL,
	last_name			VARCHAR(64)	NOT NULL,
	birth_date			DATE		NOT NULL,
	national_number		VARCHAR(11)	NOT NULL
);


create table accounts (
	account_id			INTEGER 	PRIMARY KEY AUTOINCREMENT,
	email				VARCHAR(64)	UNIQUE NOT NULL,
	password			VARCHAR(64)	NOT NULL,
	account_type		INTEGER		NOT NULL,
	personal_details	INTEGER		NOT NULL,
	FOREIGN KEY (account_type) 		REFERENCES account_types(account_type_id),
	FOREIGN KEY (personal_details) 	REFERENCES personal_details(personal_details_id)
);

create table doctors (
	doctor_id			INTEGER		PRIMARY KEY AUTOINCREMENT,
	account				INTEGER		UNIQUE NOT NULL,
	FOREIGN KEY (account) 			REFERENCES accounts(account_id)
);

create table doctor_specialities (
	doctor_id			INTEGER		NOT NULL,
	speciality_id		INTEGER		NOT NULL,
	FOREIGN KEY (doctor_id) 		REFERENCES doctors(doctor_id),
	FOREIGN KEY (speciality_id) 	REFERENCES specialities(speciality_id),
	UNIQUE	(doctor_id, speciality_id)
);

create table patients ( 
	patient_id			INTEGER		PRIMARY KEY AUTOINCREMENT,
	account				INTEGER		UNIQUE NOT NULL,
	FOREIGN KEY (account)			REFERENCES accounts(account_id)
);

create table schedules ( 
	schedule_id			INTEGER		PRIMARY KEY AUTOINCREMENT,
	start_date			DATETIME	NOT NULL,
	end_date			DATETIME	NOT NULL,
	doctor				INTEGER		NOT NULL,
	FOREIGN KEY (doctor) 			REFERENCES doctors(doctor_id)
);

create table visits ( 
	visit_id			INTEGER		PRIMARY KEY AUTOINCREMENT,
	start_date			DATETIME	NOT NULL,
	end_date			DATETIME	NOT NULL,
	schedule			INTEGER		NOT NULL,
	patient				INTEGER		NOT NULL,
	reason				VARCHAR(200)NOT NULL,
	FOREIGN KEY (schedule) 			REFERENCES schedules(schedule_id),
	FOREIGN KEY (patient) 			REFERENCES patients(patient_id)
);

-- insert data
INSERT INTO account_types (type) VALUES ("ADMIN");
INSERT INTO account_types (type) VALUES ("DOCTOR");
INSERT INTO account_types (type) VALUES ("PATIENT");

INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ("2018-11-01 08:00:00", "2018-11-01 08:30:00", 1, 1, "Diagnoza");
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ("2018-11-02 08:00:00", "2018-11-02 08:30:00", 1, 2, "Konsultacje");
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ("2018-11-03 08:00:00", "2018-11-03 08:30:00", 1, 2, "Przepisanie recepty");

INSERT INTO specialities (name) VALUES ("alergologia");
INSERT INTO specialities (name) VALUES ("anestezjologia");
INSERT INTO specialities (name) VALUES ("angiochirurgia");
INSERT INTO specialities (name) VALUES ("balneologia");
INSERT INTO specialities (name) VALUES ("bariatria");
INSERT INTO specialities (name) VALUES ("chirurgia");
INSERT INTO specialities (name) VALUES ("dermatologia");
INSERT INTO specialities (name) VALUES ("epidemiologia");
INSERT INTO specialities (name) VALUES ("gastroenterologia");
INSERT INTO specialities (name) VALUES ("geriatria");
INSERT INTO specialities (name) VALUES ("ginekologia");
INSERT INTO specialities (name) VALUES ("immunologia");
INSERT INTO specialities (name) VALUES ("kariologia");
INSERT INTO specialities (name) VALUES ("nefrologia");
INSERT INTO specialities (name) VALUES ("neurologia");
INSERT INTO specialities (name) VALUES ("okulistyka");
INSERT INTO specialities (name) VALUES ("onkologia");
INSERT INTO specialities (name) VALUES ("ortopedia");
INSERT INTO specialities (name) VALUES ("ortolaryngologia");
INSERT INTO specialities (name) VALUES ("patologia");
INSERT INTO specialities (name) VALUES ("pediatria");
INSERT INTO specialities (name) VALUES ("psychiatria");
INSERT INTO specialities (name) VALUES ("pulmonologia");
INSERT INTO specialities (name) VALUES ("radiologia");
INSERT INTO specialities (name) VALUES ("reumatologia");
INSERT INTO specialities (name) VALUES ("rehabilitacja");
INSERT INTO specialities (name) VALUES ("telerehabilitacja");
INSERT INTO specialities (name) VALUES ("toksykologia");
INSERT INTO specialities (name) VALUES ("transfuzjologia");
INSERT INTO specialities (name) VALUES ("urologia");
INSERT INTO specialities (name) VALUES ("wenerologia");


INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ("Lucjan", "Maciejewski", "1971-05-06", "71050678372");
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ("Walerian", "Król", "1985-06-14", "85061456230");
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ("Marik", "Gorski", "1973-07-21", "73072162815");
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ("Wiga", "Piotrowska", "1971-01-23", "71012330887");
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ("Kazia", "Borowska", "1990-04-23", "90042394067");
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ("Maryla", "Zawadzka", "1937-01-12", "37011242189");


INSERT INTO accounts (email, password, account_type, personal_details) VALUES ("lucjan.maciejewski@example.com", "password", 1, 1);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ("walerian.krol@example.com", "password", 2, 2);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ("marik.gorski@example.com", "password", 2, 3);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ("wiga.piotrowska@example.com", "password", 3, 4);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ("kazia.borowska@example.com", "password", 3, 5);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ("maryla.zawadzka@example.com", "password", 3, 6);


INSERT INTO doctors (account) VALUES (2);
INSERT INTO doctors (account) VALUES (3);


INSERT INTO doctor_specialities (doctor_id, speciality_id) VALUES (1, 1);
INSERT INTO doctor_specialities (doctor_id, speciality_id) VALUES (1, 2);
INSERT INTO doctor_specialities (doctor_id, speciality_id) VALUES (1, 3);
INSERT INTO doctor_specialities (doctor_id, speciality_id) VALUES (2, 11);
INSERT INTO doctor_specialities (doctor_id, speciality_id) VALUES (2, 12);
INSERT INTO doctor_specialities (doctor_id, speciality_id) VALUES (2, 13);


INSERT INTO patients (account) VALUES (3);
INSERT INTO patients (account) VALUES (4);
INSERT INTO patients (account) VALUES (5);


INSERT INTO schedules (start_date, end_date, doctor) VALUES ("2018-11-01 08:00:00", "2018-11-01 16:00:00", 1);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ("2018-11-02 08:00:00", "2018-11-02 16:00:00", 1);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ("2018-11-03 08:00:00", "2018-11-03 16:00:00", 1);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ("2018-11-01 08:00:00", "2018-11-01 16:00:00", 2);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ("2018-11-02 08:00:00", "2018-11-02 16:00:00", 2);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ("2018-11-03 08:00:00", "2018-11-03 16:00:00", 2);


INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ("2018-11-01 10:00:00", "2018-11-01 10:30:00", 2, 2, "Diagnoza");
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ("2018-11-02 10:00:00", "2018-11-02 10:30:00", 2, 3, "Konsultacje");
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ("2018-11-02 10:00:00", "2018-11-02 10:30:00", 2, 3, "Przepisanie recepty");
