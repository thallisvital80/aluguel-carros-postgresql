-- Papel de atendente. Relacionamento 1:1 com pessoas (UNIQUE em pessoa_id).

CREATE TABLE IF NOT EXISTS atendentes (
    atendente_id    SERIAL PRIMARY KEY,
    pessoa_id       INTEGER NOT NULL UNIQUE
                        REFERENCES pessoas (pessoa_id) ON DELETE CASCADE,
    matricula       VARCHAR(20) NOT NULL UNIQUE,
    data_admissao   DATE NOT NULL DEFAULT CURRENT_DATE,
    ativo           BOOLEAN NOT NULL DEFAULT TRUE
);

COMMENT ON TABLE atendentes IS 'Pessoas que atuam como atendentes da locadora. Uma pessoa pode ser também cliente.';
