INSERT INTO veiculos (placa, marca, modelo, tipo, valor_diaria, disponivel) VALUES
    ('ABC1D23', 'Chevrolet', 'Onix',        'CARRO_PASSEIO', 120.00, TRUE),
    ('DEF4E56', 'Fiat',      'Argo',        'CARRO_PASSEIO', 110.00, TRUE),
    ('GHI7F89', 'Honda',     'CG 160',      'MOTO',           60.00, TRUE),
    ('JKL0G12', 'Yamaha',    'Fazer 250',   'MOTO',           70.00, TRUE),
    ('MNO3H45', 'Volkswagen','Delivery 9.170', 'CAMINHAO',   350.00, TRUE)
ON CONFLICT (placa) DO NOTHING;
