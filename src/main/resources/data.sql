INSERT INTO ACCOUNT_TYPE(ACCOUNT_TYPE_ID, `TYPE`) VALUES
(101, 'ROLE_PATIENT'),
(102, 'ROLE_DOCTOR'),
(103, 'ROLE_OFFICE_EMPLOYEE');

INSERT INTO ACCOUNT(ID, EMAIL, PASSWORD, ACCOUNT_TYPE_ID) VALUES
(201, 'patient@example.com', '$2a$10$AJYSrLQXnn4Ls2aJ4nAHIeEUdd5maRtZDd36kHri2bgQpCVa5gsuu', 101),
(202, 'doctor@example.com', '$2a$10$AJYSrLQXnn4Ls2aJ4nAHIeEUdd5maRtZDd36kHri2bgQpCVa5gsuu', 102),
(203, 'officet@example.com', '$2a$10$AJYSrLQXnn4Ls2aJ4nAHIeEUdd5maRtZDd36kHri2bgQpCVa5gsuu', 103);


INSERT INTO DOCTOR(ID, NPWZ, ACCOUNT_ID) VALUES
(301, 1234567, 202);

INSERT INTO SPECIALITY(ID, SPECIALITY) VALUES
(401, 'Alergologia'),
(402, 'Anestezjologia'),
(403, 'Chirurgia');

INSERT INTO DOCTOR_SPECIALITY(DOCTOR_ID, SPECIALITY_ID) VALUES
(301, 401),
(301, 402),
(301, 403);

INSERT INTO OFFICE_EMPLOYEE(ID, ACCOUNT_ID) VALUES
(501, 203);

INSERT INTO PATIENT(ID, ACCOUNT_ID) VALUES
(601, 201);

INSERT INTO PERSONAL_DETAILS(PERSONAL_DETAILS_ID, BIRTH_DATE, FIRST_NAME, LAST_NAME, NATIONAL_NUMBER, CLINIC_USER_ID) VALUES
(701, '1996-02-22', 'Maciej', 'Dados', '96022213157', 201),
(702, '1980-01-13', 'Jan', 'Kowalski', '96022213157', 202),
(703, '1973-03-05', 'Maciej', 'Dados', '96022213157', 203);