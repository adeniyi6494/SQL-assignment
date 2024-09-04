CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE patients (
patients_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
date_of_birth DATE NOT NULL,
gender VARCHAR (50) NOT NULL,
language VARCHAR (50) NOT NULL
);
CREATE TABLE providers (
providers_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL, 
providers_speciality VARCHAR (255) NOT NULL,
email_address VARCHAR (255),
phone_number VARCHAR (100),
date_join DATE NOT NULL
 ); 
 CREATE TABLE visits (
 visits_id INT PRIMARY KEY AUTO_INCREMENT,
 patients_id INT,
 providers_id INT,
date_of_visits DATE NOT NULL,
date_scheduled_id DATE NOT NULL,
visits_department_id INT NOT NULL,
visits_type VARCHAR (50) NOT NULL,
blood_pressure_systolic INT,
blood_pressure_diastollic DECIMAL,
pulse DECIMAL,
visits_status VARCHAR (300) NOT NULL,
FOREIGN KEY (patients_id) REFERENCES patients(patients_id),
FOREIGN KEY (providers_id) REFERENCES providers(providers_id)
);
CREATE TABLE ed_visits (
visits_id INT PRIMARY KEY AUTO_INCREMENT,
patients_id INT,
acuity INT NOT NULL,
reason_for_visit VARCHAR (300) NOT NULL, 
disposition VARCHAR (300) NOT NULL,
FOREIGN KEY (visits_id) REFERENCES visits(visits_id), 
FOREIGN KEY (patients_id) REFERENCES patients(patients_id)
);
CREATE TABLE admissions (
 admissions_id INT PRIMARY KEY AUTO_INCREMENT,
patients_id INT,
admissions_date DATE NOT NULL,
discharge_date DATE NOT NULL,
discharge_disposition VARCHAR (300),
service VARCHAR (300) NOT NULL,
primary_diagnosis VARCHAR (300) NOT NULL,
FOREIGN KEY (patients_id) REFERENCES patients(patients_id)
 );
CREATE TABLE discharge (
discharge_id INT PRIMARY KEY AUTO_INCREMENT,
admissions_id INT,
discharge_date DATE NOT NULL,
discharge_disposition VARCHAR (200) NOT NULL,
FOREIGN KEY (admissions_id) REFERENCES admissions(admissions_id)
);
