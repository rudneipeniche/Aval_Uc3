clienteCREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11)NOT NULL UNIQUE,
celular CHAR(11)NOT NULL,
email VARCHAR(50)NOT NULL,
cidade VARCHAR (50)NOT NULL,
estado CHAR(2)NOT NULL,
cep CHAR(8),
tipoLogradouro VARCHAR(15)NOT NULL,
nomeLogradouro VARCHAR (50)NOT NULL,
numero VARCHAR(6)NOT NULL,
complemento VARCHAR(30)
);

CREATE TABLE contatoTelefonico(
idContatoTelefonico INT,
ddi VARCHAR (5) NOT NULL, 
ddd VARCHAR (5) NOT NULL,
numero VARCHAR (9) NOT NULL, 
idCLiente INT NOT NULL,
CONSTRAINT fk_contatoTelefonico_cliente FOREIGN KEY (idCliente)
REFERENCES cliente(idCliente)
);

CREATE TABLE animal(
idAnimal INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL,
nomeAnimal VARCHAR (50) NOT null,
especie VARCHAR (50) NOT null,
raca VARCHAR (50) NOT NULL, 
peso DECIMAL (5,2),
porte  CHAR (1),
sexo CHAR(1),
anoNascimento INT NOT NULL,
CONSTRAINT chk_porte CHECK (porte IN ( 'P', 'M', 'G')),
CONSTRAINT chk_sexo CHECK (sexo IN ('M', 'F')),
CONSTRAINT FK_animal_Cliente FOREIGN KEY (idCliente)
REFERENCES cliente(idCliente)
);

CREATE TABLE Veterinario (
idVeterinario INT PRIMARY KEY AUTO_INCREMENT,
nomeVeterinario VARCHAR (50),
crmv VARCHAR (20) NOT NULL unique, 
celular CHAR (11) NOT NULL,
especialidade VARCHAR (50)
);

CREATE TABLE consulta (
idconsulta int PRIMARY KEY AUTO_INCREMENT,
idanimal INT NOT NULL,
idveterinario INT NOT NULL,
datahora DATETIME NOT NULL,
pago BIT DEFAULT 0,
formapagamento VARCHAR (50) NOT NULL, 
qtdvezes TINYINT DEFAULT 1,
valorTotal DECIMAL (10,2) NOT NULL,
valorpago DECIMAL (10,2),
CONSTRAINT fk_consulta_animal FOREIGN KEY(idAnimal)
REFERENCES animal(idAnimal),
CONSTRAINT fk_consulta_veterinario FOREIGN KEY(idveterinario)
REFERENCES veterinario(idVeterinario)
);


CREATE TABLE tiposervico (
idtiposervico INT PRIMARY KEY AUTO_INCREMENT,
nomeservico VARCHAR (50) NOT null,
valor DECIMAL (10,2) NOT NULL
);

CREATE TABLE consultatiposervico (
idconsultatiposervico INT PRIMARY KEY AUTO_INCREMENT,
idconsulta INT NOT NULL,
idtiposervico INT NOT NULL,
valorservico DECIMAL (10,2) NOT NULL,
CONSTRAINT fk_consultatiposervico_consulta FOREIGN KEY (idconsulta)  
REFERENCES consulta(idconsulta),
CONSTRAINT fk_consultatiposervico_tiposervico FOREIGN KEY (idtiposervico)
REFERENCES tiposervico(idtiposervico)
);


clinivavet
SHOW TABLES 