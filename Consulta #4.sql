clinivavetCREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11)NOT NULL UNIQUE
);

CREATE TABLE aluguel (
idAluguel INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL,
idFuncionario INT NOT NULL,
dataHoraRetirada DATETIME NOT NULL,
dataHoraDevolucao DATETIME,
valorAPagar DECIMAL(10,2),
valorPago DECIMAL(10,2),
pago BIT,
formaPagamento VARCHAR(50),
qtVezes INT DEFAULT 1,
CONSTRAINT fk_aluguel_cliente 
FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
CONSTRAINT fk_aluguel_funcionario 
FOREIGN KEY (idFuncionario) REFERENCES funcionario(idFuncionario)
);


CREATE TABLE funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nomeFuncionario VARCHAR (50) NOT null,
cpf CHAR (11) NOT NULL UNIQUE,
celular CHAR (11) NOT NULL
);

CREATE TABLE equipamento (
idequipamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEquipamento VARCHAR (50) NOT NULL unique,
qtd INT NOT NULL,
valorHora DECIMAL NOT null (5,2) 
);