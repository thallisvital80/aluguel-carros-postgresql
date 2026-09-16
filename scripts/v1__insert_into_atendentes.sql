-- João, Maria e Carlos atuam como atendentes.
-- Maria também será cadastrada como cliente (v1__insert_into_clientes.sql),
-- validando a regra de que um atendente pode ser cliente.

INSERT INTO atendentes (pessoa_id, matricula, data_admissao, ativo)
SELECT p.pessoa_id, v.matricula, v.data_admissao, TRUE
FROM (VALUES
    ('11111111111', 'ATD001', DATE '2024-01-10'),
    ('22222222222', 'ATD002', DATE '2024-01-15'),
    ('55555555555', 'ATD003', DATE '2024-03-01')
) AS v(cpf, matricula, data_admissao)
JOIN pessoas p ON p.cpf = v.cpf
ON CONFLICT (pessoa_id) DO NOTHING;
