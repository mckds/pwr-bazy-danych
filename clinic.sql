-- drop tables
DROP TABLE account_types 		CASCADE CONSTRAINTS;
DROP TABLE specialities 		CASCADE CONSTRAINTS;
drop table accounts 			CASCADE CONSTRAINTS;
drop table personal_details 		CASCADE CONSTRAINTS;
drop table doctors 			CASCADE CONSTRAINTS;
drop table patients 			CASCADE CONSTRAINTS;
drop TABLE schedules 			CASCADE CONSTRAINTS;
drop TABLE visits 			CASCADE CONSTRAINTS;
drop table doctor_specialities		CASCADE CONSTRAINTS;

DROP SEQUENCE account_types_id_seq;
DROP SEQUENCE speciality_id_seq;
DROP SEQUENCE personal_details_id_seq;
DROP SEQUENCE accounts_id_seq;
DROP SEQUENCE doctors_id_seq;
DROP SEQUENCE patients_id_seq;
DROP SEQUENCE schedules_id_seq;
DROP SEQUENCE visits_id_seq;

-- create tables
create table account_types (
	account_type_id 	INTEGER 	PRIMARY KEY,
	type			VARCHAR(32)	UNIQUE NOT NULL
);

CREATE SEQUENCE account_types_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_account_types_id 
BEFORE INSERT ON account_types 
FOR EACH ROW
BEGIN
  SELECT account_types_id_seq.NEXTVAL
  INTO   :new.account_type_id
  FROM   dual;
END;


create table specialities (
	speciality_id		INTEGER 	PRIMARY KEY,
	name			VARCHAR(64)	UNIQUE NOT NULL
);
CREATE SEQUENCE speciality_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_speciality_id 
BEFORE INSERT ON specialities 
FOR EACH ROW
BEGIN
  SELECT speciality_id_seq.NEXTVAL
  INTO   :new.speciality_id
  FROM   dual;
END;


create table personal_details (
	personal_details_id	INTEGER		PRIMARY KEY,
	first_name			VARCHAR(64)	NOT NULL,
	last_name			VARCHAR(64)	NOT NULL,
	birth_date			DATE		NOT NULL,
	national_number		VARCHAR(11)	NOT NULL
);
CREATE SEQUENCE personal_details_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_personal_details_id 
BEFORE INSERT ON personal_details 
FOR EACH ROW
BEGIN
  SELECT personal_details_id_seq.NEXTVAL
  INTO   :new.personal_details_id
  FROM   dual;
END;

create table accounts (
	account_id			INTEGER 	PRIMARY KEY,
	email				VARCHAR(64)	UNIQUE NOT NULL,
	password			VARCHAR(64)	NOT NULL,
	account_type		INTEGER		NOT NULL,
	personal_details	INTEGER		NOT NULL,
	FOREIGN KEY (account_type) 		REFERENCES account_types(account_type_id),
	FOREIGN KEY (personal_details) 	REFERENCES personal_details(personal_details_id)
);
CREATE SEQUENCE accounts_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_accounts_id 
BEFORE INSERT ON accounts 
FOR EACH ROW
BEGIN
  SELECT accounts_id_seq.NEXTVAL
  INTO   :new.account_id
  FROM   dual;
END;


create table doctors (
	doctor_id			INTEGER		PRIMARY KEY,
	account				INTEGER		UNIQUE NOT NULL,
	FOREIGN KEY (account) 			REFERENCES accounts(account_id)
);
CREATE SEQUENCE doctors_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_doctors_id 
BEFORE INSERT ON doctors 
FOR EACH ROW
BEGIN
  SELECT doctors_id_seq.NEXTVAL
  INTO   :new.doctor_id
  FROM   dual;
END;


create table doctor_specialities (
	doctor_id			INTEGER		NOT NULL,
	speciality_id		INTEGER		NOT NULL,
	FOREIGN KEY (doctor_id) 		REFERENCES doctors(doctor_id),
	FOREIGN KEY (speciality_id) 	REFERENCES specialities(speciality_id),
	UNIQUE	(doctor_id, speciality_id)
);

create table patients ( 
	patient_id			INTEGER		PRIMARY KEY,
	account				INTEGER		UNIQUE NOT NULL,
	FOREIGN KEY (account)			REFERENCES accounts(account_id)
);
CREATE SEQUENCE patients_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_patients_id 
BEFORE INSERT ON patients 
FOR EACH ROW
BEGIN
  SELECT patients_id_seq.NEXTVAL
  INTO   :new.patient_id
  FROM   dual;
END;

create table schedules ( 
	schedule_id			INTEGER		PRIMARY KEY,
	start_date			TIMESTAMP	NOT NULL,
	end_date			TIMESTAMP	NOT NULL,
	doctor				INTEGER		NOT NULL,
	FOREIGN KEY (doctor) 			REFERENCES doctors(doctor_id)
);
CREATE SEQUENCE schedules_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_schedules_id 
BEFORE INSERT ON schedules 
FOR EACH ROW
BEGIN
  SELECT schedules_id_seq.NEXTVAL
  INTO   :new.schedule_id
  FROM   dual;
END;

