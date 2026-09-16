-- Maria (também atendente), Pedro, Ana e Fernanda são cadastrados como clientes,
-- cada um com seus dados bancários.

INSERT INTO clientes (pessoa_id, banco, agencia, conta, tipo_conta, data_registro)
SELECT p.pessoa_id, v.banco, v.agencia, v.conta, v.tipo_conta, v.data_registro
FROM (VALUES
    ('22222222222', 'Banco do Brasil', '1234',  '00012345-6', 'CORRENTE', DATE '2024-01-20'),
    ('33333333333', 'Caixa Econômica', '0567',  '00098765-4', 'POUPANCA', DATE '2024-02-01'),
    ('44444444444', 'Bradesco',        '2345',  '00054321-0', 'CORRENTE', DATE '2024-02-10'),
    ('66666666666', 'Itaú',            '3456',  '00011122-3', 'CORRENTE', DATE '2024-03-05')
) AS v(cpf, banco, agencia, conta, tipo_conta, data_registro)
JOIN pessoas p ON p.cpf = v.cpf
ON CONFLICT (pessoa_id) DO NOTHING;
