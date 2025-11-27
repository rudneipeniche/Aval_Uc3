
/*Busca genérica de dados*/
SELECT * FROM animal

/* busca especifica de dados*/
SELECT nomeanimal, peso FROM animal

/*inserção Explicita */
INSERT INTO cliente (nomecliente, cpf, celular, email, cidade, estado, cep, tipologradouro, nomelogradouro, numero,complemento)
VALUES ('Juquinha', '77755566622','13977885511','juquinha@uol.com','Santos', 'SP', '11054999','Avenida','Conselheiro Nébias' , '78','ap54'); 

SELECT *FROM cliente
SELECT nomeCliente, Celular, email FROM cliente


/* Alteraçao de dados*/
UPDATE cliente
SET /* colocar os dados a ser alterados*/

WHERE idcliente= /* colocar o idcliente*/

/* Exclusão de dados*/
DELETE FROM cliente
WHERE idcliente= /*coolocar o idcliente*/

/*buscas basicas*/
SELECT *FROM cliente
WHERE nomecliente LIKE 'M%' 


SELECT nomecliente,cpf,cidade FROM cliente
WHERE cidade='Santos' OR cidade='Guarujá'


SELECT nomecliente,cpf,cidade FROM cliente
WHERE cidade <>'Guarujá' /*diferente*/


SELECT nomecliente, celular, emal FROM cliente
ORDER BY cliente /*ordem alfabetica ou numerica ascendente*/

SELECT nomecliente, celular, emal FROM cliente
ORDER BY nomecliente DESC /*ordem alfabetica ou numerica descendente*/

/* listar nomes dos clientes, cidade e estado de SP*/

SELECT nomecliente, cidade, estado
FROM cliente
WHERE estado= 'sp'

SELECT nomecliente, cidade, estado, celular 
FROM cliente  
WHERE estado IN ('SP','RJ','MG','ES') AND nomecliente LIKE 'F%'
ORDER BY nomecliente 

/*7Listar o nome do cliente, o celular e a cidade de todos os clientes que morem em casa,
em ordem alfabética por nome*/


SELECT nomecliente, celular, cidade,complemento
FROM cliente
WHERE complemento IS NULL OR complemento LIKE ('Casa%', 'fundos%', 'bloco%')
ORDER BY nomecliente; 

SELECT nomecliente, celular, cidade, complemento
FROM cliente
WHERE 
    complemento IS NULL 
    OR complemento LIKE 'Casa%' 
    OR complemento LIKE 'fundos%' 
    OR complemento LIKE 'bloco%'
ORDER BY nomecliente;

 
/*8 Listar todos os dados dos clientes que morem no estado de SP e morem em Avenidas,
em ordem decrescente por nome*/

SELECT * FROM cliente
WHERE estado = 'SP' AND (tipologradouro LIKE 'Avenida%')
ORDER BY nomecliente DESC;


/*Funçoes de Agregação*/
/* count*/

SELECT COUNT(idanimal) AS Qtd_Animais FROM animal

/*max/min*/
SELECT MAX(idcliente) AS Maior_id_cliente FROM cliente
SELECT MIN(idcliente) AS Menor_id_cliente FROM cliente
SELECT MAX(peso) AS Animal_mais_pesado FROM animal

/* avg*/
SELECT AVG(peso) AS Media_de_pesos FROM animal

/*sum*/
SELECT SUM(valorpago) AS rendimento_bruto FROM consulta

/*funções Agregação com Group BY*/
/*Quantidade de Clientes por estado*/
SELECT estado, COUNT(idCliente) AS Qtd FROM cliente
WHERE estado IN ('sc', 'pr' 'rs') /*filtro*/
GROUP BY estado /*agrupamento*/
ORDER BY estado DESC /*ordenação*/


SELECT estado, COUNT(idCliente) AS Qtd FROM cliente
GROUP BY estado /*agrupamento*/
ORDER BY qtd DESC /*ordenação*/




