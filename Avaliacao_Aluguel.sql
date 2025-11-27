/*1.Criar um aluguel de equipamento para o mês de novembro (qualquer data e hora),
qualquer equipamento, qualquer funcionário e qualquer cliente, mas cujo pagamento não tenha sido feito (ficou em aberto).*/


INSERT INTO aluguel (
    idCliente, idFuncionario, dataHoraRetirada, dataHoraDevolucao,
    valorAPagar, valorPago, pago, formaPagamento, qtVezes
) VALUES (
    1,                    -- cliente
    1,                    -- funcionário
    '2024-11-15 09:00:00',
    '2024-11-15 12:00:00',
    50.00,                -- valor total a pagar
    NULL,                 -- não pagou
    0,                    -- 0 = em aberto
    NULL,
    1
);
INSERT INTO AluguelEquipamento (
    idEquipamento, idAluguel, valorItem, valorUnitario, qtd
) VALUES (
    1,     -- equipamento (Cadeira 2 posições)
    1,     -- aluguel criado acima
    50.00,
    2.00,
    2
    );
    
    /*2.Listar nome de todos os funcionários, cpf e os aluguéis feitos por ele (apenas a data e que equipamento alugou)*/
    SELECT 
    f.nomeFuncionario,
    f.cpf,
    a.dataHoraRetirada AS dataAluguel,
    e.nomeEquipamento
FROM funcionario f
LEFT JOIN aluguel a 
       ON a.idFuncionario = f.idFuncionario
LEFT JOIN AluguelEquipamento ae
       ON ae.idAluguel = a.idAluguel
LEFT JOIN equipamento e
       ON e.idEquipamento = ae.idEquipamento
ORDER BY f.nomeFuncionario, a.dataHoraRetirada;

/*3.Listar nome do cliente, cpf, datas que ele esteve na praia, quem atendeu este
cliente, tudo isto, ordenado por data, da mais nova para a mais antiga, apenas no mês de DEZ24.  */

SELECT
    c.nomeCliente,
    c.cpf,
    a.dataHoraRetirada AS dataEstadia,
    f.nomeFuncionario AS atendente
FROM aluguel a
JOIN cliente c ON c.idCliente = a.idCliente
JOIN funcionario f ON f.idFuncionario = a.idFuncionario
WHERE a.dataHoraRetirada BETWEEN '2024-12-01' AND '2024-12-31 23:59:59'
ORDER BY a.dataHoraRetirada DESC;

/*4.Lista do nome dos equipamentos que foram mais alugados em ordem decrescente, do equipamento mais alugado para o menos alugado.
 Equipamentos não alugados devem sair no relatório.*/
SELECT
    e.nomeEquipamento,
    COUNT(ae.idAluguel) AS totalAlugado
FROM equipamento e
LEFT JOIN AluguelEquipamento ae
       ON ae.idEquipamento = e.idEquipamento
GROUP BY e.idEquipamento, e.nomeEquipamento
ORDER BY totalAlugado DESC;

/*5.Listar a arrecadação bruta da barraca de praia entre Natal e Ano Novo.*/
SELECT 
    SUM(valorPago) AS arrecadacao_bruta
FROM aluguel
WHERE pago = 1
  AND dataHoraRetirada BETWEEN '2024-12-25' AND '2024-12-31 23:59:59';
  
 /*6.Reajustar preço por hora de todos os equipamentos em 10%.*/
 UPDATE Equipamento
SET valorHora = (valorHora*0.1)+valorHora
WHERE idEquipamento = idEquipamento
 
 
 /*7.Listar a quantidade de clientes que pagaram utilizando determinada forma de pagamento, em ordem crescente, do método mais usado para o menos usado.
  Também é necessário que pagamentos não realizados sejam apontados.*/
  
  SELECT
    COALESCE(formaPagamento, 'NÃO INFORMADO') AS formaPagamento,
    SUM(CASE WHEN pago = 1 THEN 1 ELSE 0 END) AS totalPagos,
    SUM(CASE WHEN pago = 0 THEN 1 ELSE 0 END) AS totalNaoPagos,
    COUNT(*) AS totalTransacoes
FROM aluguel
GROUP BY formaPagamento
ORDER BY totalPagos DESC;

/*8.Listar quanto a barraca faturou por dia, em cada um dos dias do mês de dezembro apenas. */
SELECT 
    DATE(dataHoraRetirada) AS dia,
    SUM(valorPago) AS faturamento
FROM aluguel
WHERE MONTH(dataHoraRetirada) = 12
GROUP BY DATE(dataHoraRetirada)
ORDER BY dia;


/*9.Excluir o pagamento e todas as referências a ele criadas no item 1. 
Se tentar excluir direto da tabela aluguel teremos um problema? Por que isto ocorre? Como resolver (escrever o código usado)?

Se tentarmos excluir diretamente da tabela aluguel, ocorre um erro de restrição de chave estrangeira, pois existem registros dependentes na tabela AluguelEquipamento. O MySQL impede a exclusão do registro pai enquanto existirem registros filhos relacionados. 
Para resolver, devemos excluir primeiro todas as referências na tabela associativa e somente depois excluir o aluguel.*/
DELETE FROM AluguelEquipamento
WHERE idAluguel = 1;

DELETE FROM aluguel
WHERE idAluguel = 1;



/*10.Listar todos os equipamentos que tiveram a quantidade de aluguéis inferiores a 5 unidades, durante o mês de DEZ24.*/
CREATE TABLE aluguel_equipamento (
    idAluguel INT,
    idEquipamento INT,
    horasUsadas INT,
    PRIMARY KEY (idAluguel, idEquipamento),
    FOREIGN KEY (idAluguel) REFERENCES aluguel(idAluguel),
    FOREIGN KEY (idEquipamento) REFERENCES equipamento(idEquipamento)
);


SELECT 
    e.nomeEquipamento,
    COUNT(ae.idEquipamento) AS totalAlugueis
FROM equipamento e
LEFT JOIN aluguel_equipamento ae 
       ON e.idEquipamento = ae.idEquipamento
LEFT JOIN aluguel a
       ON a.idAluguel = ae.idAluguel
       AND a.dataHoraRetirada BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY e.idEquipamento, e.nomeEquipamento
HAVING totalAlugueis < 5
ORDER BY totalAlugueis ASC;



 





  


