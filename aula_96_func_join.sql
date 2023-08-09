CREATE DATABASE senai_tech;

USE senai_tech;

CREATE TABLE departamentos (
    id INT,
    nome VARCHAR(60),
    PRIMARY KEY(id)
    
);

CREATE TABLE funcionarios (
   id INT,
   nome VARCHAR(60),
   sobrenome VARCHAR(60),
   salario DECIMAL(10,2),
   id_departamento INT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_departamento)
   REFERENCES departamentos (id)
   
   );
   
   drop table departamento;
   drop table funcionarios;
   
   select * from funcionarios;
  --  Lista nome, sobrenome e nome do departamento dos funcionários.
   select f.nome, f.sobrenome, d.nome as nome_departamento
   from funcionarios f
   inner join departamentos d
   on f.id_departamento = d.id;
 
 -- Lista nome, sobrenome e nome do departamento dos funcionários do
-- departamentos de TI
select f.nome, f.sobrenome, d.nome as nome_departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id
where d.nome = 'TI';
 

-- lista nome,sobrenome,salario e nome do departamento dos funcionarios de TI que recebem acima de 5000 ordenado pelo nome
select f.nome, f.sobrenome, d.nome as nome_departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id
where d.nome = 'TI' and f.salario>5000
order by f.nome;

-- calcula a media salarial dos funcionarios em cada departamento
  select d.nome, avg(f.salario) as media_salarial
  from funcionarios f
  inner join departamentos d on f.id_departamento =d.id
  group by d.id;
  -- Mostrar o nome completo (concatenando nome e sobrenome) dos
-- funcionários que pertencem ao departamento "TI":
   SELECT CONCAT(f.nome, ' ',f.sobrenome ) AS nome_completo
   FROM funcionarios f
   INNER JOIN departamentos d ON f.id_departamento=d.id
   WHERE d.nome= 'TI';
   
-- Calcula a soma total dos salários de todos os funcionários no departamento de "Recursos
-- humanos
select d.nome, sum(f.salario) as soma_salarial
from funcionarios f
inner join departamentos d on f.id_departamento =d.id
where d.nome='Recursos HUmanos';
  
-- Conta quantos funcionários cada departamento possui
select count(*) as numero_funcionarios
from funcionarios f
inner join departamentos d on f.id_departamento =d.id
group by d.id;

-- Lista os funcionários que ganham mais de 7000 em ordem alfabética
select nome,sobrenome,salario
from funcionarios 
where salario > 7000
order by nome;

-- mostra o nome e a media salarial dos funcionarios de cada departamento
select d.nome,avg(f.salario) as media_salarial
from funcionarios f
inner join departamentos d on f.id_departamento =  d.id
group by d.id;

-- mostra os funcionarios com o sobrenome matisse
select CONCAT(f.nome, ' ', f.sobrenome) as nome_completo, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where f. sobrenome='Matisse';
