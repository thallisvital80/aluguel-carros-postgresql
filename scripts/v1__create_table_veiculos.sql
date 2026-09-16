-- Frota de veículos disponíveis para locação.

CREATE TABLE IF NOT EXISTS veiculos (
    veiculo_id      SERIAL PRIMARY KEY,
    placa           VARCHAR(8) NOT NULL UNIQUE,
    marca           VARCHAR(60) NOT NULL,
    modelo          VARCHAR(60) NOT NULL,
    tipo            VARCHAR(20) NOT NULL
                        CHECK (tipo IN ('MOTO', 'CAMINHAO', 'CARRO_PASSEIO')),
    valor_diaria    NUMERIC(10, 2) NOT NULL CHECK (valor_diaria > 0),
    disponivel      BOOLEAN NOT NULL DEFAULT TRUE
);

COMMENT ON TABLE veiculos IS 'Frota de veículos da locadora (motos, carros de passeio e caminhões).';
