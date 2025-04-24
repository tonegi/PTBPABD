--Questão 01.
CREATE SCHEMA avaliacaocontinua;

--Questão 02.
CREATE TABLE avaliacaocontinua.company (
    company_name VARCHAR(255) NOT NULL PRIMARY KEY,
    city VARCHAR(255)
);

--Questão 03.
CREATE TABLE avaliacaocontinua.employee (
    person_name VARCHAR(255) NOT NULL PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(255)
);

--Questão 04.
CREATE TABLE avaliacaocontinua.manages (
    person_name VARCHAR(255) NOT NULL PRIMARY KEY,
    manager_name VARCHAR(255)
);

--Questão 05.
CREATE TABLE avaliacaocontinua.works (
    person_name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10,2),
    PRIMARY KEY (person_name)
);

--Questão 06.
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_employee
FOREIGN KEY (person_name)
REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

--Questão 07.
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_company
FOREIGN KEY (company_name)
REFERENCES avaliacaocontinua.company(company_name)
ON UPDATE CASCADE
ON DELETE CASCADE;


--Questão 08.
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT fk_manages_employee
FOREIGN KEY (person_name)
REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;
