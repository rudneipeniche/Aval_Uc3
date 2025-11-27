SELECT * FROM consulta
SELECT * FROM animal
SELECT * FROM cliente
SELECT * FROM veterinario
SELECT * FROM tiposervico
SELECT * FROM consultatiposervico

DELETE FROM cliente


INSERT INTO cliente (nomeCliente,cpf,celular, email, cidade, estado, 

cep, tipologradouro,nomelogradouro, numero, complemento) 

VALUES

('João da Silva' , '12345678900' , '11912345678' , 'joao.silva@email.com' , 'São Paulo' , 'SP' , '01001000' , 'Rua' , 'Augusta' , '123' , 'Apto 12'),

('Ana Pereira' , '98765432199' , '21998765432' , 'ana.pereira@email.com' , 'Rio de Janeiro' , 'RJ' , '22041001' , 'Avenida' , 'Atlântica' , '456' , 'Bloco B'),

('Carlos Souza' , '34567890122' , '31991234567' , 'carlos.souza@email.com' , 'Belo Horizonte' , 'MG' , '30130110' , 'Rua' , 'da Bahia' , '890' , 'Sala 3'),

('Mariana Oliveira' , '45678901233' , '41987654321' , 'mariana.oliveira@email.com' , 'Curitiba' , 'PR' , '80010000' , 'Alameda' , 'Cabral' , '77' , 'Casa 2'),

('Pedro Gomes' , '56789012344' , '51999887766' , 'pedro.gomes@email.com' , 'Porto Alegre' , 'RS' , '90010150' , 'Rua' , 'dos Andradas' , '345' , 'Fundos'),

('Luciana Alves' , '67890123455' , '61912349876' , 'luciana.alves@email.com' , 'Brasília' , 'DF' , '70040010' , 'Setor' , 'Comercial Norte' , '25' , 'Sala 201'),

('Rafael Lima' , '78901234566' , '85998761122' , 'rafael.lima@email.com' , 'Fortaleza' , 'CE' , '60060350' , 'Avenida' , 'Beira Mar' , '999' , 'Cobertura'),

('Patrícia Ferreira' , '89012345677' , '71991238899' , 'patricia.ferreira@email.com' , 'Salvador' , 'BA' , '40015970' , 'Ladeira' , 'da Barra' , '58' , null),

('Fernando Costa' , '90123456788' , '19987654433' , 'fernando.costa@email.com' , 'Campinas' , 'SP' , '13010200' , 'Rua' , 'Conceição' , '312' , 'Sala 5'),

('Gabriela Santos' , '01234567899' , '27992345566' , 'gabriela.santos@email.com' , 'Vitória' , 'ES' , '29010180' , 'Avenida' , 'Beira Rio' , '500' , null),

('Bruno Rocha' , '11122233344' , '62981233344' , 'bruno.rocha@email.com' , 'Goiânia' , 'GO' , '74003010' , 'Rua' , '24 de Outubro' , '210' , 'Loja 1'),

('Isabela Mendes' , '22233344455' , '95992223344' , 'isabela.mendes@email.com' , 'Boa Vista' , 'RR' , '69301040' , 'Travessa' , 'das Flores' , '14' , null),

('Felipe Araújo' , '33344455566' , '92988775566' , 'felipe.araujo@email.com' , 'Manaus' , 'AM' , '69005040' , 'Avenida' , 'Eduardo Ribeiro' , '801' , 'Apto 303'),

('Larissa Martins' , '44455566677' , '48991112233' , 'larissa.martins@email.com' , 'Florianópolis' , 'SC' , '88010400' , 'Rua' , 'Felipe Schmidt' , '230' , null),

('André Teixeira' , '55566677788' , '98999001111' , 'andre.teixeira@email.com' , 'São Luís' , 'MA' , '65010030' , 'Avenida' , 'Pedro II' , '77' , 'Casa 1'),

('Beatriz Nogueira' , '66677788899' , '13988223344' , 'beatriz.nogueira@email.com' , 'Santos' , 'SP' , '11010001' , 'Rua' , 'Conselheiro Nébias' , '920' , 'Bloco A'),

('Rodrigo Ribeiro' , '77788899900' , '16991225566' , 'rodrigo.ribeiro@email.com' , 'Ribeirão Preto' , 'SP' , '14010060' , 'Avenida' , 'Independência' , '410' , null),

('Carla Fernandes' , '88899900011' , '84998123344' , 'carla.fernandes@email.com' , 'Natal' , 'RN' , '59020120' , 'Rua' , 'das Dunas' , '199' , null),

('Ricardo Barbosa' , '99900011122' , '67991122233' , 'ricardo.barbosa@email.com' , 'Campo Grande' , 'MS' , '79002970' , 'Avenida' , 'Afonso Pena' , '321' , 'Sala 10'),

