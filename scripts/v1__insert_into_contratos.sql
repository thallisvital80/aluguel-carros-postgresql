-- Contratos de locação, cobrindo os três relacionamentos (cliente, veículo, atendente)
-- e diferentes formas de pagamento e status.

INSERT INTO contratos
    (numero_contrato, tipo_pagamento, data_contrato, cliente_id, veiculo_id, atendente_id,
     data_inicio, data_fim, valor_total, status)
SELECT v.numero_contrato, v.tipo_pagamento, v.data_contrato, c.cliente_id, ve.veiculo_id, a.atendente_id,
       v.data_inicio, v.data_fim, v.valor_total, v.status
FROM (VALUES
    ('CT-0001', 'PIX',    DATE '2024-04-01', '33333333333', 'ABC1D23', 'ATD001', DATE '2024-04-01', DATE '2024-04-10', 1080.00, 'FINALIZADO'),
    ('CT-0002', 'CARTAO', DATE '2024-04-05', '44444444444', 'GHI7F89', 'ATD002', DATE '2024-04-05', DATE '2024-04-20',  900.00, 'ATIVO'),
    ('CT-0003', 'PIX',    DATE '2024-04-08', '22222222222', 'DEF4E56', 'ATD002', DATE '2024-04-08', DATE '2024-04-15',  770.00, 'ATIVO'),
    ('CT-0004', 'CARTAO', DATE '2024-04-10', '66666666666', 'JKL0G12', 'ATD003', DATE '2024-04-10', DATE '2024-04-12',  140.00, 'CANCELADO'),
    ('CT-0005', 'PIX',    DATE '2024-04-12', '33333333333', 'MNO3H45', 'ATD001', DATE '2024-04-12', DATE '2024-04-13',  350.00, 'ATIVO')
) AS v(numero_contrato, tipo_pagamento, data_contrato, cpf_cliente, placa, matricula, data_inicio, data_fim, valor_total, status)
JOIN pessoas p    ON p.cpf = v.cpf_cliente
JOIN clientes c   ON c.pessoa_id = p.pessoa_id
JOIN veiculos ve  ON ve.placa = v.placa
JOIN atendentes a ON a.matricula = v.matricula
ON CONFLICT (numero_contrato) DO NOTHING;
