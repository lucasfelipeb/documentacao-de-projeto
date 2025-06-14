CREATE TABLE tb_livros (
    ID_LIVRO VARCHAR(255) PRIMARY KEY,
    TITULO VARCHAR(255) NOT NULL,
    AUTOR VARCHAR(255),
    GENERO VARCHAR(100),
    ANO_PUBLICACAO INT,
    ISBN VARCHAR(20) UNIQUE,
    DISPONIVEL BOOLEAN DEFAULT TRUE
);

CREATE TABLE tb_leitores (
    ID_LEITOR VARCHAR(255) PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE,
    TELEFONE VARCHAR(20),
    ENDERECO VARCHAR(255)
);

CREATE TABLE tb_emprestimos (
    ID_EMPRESTIMO VARCHAR(255) PRIMARY KEY,
    ID_LIVRO VARCHAR(255) NOT NULL,
    ID_LEITOR VARCHAR(255) NOT NULL,
    DATA_EMPRESTIMO DATE NOT NULL,
    DATA_DEVOLUCAO_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO_REAL DATE,
    ATRASADO BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ID_LIVRO) REFERENCES tb_livros(ID_LIVRO),
    FOREIGN KEY (ID_LEITOR) REFERENCES tb_leitores(ID_LEITOR)
);

CREATE TABLE tb_multas (
    ID_MULTA VARCHAR(255) PRIMARY KEY,
    ID_EMPRESTIMO VARCHAR(255) NOT NULL,
    VALOR DECIMAL(10, 2) NOT NULL,
    DATA_GERACAO DATE NOT NULL,
    PAGA BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ID_EMPRESTIMO) REFERENCES tb_emprestimos(ID_EMPRESTIMO)
);

CREATE TABLE tb_bibliotecarios (
    ID_BIBLIOTECARIO VARCHAR(255) PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE,
    CARGO VARCHAR(100)
);

CREATE TABLE tb_administradores (
    ID_ADMINISTRADOR VARCHAR(255) PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE
);

CREATE TABLE tb_acervos (
    ID_ACERVO VARCHAR(255) PRIMARY KEY,
    LOCALIZACAO VARCHAR(255) NOT NULL,
    CAPACIDADE INT
);

CREATE TABLE tb_reservas (
    ID_RESERVA VARCHAR(255) PRIMARY KEY,
    ID_LIVRO VARCHAR(255) NOT NULL,
    ID_LEITOR VARCHAR(255) NOT NULL,
    DATA_RESERVA DATE NOT NULL,
    DATA_EXPIRACAO DATE NOT NULL,
    ATIVA BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ID_LIVRO) REFERENCES tb_livros(ID_LIVRO),
    FOREIGN KEY (ID_LEITOR) REFERENCES tb_leitores(ID_LEITOR)
);
