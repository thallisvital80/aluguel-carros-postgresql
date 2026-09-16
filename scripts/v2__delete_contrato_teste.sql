-- 1) Remover contratos cancelados (exemplo de limpeza de dados de teste).
DELETE FROM contratos
WHERE status = 'CANCELADO';

-- 2) Teste de integridade referencial (deve falhar, pois há contratos vinculados
-- a este veículo e não existe ON DELETE CASCADE em contratos.veiculo_id):
-- Descomente para testar manualmente.
-- DELETE FROM veiculos WHERE placa = 'ABC1D23';

-- 3) Teste de exclusão em cascata: remover uma pessoa remove automaticamente
-- seus registros em 'atendentes' e/ou 'clientes' (ON DELETE CASCADE),
-- mas falhará se essa pessoa tiver contratos vinculados como cliente.
-- DELETE FROM pessoas WHERE cpf = '55555555555';
