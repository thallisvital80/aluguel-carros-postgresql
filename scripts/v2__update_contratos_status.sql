-- 1) Fluxo normal: finalizar um contrato ativo e liberar o veículo.
UPDATE contratos
SET status = 'FINALIZADO'
WHERE numero_contrato = 'CT-0002';

UPDATE veiculos
SET disponivel = TRUE
WHERE veiculo_id = (SELECT veiculo_id FROM contratos WHERE numero_contrato = 'CT-0002');

-- 2) Marcar um veículo como indisponível (em manutenção, por exemplo).
UPDATE veiculos
SET disponivel = FALSE
WHERE placa = 'DEF4E56';

-- 3) Desativar um atendente que não está mais na empresa.
UPDATE atendentes
SET ativo = FALSE
WHERE matricula = 'ATD003';

-- 4) Teste de violação de regra (deve falhar por causa do CHECK chk_periodo_vigencia):
-- Descomente para testar manualmente.
-- UPDATE contratos
-- SET data_fim = data_inicio - INTERVAL '1 day'
-- WHERE numero_contrato = 'CT-0001';

-- 5) Teste de violação de domínio (deve falhar por causa do CHECK de tipo_pagamento):
-- UPDATE contratos SET tipo_pagamento = 'BOLETO' WHERE numero_contrato = 'CT-0001';
