INSERT INTO pessoas (cpf, nome, sobrenome, email, endereco, data_cadastro) VALUES
    ('11111111111', 'João',     'Silva',     'joao.silva@email.com',     'Av. Sete de Setembro, 100 - Porto Velho/RO', '2024-01-10'),
    ('22222222222', 'Maria',    'Souza',     'maria.souza@email.com',    'Rua das Flores, 200 - Porto Velho/RO',        '2024-01-15'), -- atendente e cliente
    ('33333333333', 'Pedro',    'Santos',    'pedro.santos@email.com',   'Rua da Beira, 300 - Porto Velho/RO',          '2024-02-01'),
    ('44444444444', 'Ana',      'Oliveira',  'ana.oliveira@email.com',   'Av. Rio Madeira, 400 - Porto Velho/RO',       '2024-02-10'),
    ('55555555555', 'Carlos',   'Pereira',   'carlos.pereira@email.com', 'Rua Tabajara, 500 - Porto Velho/RO',          '2024-03-01'),
    ('66666666666', 'Fernanda', 'Lima',      'fernanda.lima@email.com',  'Av. Jorge Teixeira, 600 - Porto Velho/RO',    '2024-03-05')
ON CONFLICT (cpf) DO NOTHING;
