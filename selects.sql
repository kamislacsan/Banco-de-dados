SELECT m.nome, e.nome AS especialidade
FROM medico m
JOIN Especialidade e ON m.id_especialidade = e.id_especialidade;

SELECT c.id_consulta, c.data, c.hora, p.valor, p.data_pagamento
FROM consulta c
LEFT JOIN pagamento p ON c.id_consulta = p.id_consulta
WHERE c.id_paciente = 1;

SELECT m.nome, SUM(p.valor) AS total_pago
FROM medico m
JOIN consulta c on m.id_medico = c.id_medico
JOIN pagamento p ON c.id_consulta =p.id_consulta
GROUP BY m.nome;

SELECT p.nome
FROM paciente p
JOIN consulta c ON p.id_paciente = c.id_paciente
LEFT JOIN pagamento pay ON c.id_consulta = pay.id_consulta
WHERE pay.id_pagamento IS NULL;

SELECT m.nome, COUNT(c.id_consulta) AS num_consultas
FROM Medico m
JOIN Consulta c ON m.id_medico = c.id_medico
WHERE c.data >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
GROUP BY m.nome
ORDER BY num_consultas DESC;