('Vanessa Castro' , '10120230344' , '82999998888' , 'vanessa.castro@email.com' , 'Maceió' , 'AL' , '57020000' , 'Rua' , 'do Sol' , '76' , 'Fundos');

INSERT INTO tiposervico (nomeservico, valor)

VALUES 

('Consulta Padrão',150),

('Consulta Emergência',250),

('Exame - Sangue',100),

('Exame - Ultrassom|Raio X',300),

('Vacina - Geral',100),

('Castração',80),

('Internação',600);

INSERT INTO animal (idCliente, nomeAnimal, especie, raca, peso, porte, sexo, anoNascimento)
VALUES
(1,  'Thor',  'Canino', 'SRD', 12.40, 'M', 'M', 2021),
(7,  'Maya',  'Felino', 'Siames', 4.20, 'P', 'F', 2023),
(12, 'Pingo', 'Canino', 'Pinscher', 3.10, 'P', 'M', 2022),
(18, 'Luna',  'Felino', 'Persa', 3.80, 'P', 'F', 2020),
(20, 'Zeca',  'Ave',    'Calopsita', 0.09, 'P', 'M', 2024);
 
 
 INSERT INTO veterinario (nomeveterinario, celular, crmv, especialidade)
VALUES 
('Farinhas Breno', 999999993, 19234511070, 'Vet de Animais Intolerantes Celíacos'),
('Camila Souza', 988887777, 20234511111, 'Cirurgiã de Pequenos Animais'),
('Rafael Nogueira', 997654321, 18256722222, 'Clínico Geral e Emergencista'),
('Larissa Almeida', 996543210, 17287633333, 'Especialista em Felinos'),
('Pedro Henrique', 995432109, 16234544444, 'Anestesista Veterinário'),
('Juliana Ribeiro', 994321098, 19298755555, 'Dermatologista de Animais Domésticos'),
('Lucas Fernandes', 993210987, 15287666666, 'Ortopedista Veterinário'),
('Ana Beatriz Costa', 992109876, 14234577777, 'Especialista em Animais Silvestres'),
('Gabriel Martins', 991098765, 13287688888, 'Cardiologista Veterinário'),
('Patrícia Lima', 990987654, 12234599999, 'Nutricionista Animal');


INSERT INTO consulta (
    idanimal, idveterinario, datahora, pago, formapagamento, qtdvezes, valorTotal, valorpago
)
VALUES (
    6, 1, '2024-12-08 10:00:00', 1, 'Pix', 1, 250.00, 250.00
);

INSERT INTO consultatiposervico (idconsulta, idtiposervico, valorservico)
VALUES
(1,2,250.00);


SELECT*FROM consultatiposervico


SELECT * FROM consulta

INSERT INTO consulta(idAnimal, idVeterinario,dataHora,pago,formaPagamento,qtdVezes,valorTotal,valorPago)

VALUES ((SELECT idAnimal FROM animal WHERE nmAnimal = 'Thor'), (SELECT idVeterinario FROM veterinario WHERE nmVeterinario = 'Ana Beatriz Costa'),

			 '2025-11-20 11:30:00', 0, 'dinheiro', 2, (SELECT valor FROM tiposervico WHERE nmServico = 'Consulta Emergência'), 125);
 
SELECT * FROM consultaTipoServico

INSERT INTO consultaTipoServico (idConsulta, idTipoServico, valorServico)

VALUE ((SELECT idConsulta FROM consulta WHERE idConsulta = 1),

		(SELECT idTipoServico FROM tiposervico WHERE nmServico = 'Consulta Emergência'),

		(SELECT valor FROM tiposervico WHERE nmServico = 'Consulta Emergência'));
		
		
		/*Inserir 2 consultas com 1 procedimento cada para um mesmo animal da clínica, mas em dias diferentes; 
		(2 coins por linha afetada corretamente)*/
		
		
		
		INSERT INTO consulta (idAnimal, idVeterinario,dataHora,pago,formaPagamento,qtdVezes,valorTotal,valorPago)
		VALUE
		 (6,1,'2025-10-02',1, 'pix',1,150,150),
		(6,1,'2025-11-11',1, 'pix', 1, 150,150);

		
		INSERT INTO consultatiposervico (idConsulta, idTipoServico, valorServico)
		VALUE
		(10,1,150),
		(11,1,150);
 
 /*Inserir 1 cosulta com 2 procedimentos para um mesmo animal da clínica. (2 coins por linha afetada corretamente*/
 
		INSERT INTO consulta (idAnimal, idVeterinario,dataHora,pago,formaPagamento,qtdVezes,valorTotal,valorPago)
		VALUE 
		(6,1,'2025-10-02', 'pix',1,1,150,150),clinivavet
		(6,1,'2025-11-11', 'pix', 1,1,150,150);
		
		
		INSERT INTO consultatiposervico (idConsulta, idTipoServico, valorServico)
		VALUE 
		(12,1,150),
		(12,1,150);
		
		
		
		performance_schema