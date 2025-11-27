SELECT
  e.nomeEquipamento,
  SUM(ae.qtd) AS TotalAlugado
FROM AluguelEquipamento AS ae
INNER JOIN equipamento AS e
  ON ae.idEquipamento = e.idEquipamento
GROUP BY
  e.nomeEquipamento
ORDER BY
  TotalAlugado DESC;
  
  SELECT
  f.nomeFuncionario,
  COUNT(a.idAluguel) AS TotalAlugueisProcessados
FROM aluguel AS a
INNER JOIN funcionario AS f
  ON a.idFuncionario = f.idFuncionario
GROUP BY
  f.nomeFuncionario
ORDER BY
  TotalAlugueisProcessados DESC;
  
  
  SELECT
  c.nomeCliente,
  SUM(a.valorAPagar) AS ValorTotalGasto,
  COUNT(a.idAluguel) AS QuantidadeDeAlugueis
FROM aluguel AS a
INNER JOIN cliente AS c
  ON a.idCliente = c.idCliente
GROUP BY
  c.nomeCliente
ORDER BY
  ValorTotalGasto DESC
LIMIT 5;