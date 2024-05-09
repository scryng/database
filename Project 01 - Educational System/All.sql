-- #######################################
-- COMANDOS DDL - DATA DEFINITION LANGUAGE
-- #######################################

-- Cria a tabela de Estudantes
CREATE TABLE Students (
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(15) UNIQUE,
    name VARCHAR(100),
    age INT,
    street TEXT,
    number VARCHAR(10),
    neighborhood VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(20),
    zipcode INT,
    country VARCHAR(50)
);

-- Cria a tabela de Telefones
CREATE TABLE Telephones (
    id_stud INT REFERENCES Students(id),
    countrycode INT,
    ddd INT,
    number INT
);

-- Cria a tabela de Emails
CREATE TABLE Emails (
    id_stud INT REFERENCES Students(id),
    username VARCHAR(64) NOT NULL,
    domain VARCHAR(255) NOT NULL
);

-- Cria a tabela de Departamentos
CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Cria a tabela de Cursos
CREATE TABLE Courses (
    id SERIAL PRIMARY KEY,
    acronym VARCHAR(5),
    name VARCHAR(100) NOT NULL,
    id_depa INT REFERENCES Departments(id)
);

-- Cria a tabela de Matrículas
CREATE TABLE Records (
    sr SERIAL PRIMARY KEY,
    id_stud INT REFERENCES Students(id),
    status VARCHAR(7) NOT NULL,
    id_cour INT REFERENCES Courses(id)
);

-- Cria a tabela de Disciplinas
CREATE TABLE Disciplines (
    id SERIAL PRIMARY KEY,
    acronym VARCHAR(5),
    name VARCHAR(50) NOT NULL,
    required BOOLEAN
);

-- Cria a tabela de Reco_Disc
CREATE TABLE Reco_Disc (
    sr INT REFERENCES Records(sr),
    id_disc INT REFERENCES Disciplines(id)
);

-- Cria a tabela Cour_Disc
CREATE TABLE Cour_Disc (
    id_cour INT REFERENCES Courses(id),
    id_disc INT REFERENCES Disciplines(id)
);

-- #######################################
-- COMANDOS DML - DATA MANIPULATION LANGUAGE
-- #######################################

-- Visualiza a tabela de Estudantes
SELECT * FROM Students
-- Visualiza a tabela de Telefones
SELECT * FROM Telephones
-- Visualiza a tabela de Emails
SELECT * FROM Emails
-- Visualiza a tabela de Departamentos
SELECT * FROM Departments
-- Visualiza a tabela de Cursos
SELECT * FROM Courses
-- Visualiza a tabela de Matrículas
SELECT * FROM Records
-- Visualiza a tabela de Disciplinas
SELECT * FROM Disciplines
-- Visualiza a tabela de Matricula_Disciplinas
SELECT * FROM Reco_Disc
-- Visualiza a tabela de Cursos_Disciplinas
SELECT * FROM Cour_Disc

