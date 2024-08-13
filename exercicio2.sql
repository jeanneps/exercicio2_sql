-- questão1
--Crie um banco chamado senac
--crie as tabelas 

--aluno 
--matricula inteiro, chave primaria, auto
--nome 60 caracteres, não nulo

--curso
--id do curso inteiro, primário, auto
--nome do curso 100 caracteres, não nulo


--considere a regra de negocio
--1 aluno pode se matricular em apenas 1 curso
-- curso pode ter vários alunos
--Cadastre cursos e alunos, e exiba uma listagem de alunos com sua matricula, nome, curso ordenando os nomes dos alunos alfabeticamente

CREATE  DATABASE senac;

USE senac;

CREATE TABLE aluno (
    matricula  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (60) NOT NULL
);
CREATE TABLE curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_curso VARCHAR (100) NOT NULL
    
);
INSERT INTO aluno (matricula, nome) VALUES ('1','ana'), ('2', 'tiago'), ('2', 'beatriz'), ('34', 'joão'), ('23', 'fabiano'), ('10', 'adriana');
INSERT INTO curso (nome_do_curso) VALUES ('programador web');

