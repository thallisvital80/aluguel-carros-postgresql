-- Papel de cliente. Relacionamento 1:1 com pessoas (UNIQUE em pessoa_id).
-- Inclui dados bancários exigidos pelo tema (para repasses/cauções, por exemplo).

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id      SERIAL PRIMARY KEY,
    pessoa_id       INTEGER NOT NULL UNIQUE
                        REFERENCES pessoas (pessoa_id) ON DELETE CASCADE,
    banco           VARCHAR(60) NOT NULL,
    agencia         VARCHAR(10) NOT NULL,
    conta           VARCHAR(20) NOT NULL,
    tipo_conta      VARCHAR(10) NOT NULL DEFAULT 'CORRENTE'
                        CHECK (tipo_conta IN ('CORRENTE', 'POUPANCA')),
    data_registro   DATE NOT NULL DEFAULT CURRENT_DATE
);

COMMENT ON TABLE clientes IS 'Pessoas que atuam como clientes, com dados bancários para pagamentos/cauções.';
