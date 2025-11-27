/*INNER JOIN*/

SELECT nomeVeterinario, crmv, dataHora FROM veterinario
INNER JOIN consulta 
ON veterinario.idVeterinario=consulta.idveterinario


/*LEFT JOIN* - Ordenado por nome, depois por data- apenas veterinarios com a letra P*/
SELECT nomeVeterinario, crmv, dataHora 
FROM veterinario LEFT JOIN consulta 
ON veterinario.idVeterinario=consulta.idveterinario
WHERE nomeVeterinario LIKE 'P%'
ORDER BY nomeVeterinario, dataHora 


/*Nome do animal, nome do cliente, contatos do cliente 
em ordem alfabética por nome do animal
apenas clientes que morem no estado SP*/
SELECT nomeAnimal,nomeCliente,celular,email
FROM cliente LEFT JOIN animal
ON animal.idCliente = cliente.idCliente
WHERE estado = 'SP'
ORDER BY nomeAnimal 



/* B - Nome do animal, peso, que animal que é, nome do cliente de todos os animais
em ordem alfabética por nome do animal */
SELECT nomeAnimal, peso, especie, nomeCliente
FROM animal INNER JOIN cliente
 ON animal.idCliente = cliente.idCliente
ORDER BY nomeAnimal;

/* C - Nome do procedimento, seu valor, de todos os procedimentos que foram realizados
em alguma consulta, em ordem alfabética por nome do procedimento. Também se requer a data
em que foram realizados os procedimentos*/
 
SELECT nomeservico, valor, datahora
FROM tiposervico INNER JOIN consultatiposervico
ON tiposervico.idtiposervico = consultatiposervico.idtiposervico
INNER JOIN consulta
ON consultatiposervico.idConsulta = consulta.idconsulta
ORDER BY nomeServico;


/* D - Nome do procedimento, seu valor, de todos os procedimentos cadastrados sejam
realizados ou não em alguma consulta, em ordem alfabética por nome do procedimento. 
Também se requer a data em que foram realizados os procedimentos */
SELECT nomeservico, valor, datahora
FROM tiposervico LEFT JOIN consultatiposervico
ON tiposervico.idtiposervico = consultatiposervico.idtiposervico
left JOIN consulta
ON consultatiposervico.idConsulta = consulta.idconsulta
ORDER BY nomeServico;


/* E - Nome do cliente, cpf, cidade, estado de todos os clientes
que vivem na região sudeste em ordem alfabética por nome e cidade*/
SELECT nomecliente,cpf,cidade,estado FROM cliente
WHERE estado IN ('sp','es','rj','mg')
ORDER BY nomeCliente, cidade;



/* Quantidade de animais por espécie */
SELECT especie, COUNT(idanimal) AS Qtd
FROM animal 
GROUP BY especie
ORDER BY especie ASC;


/* Todos os animais e a quantidade de espécies, mas apenas dos animais que possuem 
mais de 3 espécies */
SELECT especie, COUNT(idanimal) AS Qtd
FROM animal
GROUP BY especie
HAVING COUNT(idanimal) > 3
ORDER BY especie ASC;





