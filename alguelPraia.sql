/*1) Utilizando o comando ALTER TABLE, adicionar à tabela cliente já criada os seguintes atributos: 
email, cidade, estado, endereço (lembre-se que trata-se de atributo composto*/

ALTER TABLE cliente 
add email VARCHAR(100) NOT null,
add cidade VARCHAR(50) NOT null,
add estado CHAR(2) NOT null,
add endereco VARCHAR(100)NOT null,
add cep CHAR(8)NOT null,
add tipoLogradouro VARCHAR(15)NOT NULL,
add nomeLogradouro VARCHAR (50)NOT NULL,
add numero VARCHAR(6)NOT NULL,
add complemento VARCHAR(30);

/*2) Apagar da Tabela Aluguel o atributo idEquipamento, 
pois criaremos uma outra tabela para conter tal atributo. 
Use o comando para dropar colunas para fazer isso*/

ALTER TABLE aluguel
DROP FOREIGN KEY fk_aluguel_equipamento;

ALTER TABLE aluguel
DROP COLUMN idEquipamento;


/*Criar a tabela associativa AluguelEquipamento com os seguintes atributos:
 
idAluguemEquipamento PK
idAluguel FK
idEquipamento FK
valorUnitario 
valorItem
quantidade*/

CREATE TABLE AluguelEquipamento (
idAluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idAluguel INT NOT NULL,
idEquipamento INT NOT NULL,
valorUnitario DECIMAL(10,2) NOT null,
valorItem DECIMAL(10,2) NOT null,
qtd INT DEFAULT 1,
CONSTRAINT fk_aluguelEquipamento_aluguel 
FOREIGN KEY (idAluguel) REFERENCES aluguel(idAluguel),
CONSTRAINT fk_aluguelEquipamento_equipamento 
FOREIGN KEY (idEquipamento) REFERENCES equipamento(idEquipamento)
);


/*Inserir 20 clientes segundo o seguinte critério*/

INSERT INTO cliente (nomeCliente, cpf, email, cidade, estado, endereco) VALUES
('Donald', '11111111111', 'donald@uol.com', 'Santos', 'SP', 'Casa'),
('Margarida', '22222222222', 'margarida@uol.com', 'São Vicente', 'SP', NULL),
('Patinhas', '33333333333', 'patinhas@uol.com', 'Florianópolis', 'SC', 'Casa'),
('Huguinho', '44444444444', 'huguinho@gmail.com', 'Santos', 'SP', NULL),
('Luizinho', '55555555555', 'luizinho@gmail.com', 'Praia Grande', 'SP', NULL),
('Zezinho', '66666666666', 'zezinho@gmail.com', 'São Vicente', 'SP', 'Casa'),
('Pardal', '77777777777', 'pardal@uol.com', 'Santos', 'SP', 'Casa'),
('Zé Carioca', '88888888888', NULL, 'Rio de Janeiro', 'RJ', 'Casa'),
('Mickey', '99999999999', 'mickey@hotmail.com', 'Recife', 'PE', NULL),
('Minie', '10101010101', 'minie@gmail.com', 'Recife', 'PE', NULL),
('Pateta', '12121212121', 'pateta@gmail.com', NULL, NULL, NULL),
('Branca de Neve', '13131313131', 'branca@hotmail.com', 'São Joaquim', 'SC', NULL),
('Aladin', '14141414141', 'aladin@gmail.com', 'Belém', 'PA', NULL),
('Cinderela', '15151515151', 'cinderela@hotmail.com', 'Goiânia', 'GO', 'Casa'),
('Mulan', '16161616161', 'mulan@gmail.com', 'Rio das Ostras', 'RJ', NULL),
('Moana', '17171717171', 'moana@gmail.com', 'Parati', 'RJ', NULL),
('Asnésio', '18181818181', 'asnesio@uol.com', 'Belo Horizonte', 'MG', NULL),
('Maga Patalógica', '19191919191', 'maga@gmail.com', 'Cubatão', 'SP', NULL),
('Capitão Boeing', '20202020202', 'boeing@uol.com', 'Manaus', 'AM', 'Casa'),
('Pão Duro Mac Money', '21212121212', 'paoduro@ig.com', 'Osasco', 'SP', NULL);

/*Inserir 03 funcionários com dados aleatórios, mas com os seguintes nomes:
Cebolinha,
Cascão, 
Chico Bento*/