-- Cadastrar novos Estudantes
INSERT INTO Students (cpf, name, age, street, number, neighborhood, city, state, zipcode, country)
VALUES
    ('826.584.392-15', 'Calabreso Mussarelo', 22, 'Rua das Flores', '123', 'Jardim Saira', 'Sorocaba', 'SP', 22460000, 'Brasil'),
    ('745.983.162-58', 'Mustango Trembolono', 29, 'Av. Paulista', '1000', 'Alto da Boa Vista', 'Sorocaba', 'SP', 01310000, 'Brasil'),
    ('391.758.426-83', 'Franzino Tanguinho', 31, 'Rua Augusta', '400', 'Jardim Gonçalves', 'Sorocaba', 'SP', 01304000, 'Brasil'),
    ('263.948.571-92', 'Vamola Pessoal', 25, 'Av. Presidente Vargas', '500', 'Jardim Gonçalves', 'Sorocaba', 'SP', 20071002, 'Brasil'),
    ('538.172.649-15', 'Arreide Baite', 34, 'Av. Rio Branco', '150', 'Jardim dos Estados', 'Sorocaba', 'SP', 20040007, 'Brasil'),
    ('940.286.315-72', 'Bolo de Cenouro', 28, 'Av. Copacabana', '200', 'Jardim Europa', 'Sorocaba', 'SP', 22020010, 'Brasil'),
    ('821.753.694-02', 'Java Scripto', 23, 'Rua Oscar Freire', '789', 'Centro', 'Sorocaba', 'SP', 05409000, 'Brasil'),
    ('190.372.586-41', 'Salga Dacantina', 35, 'Rua XV de Novembro', '12', 'Centro', 'Sorocaba', 'SP', 80020000, 'Brasil'),
    ('265.917.483-02', 'Jagua Tirico', 27, 'Av. Brigadeiro Faria Lima', '500', 'Jardim Santa Rosália', 'Sorocaba', 'SP', 04538000, 'Brasil'),
    ('548.216.739-50', 'Cafedo Nicolas', 30, 'Rua da Consolação', '250', 'Jardim Iguatemi', 'Sorocaba', 'SP', 01302200, 'Brasil'),
    ('102.938.475-61', 'Karça Senai', 24, 'Rua Frei Caneca', '100', 'Jardim Iguatemi', 'Sorocaba', 'SP', 01307000, 'Brasil'),
    ('847.593.162-04', 'Juan do Verde', 21, 'Rua Dias Ferreira', '10', 'Jardim Campolim', 'Sorocaba', 'SP', 22431070, 'Brasil'),
    ('674.839.251-78', 'Franka Neda', 26, 'Rua Gonçalo de Carvalho', '55', 'Jardim Campolim', 'Sorocaba', 'SP', 90570060, 'Brasil'),
    ('392.857.463-01', 'Gece Peto', 33, 'Rua Djan Madruga', '555', 'Jardim Campolim', 'Sorocaba', 'SP', 22630020, 'Brasil'),
    ('547.193.826-50', 'Buenas Tardes', 32, 'Rua Faria', '999', 'Jardim Campolim', 'Sorocaba', 'SP', 01002000, 'Brasil'),
    ('261.947.830-15', 'Tran Kilo', 27, 'Avenida Brasil', '1500', 'Jardim Campolim', 'Sorocaba', 'SP', 24040002, 'Brasil'),
    ('819.273.645-20', 'Usua Riodosuco', 24, 'Av. Itavuvu', '800', 'Jardim Sao Bento', 'Sorocaba', 'SP', 18087140, 'Brasil'),
    ('501.827.369-54', 'Forde Sql', 27, 'Av. General Osório', '1000', 'Vila Santana', 'Sorocaba', 'SP', 18045000, 'Brasil'),
    ('362.184.709-53', 'Bolo do Senai', 31, 'Rua João Wagner Wey', '150', 'Itararé', 'Alumínio', 'SP', 18055680, 'Brasil'),
    ('472.819.305-61', 'Naopaga Aapm', 28, 'Rua São Bento', '50', 'Itararé', 'Alumínio', 'SP', 18035400, 'Brasil'),
    ('333.209.350-11', 'Mul Tamoral', 32, 'Rua Sete de Setembro', '300', 'Rio Acima', 'Votorantim', 'SP', 18015800, 'Brasil'),
    ('400.289.220-00', 'Anima Festa', 26, 'Rua Antônio Raposo Tavares', '200', 'Rio Acima', 'Votorantim', 'SP', 18025100, 'Brasil')
;

-- Cadastrar novos Telefones
INSERT INTO Telephones (id_stud, countrycode, ddd, number)
VALUES 
    (1, 55, 15, 997560123),
    (2, 55, 15, 998321074),
    (3, 55, 15, 996485930),
    (4, 55, 15, 997438159),
    (5, 55, 15, 999276410),
    (6, 55, 15, 993948526),
    (7, 55, 15, 995821034),
    (8, 55, 15, 997320184),
    (9, 55, 15, 991483657),
    (10, 55, 15, 996953124),
    (11, 55, 15, 998327651),
    (12, 55, 15, 992916470),
    (13, 55, 15, 997638291),
    (14, 55, 15, 995407382),
    (15, 55, 15, 993182650),
    (16, 55, 15, 997346520),
    (17, 55, 15, 998201463),
    (18, 55, 15, 991067534),
    (19, 55, 15, 992758093),
    (20, 55, 15, 998436752),
    (21, 55, 15, 991035862),
    (22, 55, 15, 992184309)
;

