-- Tabela base: dados cadastrais de qualquer indivíduo.
-- Atendentes e clientes referenciam esta tabela, permitindo que
-- uma mesma pessoa acumule os dois papéis sem duplicar dados.

CREATE TABLE IF NOT EXISTS pessoas (
    pessoa_id       SERIAL PRIMARY KEY,
    cpf             VARCHAR(11)  NOT NULL UNIQUE,
    nome            VARCHAR(100) NOT NULL,
    sobrenome       VARCHAR(100) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    endereco        VARCHAR(200),
    data_cadastro   DATE NOT NULL DEFAULT CURRENT_DATE
);

COMMENT ON TABLE pessoas IS 'Cadastro único de pessoas físicas que podem ser atendentes e/ou clientes.';
