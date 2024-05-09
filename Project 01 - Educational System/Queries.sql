-- ####################################################
-- COMANDOS DML - DATA MANIPULATION LANGUAGE -> QUERIES
-- ####################################################


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
    r.sr = 1
;

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT
    c.acronym,
    c.name
FROM Departments d
LEFT JOIN Courses c ON d.id = c.id_depa
WHERE
    d.name = 'Tecnologia'
;

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT
    c.acronym,
    c.name
FROM Disciplines d
LEFT JOIN Cour_Disc cd ON d.id = cd.id_disc
LEFT JOIN Courses c ON c.id = cd.id_cour
WHERE
    d.name = 'Metodologia Científica'
;

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
    s.cpf = '548.216.739-50'
;

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
    c.acronym = 'TADS'
;

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
    d.name = 'Metodologia Científica'
;

-- Filtrar alunos formados.
SELECT
    s.name
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
WHERE
    r.status = 'Formado'
;

-- Filtrar alunos ativos.
SELECT
    s.name
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
WHERE
    r.status = 'Ativo'
;

-- Apresentar a quantidade de alunos ativos por curso.
SELECT COUNT (s.name)
FROM
    Students s
JOIN
    Records r ON s.id = r.id_stud
JOIN
    Courses c ON r.id_cour = c.id
WHERE
    c.acronym = 'TADS' AND r.status = 'Ativo'
;

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
    d.name = 'Metodologia Científica' AND r.status = 'Ativo'
;