create table visits ( 
	visit_id			INTEGER		PRIMARY KEY,
	start_date			TIMESTAMP	NOT NULL,
	end_date			TIMESTAMP	NOT NULL,
	schedule			INTEGER		NOT NULL,
	patient				INTEGER		NOT NULL,
	reason				VARCHAR(200)NOT NULL,
	FOREIGN KEY (schedule) 			REFERENCES schedules(schedule_id),
	FOREIGN KEY (patient) 			REFERENCES patients(patient_id)
);
CREATE SEQUENCE visits_id_seq START WITH 1;
CREATE OR REPLACE TRIGGER trg_visits_id 
BEFORE INSERT ON visits 
FOR EACH ROW
BEGIN
  SELECT visits_id_seq.NEXTVAL
  INTO   :new.visit_id;
  FROM   dual;
END;
-- insert data


INSERT INTO account_types (type) VALUES ('ADMIN');
INSERT INTO account_types (type) VALUES ('DOCTOR');
INSERT INTO account_types (type) VALUES ('PATIENT');

INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ('2018-11-01 08:00:00', '2018-11-01 08:30:00', 1, 1, 'Diagnoza');
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ('2018-11-02 08:00:00', '2018-11-02 08:30:00', 1, 2, 'Konsultacje');
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ('2018-11-03 08:00:00', '2018-11-03 08:30:00', 1, 2, 'Przepisanie recepty');

INSERT INTO specialities (name) VALUES ('alergologia');
INSERT INTO specialities (name) VALUES ('anestezjologia');
INSERT INTO specialities (name) VALUES ('angiochirurgia');
INSERT INTO specialities (name) VALUES ('balneologia');
INSERT INTO specialities (name) VALUES ('bariatria');
INSERT INTO specialities (name) VALUES ('chirurgia');
INSERT INTO specialities (name) VALUES ('dermatologia');
INSERT INTO specialities (name) VALUES ('epidemiologia');
INSERT INTO specialities (name) VALUES ('gastroenterologia');
INSERT INTO specialities (name) VALUES ('geriatria');
INSERT INTO specialities (name) VALUES ('ginekologia');
INSERT INTO specialities (name) VALUES ('immunologia');
INSERT INTO specialities (name) VALUES ('kariologia');
INSERT INTO specialities (name) VALUES ('nefrologia');
INSERT INTO specialities (name) VALUES ('neurologia');
INSERT INTO specialities (name) VALUES ('okulistyka');
INSERT INTO specialities (name) VALUES ('onkologia');
INSERT INTO specialities (name) VALUES ('ortopedia');
INSERT INTO specialities (name) VALUES ('ortolaryngologia');
INSERT INTO specialities (name) VALUES ('patologia');
INSERT INTO specialities (name) VALUES ('pediatria');
INSERT INTO specialities (name) VALUES ('psychiatria');
INSERT INTO specialities (name) VALUES ('pulmonologia');
INSERT INTO specialities (name) VALUES ('radiologia');
INSERT INTO specialities (name) VALUES ('reumatologia');
INSERT INTO specialities (name) VALUES ('rehabilitacja');
INSERT INTO specialities (name) VALUES ('telerehabilitacja');
INSERT INTO specialities (name) VALUES ('toksykologia');
INSERT INTO specialities (name) VALUES ('transfuzjologia');
INSERT INTO specialities (name) VALUES ('urologia');
INSERT INTO specialities (name) VALUES ('wenerologia');


INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ('Lucjan', 'Maciejewski', TO_DATE('1971-05-06', 'YYYY-MM-DD'), '71050678372');
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ('Walerian', 'Król', TO_DATE('1985-06-14', 'YYYY-MM-DD'), '85061456230');
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ('Marik', 'Gorski', TO_DATE('1973-07-21', 'YYYY-MM-DD'), '73072162815');
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ('Wiga', 'Piotrowska', TO_DATE('1971-01-23', 'YYYY-MM-DD'), '71012330887');
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ('Kazia', 'Borowska', TO_DATE('1990-04-23', 'YYYY-MM-DD'), '90042394067');
INSERT INTO personal_details (first_name, last_name, birth_date, national_number) VALUES ('Maryla', 'Zawadzka', TO_DATE('1937-01-12', 'YYYY-MM-DD'), '37011242189');


INSERT INTO accounts (email, password, account_type, personal_details) VALUES ('lucjan.maciejewski@example.com', 'password', 1, 1);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ('walerian.krol@example.com', 'password', 2, 2);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ('marik.gorski@example.com', 'password', 2, 3);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ('wiga.piotrowska@example.com', 'password', 3, 4);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ('kazia.borowska@example.com', 'password', 3, 5);
INSERT INTO accounts (email, password, account_type, personal_details) VALUES ('maryla.zawadzka@example.com', 'password', 3, 6);


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


INSERT INTO schedules (start_date, end_date, doctor) VALUES ('2018-11-01 08:00:00', '2018-11-01 16:00:00', 1);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ('2018-11-02 08:00:00', '2018-11-02 16:00:00', 1);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ('2018-11-03 08:00:00', '2018-11-03 16:00:00', 1);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ('2018-11-01 08:00:00', '2018-11-01 16:00:00', 2);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ('2018-11-02 08:00:00', '2018-11-02 16:00:00', 2);
INSERT INTO schedules (start_date, end_date, doctor) VALUES ('2018-11-03 08:00:00', '2018-11-03 16:00:00', 2);


INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ('2018-11-01 10:00:00', '2018-11-01 10:30:00', 2, 2, 'Diagnoza');
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ('2018-11-02 10:00:00', '2018-11-02 10:30:00', 2, 3, 'Konsultacje');
INSERT INTO visits (start_date, end_date, schedule, patient, reason) VALUES ('2018-11-02 10:00:00', '2018-11-02 10:30:00', 2, 3, 'Przepisanie recepty');
