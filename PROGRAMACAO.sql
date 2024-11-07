SHOW DATABASES;
USE Faculdade;
-- Tabela: Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(18) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

-- Tabela: Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

-- Tabela: Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);

-- Tabela: Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_curso INT NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);

-- Tabela: Turmas
CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    id_disciplina INT NOT NULL,
    semestre VARCHAR(10) NOT NULL,
    limite_alunos INT DEFAULT 25,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

-- Tabela: Matriculas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATE NOT NULL,
    data_conclusao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Tabela: Avaliacoes
CREATE TABLE Avaliacoes (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_disciplina INT NOT NULL,
    tipo ENUM('mensal', 'bimestral') NOT NULL,
    data_avaliacao DATE NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

-- Tabela: Notas
CREATE TABLE Notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_avaliacao INT NOT NULL,
    nota DECIMAL(5, 2) CHECK (nota BETWEEN 0 AND 10),
    recuperacao DECIMAL(5, 2) CHECK (recuperacao BETWEEN 0 AND 10),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_avaliacao) REFERENCES Avaliacoes(id_avaliacao)
);




