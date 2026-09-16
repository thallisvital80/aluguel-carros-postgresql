-- Contrato de locação: liga cliente, veículo e atendente responsável pelo registro.

CREATE TABLE IF NOT EXISTS contratos (
    contrato_id       SERIAL PRIMARY KEY,
    numero_contrato   VARCHAR(20) NOT NULL UNIQUE,
    tipo_pagamento    VARCHAR(10) NOT NULL
                          CHECK (tipo_pagamento IN ('CARTAO', 'PIX')),
    data_contrato     DATE NOT NULL DEFAULT CURRENT_DATE,
    cliente_id        INTEGER NOT NULL REFERENCES clientes (cliente_id),
    veiculo_id        INTEGER NOT NULL REFERENCES veiculos (veiculo_id),
    atendente_id      INTEGER REFERENCES atendentes (atendente_id),
    data_inicio       DATE NOT NULL,
    data_fim          DATE NOT NULL,
    valor_total       NUMERIC(10, 2) NOT NULL CHECK (valor_total >= 0),
    status            VARCHAR(20) NOT NULL DEFAULT 'ATIVO'
                          CHECK (status IN ('ATIVO', 'FINALIZADO', 'CANCELADO')),
    CONSTRAINT chk_periodo_vigencia CHECK (data_fim >= data_inicio)
);

COMMENT ON TABLE contratos IS 'Contratos de locação de veículos, com pagamento e período de vigência.';