-- Cadastrar novos Emails
INSERT INTO Emails (id_stud, username, domain)
VALUES 
    (1, 'calabreso.mussarelo', '@gmail.com'),
    (2, 'mustango.trembolono', '@gmail.com'),
    (3, 'franzino.tanguinho', '@hotmail.com'),
    (4, 'vamola.pessoal', '@hotmail.com'),
    (5, 'arreide.baite', '@hotmail.com'),
    (6, 'bolo.de.cenouro', '@hotmail.com'),
    (7, 'java.scripto', '@outlook.com'),
    (8, 'salga.dacantina', '@outlook.com'),
    (9, 'jagua.tirico', '@outlook.com'),
    (10, 'cafedo.nicolas', '@outlook.com'),
    (11, 'karca.senai', '@gmail.com'),
    (12, 'juan.do.verde', '@gmail.com'),
    (13, 'franka.neda', '@gmail.com'),
    (14, 'gece.peto', '@gmail.com'),
    (15, 'buenas.tardes', '@gmail.com'),
    (16, 'tran.kilo', '@yahoo.com'),
    (17, 'usua.riodosuco', '@yahoo.com'),
    (18, 'forde.sql', '@yahoo.com'),
    (19, 'bolo.do.senai', '@gmail.com'),
    (20, 'naopaga.aapm', '@gmail.com'),
    (21, 'mul.tamoral', '@gmail.com'),
    (22, 'anima.festa', '@gmail.com')
;

-- Cadastrar novos Departamentos
INSERT INTO Departments (name)
VALUES
    ('Saúde'),
    ('Tecnologia'),
    ('Engenharia'),
    ('Humanas')
;

-- Cadastrar novos Cursos
INSERT INTO Courses (acronym, name, id_depa)
VALUES
    ('TADS', 'Tecnologo em Análise e Desenvolvimento de Sistemas', 2),
    ('TMI', 'Tecnologo em Mecatrônica Industrial', 2)
;

-- Cadastrar novas Disciplinas
INSERT INTO Disciplines (acronym, name, required)
VALUES
    ('AI', 'Automação Industrial', true),
    ('PII', 'Projeto Integrador Interdisciplinar I', true),
    ('DW', 'Desenvolvimento Web', true),
    ('BD', 'Banco de Dados', true),
    ('LP', 'Linguagem de Programação', true),
    ('CD', 'Ciência de Dados', true),

    ('MC', 'Metodologia Científica', true),

    ('CTM', 'Ciência e Tecnologia Materiais', true),
    ('CAL', 'Cálculo', true),
    ('DAC', 'Desenho Aux. por Computador', true),
    ('ELE', 'Eletricidade', true),
    ('MET', 'Metrologia', true),
    ('PI', 'Projeto Integrador', true)
;

-- Cadastrar novas Matrículas
INSERT INTO Records (id_stud, status, id_cour)
VALUES
    (1, 'Ativo', 1),
    (2, 'Ativo', 1),
    (3, 'Ativo', 1),
    (4, 'Ativo', 1),
    (5, 'Ativo', 1),
    (6, 'Ativo', 1),
    (7, 'Ativo', 1),
    (8, 'Ativo', 1),
    (9, 'Ativo', 1),
    (10, 'Ativo', 1),
    (11, 'Ativo', 1),
    (12, 'Ativo', 2),
    (13, 'Ativo', 2),
    (14, 'Ativo', 2),
    (15, 'Ativo', 2),
    (16, 'Ativo', 2),
    (17, 'Ativo', 2),
    (18, 'Ativo', 2),
    (19, 'Ativo', 2),
    (20, 'Ativo', 2),
    (21, 'Ativo', 2),
    (22, 'Ativo', 2)
;

-- Cadastrar novas relações entre Curso e Disciplina
INSERT INTO Cour_Disc (id_cour, id_disc)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),

    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (2, 12),
    (2, 13)
;