INSERT INTO funcionario (nomeFuncionario, cpf, celular) VALUES
('Cebolinha', '31313131313', '13999990000'),
('Cascão', '32323232323', '13999990001'),
('Chico Bento', '33333333333', '13999990002');

/*)Inserir os seguintes equipamentos:
 
Cadeira 02 posições - 50 unidades - R$2,00
Cadeira 04 posições - 100 unidades - R$3,50
Guarda Sol P - 40 unidades - R$2,00
Guarda Sol G - 60 unidades - R$3,00
Mesinha - 30 unidades - R$1,50*/

INSERT INTO equipamento (nomeEquipamento, qtd, valorHora) VALUES
('Cadeira 02 posições', 50, 2.00),
('Cadeira 04 posições', 100, 3.50),
('Guarda Sol P', 40, 2.00),
('Guarda Sol G', 60, 3.00),
('Mesinha', 30, 1.50);


/*6)Inserir o aluguel de 1 cadeiras 2 posições para o Pateta feita pelo Cebolinha, em 08/12/24.
 Fazer o update da quantidade retirando uma do estoque.*/

INSERT INTO Aluguel(idCliente,idFuncionario,dataHoraRetirada,dataHoraDevolucao,valorAPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES (11, 1, '2024-12-08', NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO AluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUE (1, 2, 2.00, 2.00, 1);

UPDATE equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 1
SELECT*FROM equipamento


/*7)Inserir o aluguel de 2 cadeiras 4 posições e um guarda sol G para o Mickey feita pelo Chico Bento, em dez 10/12/24.
Fazer o update da quantidade retirando do estoque.*/
SELECT idEquipamento, nomeEquipamento, valorHora FROM equipamento
WHERE nomeEquipamento IN ('Cadeira 04 posições','Guarda Sol G')
 
INSERT INTO Aluguel(idCliente,idFuncionario,dataHoraRetirada,dataHoraDevolucao,valorAPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES (9, 3, '2024-12-10', NULL, 10.00, NULL, NULL, NULL, NULL);

SELECT idAluguel FROM aluguel 
WHERE idCliente = 9

INSERT INTO AluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUE (2, 3, 3.50, 3.50, 2),
		(4, 3, 3.00, 3.00, 1);

UPDATE equipamento
SET qtd = qtd - 2
WHERE idEquipamento = 2

UPDATE equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 4

SELECT*FROM Equipamento

/*8)Inserir o aluguel de 1 guarda sol P para 3 pessoas quaisquer feita pelo Cebolinha, em 27/12/24.
Fazer o update da quantidade retirando do estoque.*/

SELECT nomeCliente, idCliente FROM cliente

SELECT*FROM Equipamento
WHERE nomeEquipamento = 'Guarda sol P' 

INSERT INTO Aluguel(idCliente,idFuncionario,dataHoraRetirada,dataHoraDevolucao,valorAPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES (8, 1, '2024-12-27 12:00:00', NULL, 2.00, NULL, NULL, NULL, NULL),
		(12, 1, '2024-12-27 02:50:00', NULL, 2.00, NULL, NULL, NULL, NULL),
		(17, 1, '2024-12-27 10:30:00', '2024-12-27 12:00:00', 2.00, NULL, NULL, NULL, NULL);

INSERT INTO AluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUE (3, 4, 2.00, 2.00, 1),
		(3, 5, 2.00, 2.00, 1),
		(3, 6, 2.00, 2.00, 1);
		
UPDATE equipamento
SET qtd = qtd - 3
WHERE idEquipamento = 3

/*9)Inserir o aluguel de 2 cadeiras 4 posições e um guarda sol G para 6 pessoas aleatórias feitas pelo Chico Bento,
 em dez 28/12/24. Fazer o update da quantidade retirando do estoque.*/
SELECT idEquipamento, nomeEquipamento, valorHora FROM equipamento
WHERE nomeEquipamento IN ('Cadeira 04 posições','Guarda Sol G')

SELECT nomeFuncionario, idFuncionario FROM Funcionario 
WHERE nomeFuncionario = 'Chico Bento'

INSERT INTO Aluguel(idCliente,idFuncionario,dataHoraRetirada,dataHoraDevolucao,valorAPagar,valorPago,pago,formaPagamento,qtVezes)
VALUES (20, 3, '2024-12-28 12:00:00', NULL, 10.00, NULL, NULL, 'Crédito', 1),
 		 (1, 3, '2024-12-28 09:00:00', NULL, 10.00, NULL, NULL, NULL, NULL),
		 (9, 3, '2024-12-28 11:20:00', NULL, 10.00, NULL, NULL, NULL, NULL),
		 (18, 3, '2024-12-28 6:30:10', NULL, 10.00, NULL, NULL, 'Dinheiro', NULL),
		 (10, 3, '2024-12-28 11:32:05', NULL, 10.00, NULL, NULL, NULL, NULL),
		 (6, 3, '2024-12-28 08:24:00', NULL, 10.00, NULL, NULL, 'Debito', NULL);
SELECT*FROM Aluguel
INSERT INTO AluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUE (2, 7, 3.50, 3.50, 2),
		(4, 7, 3.00, 3.00, 1),
		(2, 8, 3.50, 3.50, 2),
		(4, 8, 3.00, 3.00, 1),
		(2, 9, 3.50, 3.50, 2),
		(4, 9, 3.00, 3.00, 1),
		(2, 10, 3.50, 3.50, 2),
		(4, 10, 3.00, 3.00, 1),
		(2, 11, 3.50, 3.50, 2),
		(4, 11, 3.00, 3.00, 1),
		(2, 12, 3.50, 3.50, 2),
		(4, 12, 3.00, 3.00, 1);

UPDATE equipamento
SET qtd = qtd - 12
WHERE idEquipamento = 2

UPDATE equipamento
SET qtd = qtd - 6
WHERE idEquipamento = 4

SELECT*FROM Equipamento

/*10)Listar o nome e os contatos de todos os clientes da barraca em ordem alfabética.*/
SELECT nomeCliente, email FROM cliente
ORDER by nomeCliente 
 
/*11)Listar o nome e o contato telefônico de todos os funcionários da barraca em ordem alfabética.*/
SELECT nomeFuncionario, celular FROM Funcionario
ORDER by nomeFuncionario
 
/*12)Listar todos os dados dos aluguéis realizados em ordem de data da mais antiga para a mais nova.*/
SELECT*FROM aluguel
ORDER BY dataHoraRetirada

/*13)Listar nome, cidade e estado de todos os clientes da baixada santista em ordem alfabética por nome.*/
SELECT nomeCliente, cidade, estado FROM cliente 
WHERE cidade IN ('Santos', 'São Vicente', 'Praia Grande','Cubatão', 'Guarujá', 'Bertioga', 'Mongaguá', 'Itanhaém', 'Peruíbe')
ORDER BY nomeCliente 

/*14)Listar todos os produtos e a quantidade de estoque do produto que tem mais itens para o que tem menos.*/
SELECT nomeEquipamento, qtd FROM equipamento 
ORDER BY qtd DESC

/*15)Listar o nome, a cidade e o estado de todos os clientes que moram em casa em ordem alfabética.*/
SELECT nomeCliente, cidade, estado FROM cliente 
WHERE endereco = 'casa'
ORDER BY nomeCliente 

/*16)Listar o nome de todos os clientes e o estado daqueles que não vivem no estado de SP.*/
SELECT nomeCliente, cidade, estado FROM cliente 
WHERE estado <> 'SP'
clinicavet
/*17)Listar o nome de todos os clientes que começam com a letra A.*/
SELECT nomeCliente FROM cliente 
WHERE nomeCliente LIKE 'A%'

/*18)Listar todos os dados dos clientes que começam com a letra M e vivam no estado de PE.*/
SELECT * FROM cliente 
WHERE nomeCliente LIKE 'M%' AND estado = 'PE'

/*19)Listar apenas as cadeiras e a quantidade que possui em estoque em ordem de quantidade,
 da que mais possui itens para a que menos possui.*/
SELECT nomeEquipamento, qtd FROM equipamento 
WHERE nomeEquipamento LIKE 'Cadeira%'
ORDER BY qtd DESC

/*20)Listar todos os dados dos alugueis que ocorreram entre 25/12 e 31/12 de 2024 em ordem de data da mais antiga para a mais nova. */	
SELECT*FROM aluguel
WHERE dataHoraRetirada BETWEEN '2024-12-25' AND '2024-12-31'
ORDER BY dataHoraRetirada
