-- View de apoio: mostra os contratos com nomes/placas em vez de IDs,
-- facilitando consultas e validação dos dados.

CREATE OR REPLACE VIEW contratos_detalhado AS
SELECT
    ct.contrato_id,
    ct.numero_contrato,
    pc.nome || ' ' || pc.sobrenome  AS cliente,
    ve.placa,
    ve.marca || ' ' || ve.modelo    AS veiculo,
    ve.tipo                          AS tipo_veiculo,
    pa.nome || ' ' || pa.sobrenome  AS atendente,
    ct.tipo_pagamento,
    ct.data_inicio,
    ct.data_fim,
    ct.valor_total,
    ct.status
FROM contratos ct
JOIN clientes c    ON c.cliente_id = ct.cliente_id
JOIN pessoas pc    ON pc.pessoa_id = c.pessoa_id
JOIN veiculos ve   ON ve.veiculo_id = ct.veiculo_id
LEFT JOIN atendentes a ON a.atendente_id = ct.atendente_id
LEFT JOIN pessoas pa   ON pa.pessoa_id = a.pessoa_id
ORDER BY ct.data_inicio;