-- Cadastrar novas relações entre Matrículas e Disciplina
INSERT INTO Reco_Disc (sr, id_disc)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),

    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),

    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 6),
    (3, 7),

    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4),
    (4, 5),
    (4, 6),
    (4, 7),

    (5, 1),
    (5, 2),
    (5, 3),
    (5, 4),
    (5, 5),
    (5, 6),
    (5, 7),

    (6, 1),
    (6, 2),
    (6, 3),
    (6, 4),
    (6, 5),
    (6, 6),
    (6, 7),

    (7, 1),
    (7, 2),
    (7, 3),
    (7, 4),
    (7, 5),
    (7, 6),
    (7, 7),

    (8, 1),
    (8, 2),
    (8, 3),
    (8, 4),
    (8, 5),
    (8, 6),
    (8, 7),

    (9, 1),
    (9, 2),
    (9, 3),
    (9, 4),
    (9, 5),
    (9, 6),
    (9, 7),

    (10, 1),
    (10, 2),
    (10, 3),
    (10, 4),
    (10, 5),
    (10, 6),
    (10, 7),

    (11, 1),
    (11, 2),
    (11, 3),
    (11, 4),
    (11, 5),
    (11, 6),
    (11, 7),

    (12, 7),
    (12, 8),
    (12, 9),
    (12, 10),
    (12, 11),
    (12, 12),
    (12, 13),

    (13, 7),
    (13, 8),
    (13, 9),
    (13, 10),
    (13, 11),
    (13, 12),
    (13, 13),

    (14, 7),
    (14, 8),
    (14, 9),
    (14, 10),
    (14, 11),
    (14, 12),
    (14, 13),

    (15, 7),
    (15, 8),
    (15, 9),
    (15, 10),
    (15, 11),
    (15, 12),
    (15, 13),

    (16, 7),
    (16, 8),
    (16, 9),
    (16, 10),
    (16, 11),
    (16, 12),
    (16, 13),

    (17, 7),
    (17, 8),
    (17, 9),
    (17, 10),
    (17, 11),
    (17, 12),
    (17, 13),

    (18, 7),
    (18, 8),
    (18, 9),
    (18, 10),
    (18, 11),
    (18, 12),
    (18, 13),

    (19, 7),
    (19, 8),
    (19, 9),
    (19, 10),
    (19, 11),
    (19, 12),
    (19, 13),

    (20, 7),
    (20, 8),
    (20, 9),
    (20, 10),
    (20, 11),
    (20, 12),
    (20, 13),

    (21, 7),
    (21, 8),
    (21, 9),
    (21, 10),
    (21, 11),
    (21, 12),
    (21, 13),

    (22, 7),
    (22, 8),
    (22, 9),
    (22, 10),
    (22, 11),
    (22, 12),
    (22, 13)
;

-- #######
-- QUERIES
-- #######

-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT
    r.sr,
    s.id,
    s.cpf,
    s.name,
    s.age,
    s.street,
    s.number AS street_number,
    s.neighborhood,
    s.city,
    s.state,
    s.zipcode,
    s.country,
    t.countrycode,
    t.ddd,
    t.number,
    e.username AS email_username,
    e.domain AS email_domain
FROM
    Students s
LEFT JOIN Telephones t ON s.id = t.id_stud
LEFT JOIN Emails e ON s.id = e.id_stud
LEFT JOIN Records r ON s.id = r.id_stud
WHERE
    r.sr = 1;

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT
    c.acronym,
    c.name
FROM Departments d
LEFT JOIN Courses c ON d.id = c.id_depa
WHERE
    d.name = 'Tecnologia';

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT
    c.acronym,
    c.name
FROM Disciplines d
LEFT JOIN Cour_Disc cd ON d.id = cd.id_disc
LEFT JOIN Courses c ON c.id = cd.id_cour
WHERE
    d.name = 'Metodologia Científica';

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT
    d.acronym,
    d.name
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
JOIN
    Reco_Disc rd ON r.sr = rd.sr
JOIN
    Disciplines d ON rd.id_disc = d.id
WHERE
    s.cpf = '548.216.739-50';

-- Filtrar todos os alunos matriculados em um determinado curso.
SELECT
    s.name,
    c.acronym
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
JOIN
    Courses c ON r.id_cour = c.id
WHERE
    c.acronym = 'TADS';

-- Filtrar todos os alunos matriculados em determinada disciplina.
SELECT
    s.name,
    d.name
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
JOIN
    Courses c ON r.id_cour = c.id
JOIN
    Cour_Disc cd ON c.id = cd.id_cour
JOIN
    Disciplines d ON cd.id_disc = d.id
WHERE
    d.name = 'Metodologia Científica';

-- Filtrar alunos formados.
SELECT
    s.name
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
WHERE
    r.status = 'Formado';

-- Filtrar alunos ativos.
SELECT
    s.name
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
WHERE
    r.status = 'Ativo';

-- Apresentar a quantidade de alunos ativos por curso.
SELECT COUNT (s.name)
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
JOIN
    Courses c ON r.id_cour = c.id
WHERE
    c.acronym = 'TADS' AND r.status = 'Ativo';

-- Apresentar a quantidade de alunos ativos por disciplina.
SELECT COUNT (s.name)
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
JOIN
    Courses c ON r.id_cour = c.id
JOIN
    Cour_Disc cd ON c.id = cd.id_cour
JOIN
    Disciplines d ON cd.id_disc = d.id
WHERE
    d.name = 'Metodologia Científica' AND r.status = 'Ativo';