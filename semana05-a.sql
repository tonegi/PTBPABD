-- Questão 01.
CREATE TABLE person (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    age INT CHECK (age >= 0)
);

-- Questão 02.
ALTER TABLE person
ADD CONSTRAINT unique_id_name_surname UNIQUE (ID, name, surname);

-- Questão 03.
ALTER TABLE person
ALTER COLUMN age INT NOT NULL;

-- Questão 04.
CREATE TABLE address (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    street VARCHAR(255) NOT NULL
)

ALTER TABLE person
ADD address_id INT

ALTER TABLE person
ADD CONSTRAINT fk_address
FOREIGN KEY (address_id) REFERENCES address(ID)
