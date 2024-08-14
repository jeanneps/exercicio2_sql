CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    ano_lancamento INT NOT NULL
);

INSERT INTO Livros (titulo, descricao, ano_lancamento) VALUES 
('A Casa na Praia', 'Um romance sobre a vida em uma casa à beira-mar.', 2020),
('A Casa na Praia', 'Uma continuação da história da casa à beira-mar.', 2023),
('O Coração das Trevas', 'Uma aventura épica sobre a exploração de regiões desconhecidas.', 2018),
('O Céu da Meia-Noite', 'Um thriller científico sobre a exploração espacial.', 2021),
('A Arte da Guerra', 'Um clássico sobre estratégias militares e táticas.', 2019),
('O Caminho das Sombras', 'Uma jornada misteriosa em um mundo sombrio.', 2022),
('O Sol é para Todos', 'Uma história inspiradora sobre superação e justiça.', 2017),
('A Última Fronteira', 'Uma ficção científica sobre a exploração dos confins do universo.', 2024),
('O Mistério do Tempo', 'Um romance de ficção científica envolvendo viagens no tempo.', 2020),
('A Revolução das Máquinas', 'Uma narrativa sobre o impacto da tecnologia na sociedade.', 2021);

SELECT titulo, ano_lancamento FROM livros ORDER BY titulo ASC, ano_lancamento DESC;

SELECT titulo FROM livros WHERE titulo LIKE '%c%' ORDER BY titulo ASC;

UPDATE livros SET ano_lancamento = 2023 WHERE titulo LIKE '%c%';

SELECT * FROM livros WHERE titulo LIKE 'a%';
DELETE FROM livros WHERE titulo LIKE 'a%';

DROP DATABASE biblioteca;


-- exercicio sql relacionamentos 1

CREATE DATABASE senac;

USE senac;

CREATE TABLE curso(
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL
);

CREATE TABLE aluno(
    matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso)
);

-- Inserir cursos
INSERT INTO curso (nome_curso) VALUES
('Programador Web'),
('Design Gráfico'),
('Administração');

-- Inserir alunos
INSERT INTO aluno (nome, id_curso) VALUES
('João Silva', 1), -- João Silva está matriculado em Programador Web
('Maria Oliveira', 2), -- Maria Oliveira está matriculada em Design Gráfico
('Pedro Santos', 1), -- Pedro Santos está matriculado em Programador Web
('Ana Costa', 3); -- Ana Costa está matriculada em Administração

SELECT a.matricula, a.nome AS nome_aluno, c.nome_curso
FROM aluno a
JOIN curso c ON a.id_curso = c.id_curso
ORDER BY a.nome ASC;


-- exercicio sql relacionamentos 2

CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    ano_lancamento INT NOT NULL
);

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL
);

CREATE TABLE livros_categorias (
    id_livro INT,
    id_categoria INT,
    PRIMARY KEY (id_livro, id_categoria), -- chave composta dessa tabela
    FOREIGN KEY (id_livro) REFERENCES livros(id),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Inserir livros
INSERT INTO livros (titulo, descricao, ano_lancamento) VALUES
('O Senhor dos Anéis', 'Uma épica história de fantasia', 1954),
('Harry Potter e a Pedra Filosofal', 'Aventura de um jovem bruxo', 1997);

-- Inserir categorias
INSERT INTO categorias (nome) VALUES
('Fantasia'),
('Aventura'),
('Magia');

-- Associar livros às categorias
INSERT INTO livros_categorias (id_livro, id_categoria) VALUES
(1, 1), -- "O Senhor dos Anéis" é Fantasia
(1, 2), -- "O Senhor dos Anéis" é Aventura
(2, 2), -- "Harry Potter e a Pedra Filosofal" é Aventura
(2, 3); -- "Harry Potter e a Pedra Filosofal" é Magia

SELECT l.titulo, c.nome AS categoria
FROM livros l
JOIN livros_categorias lc ON l.id = lc.id_livro
JOIN categorias c ON lc.id_categoria = c.id_categoria
ORDER BY l.titulo ASC, c.nome ASC;
