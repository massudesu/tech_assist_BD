create database if not exists tech_assist
character set utf8mb4
collate utf8mb4_0900_ai_ci;
use tech_assist;


create table if not exists clientes(
id_cliente int auto_increment primary key,
cli_nome varchar(100) not null,
cli_cpf char(11) not null unique,
cli_email varchar(100) not null unique,
cli_telefone char(11)
)Engine=InnoDB;


create table if not exists equipamentos(
id_equipamento int auto_increment primary key,
id_cliente int,
equ_tipo varchar(100) not null,
equ_marca varchar(100),
equ_modelo varchar(100),
equ_problema varchar(100) not null,
foreign key(id_cliente) references clientes(id_cliente) on delete cascade
)Engine=InnoDB;


create table if not exists tecnicos(
id_tecnico int auto_increment primary key,
tec_nome varchar(100) not null,
tec_especialidade varchar(100)
)engine=InnoDB;


create table if not exists servicos(
id_servico int auto_increment primary key,
id_equipamento int,
id_tecnico int,
ser_data_entrada datetime default current_timestamp,
ser_data_saida datetime,
ser_status varchar(50),
ser_valor decimal(10,2) not null,
foreign key(id_equipamento) references equipamentos(id_equipamento) on delete cascade,
foreign key(id_tecnico) references tecnicos(id_tecnico) on delete cascade
)engine=InnoDB;


create table if not exists pecas(
id_peca int auto_increment primary key,
pec_nome varchar(100) not null,
pec_quantidade int not null,
pec_preco decimal(10,2) not null
)engine=InnoDB;

insert into clientes(cli_nome, cli_cpf, cli_email, cli_telefone) values
('Nicolas','12345678901','nicolas@gmail.com','11979855463'),
('Vitor'  ,'98765432110','vitor@gmail.com'  ,'11956712374'),
('Thiago' ,'12398746505','thiago@gmail.com' ,'11937463743'),
('Lucca'  ,'09832147572','lucca@gmail.com'  ,'11903138571'),
('Ryan'   ,'92510647598','ryan@gmail.com'   ,'11983276453');

INSERT INTO equipamentos
(id_cliente, equ_tipo, equ_marca, equ_modelo, equ_problema)
VALUES
(1, 'Notebook', 'Dell', 'Inspiron 15', 'Superaquecimento'),
(2, 'Computador', 'Acer', 'Aspire TC', 'Nao liga'),
(3, 'Celular', 'Samsung', 'Galaxy A54', 'Tela quebrada'),
(4, 'Notebook', 'Lenovo', 'IdeaPad 3', 'Bateria com defeito'),
(5, 'Impressora', 'HP', 'DeskJet 2774', 'Falha na impressao'),
(1, 'Computador', 'Asus', 'ROG Strix', 'Problema na placa de video'),
(2, 'Celular', 'Motorola', 'Moto G84', 'Conector de carga danificado'),
(3, 'Notebook', 'Samsung', 'Book 2', 'Lentidao no sistema');


INSERT INTO tecnicos (tec_nome, tec_especialidade)
VALUES
('Carlos Mendes', 'Computadores'),
('Mariana Souza', 'Celulares'),
('Pedro Oliveira', 'Notebooks'),
('Ana Costa', 'Impressoras'),
('Rafael Santos', 'Hardware e placas');


INSERT INTO servicos
(id_equipamento, id_tecnico, ser_data_entrada,
 ser_data_saida, ser_status, ser_valor)
VALUES
(1, 3, '2026-09-01 09:00:00', '2026-09-03 15:00:00', 'Concluido', 250.00),
(2, 1, '2026-09-02 10:30:00', '2026-09-05 14:00:00', 'Concluido', 180.00),
(3, 2, '2026-09-04 11:00:00', NULL, 'Em andamento', 350.00),
(4, 3, '2026-09-05 08:30:00', NULL, 'Aguardando peca', 220.00),
(5, 4, '2026-09-06 13:00:00', '2026-09-08 16:00:00', 'Concluido', 120.00),
(6, 5, '2026-09-08 09:15:00', NULL, 'Em andamento', 500.00),
(7, 2, '2026-09-10 14:00:00', '2026-09-12 17:00:00', 'Concluido', 160.00),
(8, 3, '2026-09-12 10:00:00', NULL, 'Em analise', 200.00);


INSERT INTO pecas (pec_nome, pec_quantidade, pec_preco)
VALUES
('Memoria RAM 8GB', 15, 120.00),
('SSD 480GB', 10, 220.00),
('Bateria para notebook', 4, 180.00),
('Tela para celular', 8, 250.00),
('Fonte ATX 500W', 6, 190.00),
('Cabo USB', 25, 25.00);

-- 1 consulta
-- Consultar todos os serviços registrados na assistência técnica,
-- exibindo o cliente, o equipamento, o técnico responsável, o status e o valor,
-- organizando os resultados pelo ID do serviço.

SELECT
    s.id_servico,
    c.cli_nome AS cliente,
    e.equ_tipo AS equipamento,
    e.equ_marca AS marca,
    e.equ_modelo AS modelo,
    t.tec_nome AS tecnico,
    s.ser_status AS status,
    s.ser_valor AS valor
FROM servicos s
INNER JOIN equipamentos e
    ON s.id_equipamento = e.id_equipamento
INNER JOIN clientes c
    ON e.id_cliente = c.id_cliente
INNER JOIN tecnicos t
    ON s.id_tecnico = t.id_tecnico
ORDER BY s.id_servico;


-- 2 consulta
-- Consultar os serviços associados ao cliente Nicolas,
-- mostrando seus equipamentos, os técnicos responsáveis, o status e o valor,
-- ordenando os serviços pela data de entrada, do mais recente para o mais antigo.

SELECT
    c.cli_nome AS cliente,
    e.equ_tipo AS equipamento,
    e.equ_modelo AS modelo,
    s.ser_status AS status,
    t.tec_nome AS tecnico,
    s.ser_valor AS valor
FROM clientes c
INNER JOIN equipamentos e
    ON c.id_cliente = e.id_cliente
INNER JOIN servicos s
    ON e.id_equipamento = s.id_equipamento
INNER JOIN tecnicos t
    ON s.id_tecnico = t.id_tecnico
WHERE c.cli_nome = 'Nicolas'
ORDER BY s.ser_data_entrada DESC;


-- 3 consulta
-- Calcular a quantidade de serviços atribuídos a cada técnico
-- e a soma dos valores desses serviços, organizando os técnicos
-- do maior valor total para o menor.

SELECT
    t.tec_nome AS tecnico,
    t.tec_especialidade AS especialidade,
    COUNT(s.id_servico) AS quantidade_servicos,
    SUM(s.ser_valor) AS valor_total
FROM tecnicos t
INNER JOIN servicos s
    ON t.id_tecnico = s.id_tecnico
GROUP BY
    t.id_tecnico,
    t.tec_nome,
    t.tec_especialidade
ORDER BY valor_total DESC;


-- 4 consulta
-- Identificar os técnicos que possuem mais de um serviço
-- registrado, exibindo a quantidade de serviços e o valor médio cobrado
-- por atendimento, em ordem decrescente de quantidade de serviços.

SELECT
    t.tec_nome AS tecnico,
    COUNT(s.id_servico) AS quantidade_servicos,
    ROUND(AVG(s.ser_valor), 2) AS valor_medio
FROM tecnicos t
INNER JOIN servicos s
    ON t.id_tecnico = s.id_tecnico
GROUP BY t.id_tecnico, t.tec_nome
HAVING COUNT(s.id_servico) > 1
ORDER BY quantidade_servicos DESC;


-- 5 consulta
-- Consultar os serviços que estão em andamento,
-- exibindo o ID do serviço, o equipamento associado, o status atual
-- e o valor cobrado pelo reparo.

SELECT id_servico, id_equipamento, ser_status, ser_valor
FROM servicos
WHERE ser_status = 'Em andamento';


-- 6 consulta
-- Listar os equipamentos cadastrados na assistência técnica,
-- mostrando o nome de cada cliente, o tipo, a marca e o modelo do equipamento,
-- organizando os resultados em ordem alfabética pelo nome do cliente.

SELECT
    c.cli_nome,
    e.equ_tipo,
    e.equ_marca,
    e.equ_modelo
FROM clientes c
INNER JOIN equipamentos e
    ON c.id_cliente = e.id_cliente
ORDER BY c.cli_nome;


-- 7 consulta
-- Consultar os serviços e seus respectivos técnicos,
-- exibindo o nome do técnico, sua especialidade e o status de cada serviço,
-- organizando os resultados pelo ID do serviço.

SELECT
    s.id_servico,
    t.tec_nome,
    t.tec_especialidade,
    s.ser_status
FROM servicos s
INNER JOIN tecnicos t
    ON s.id_tecnico = t.id_tecnico
ORDER BY s.id_servico;


-- 8 consulta
-- Identificar quantos equipamentos cada cliente possui
-- cadastrados na assistência técnica, agrupando os resultados por cliente
-- e ordenando do maior número de equipamentos para o menor.

SELECT 
    c.cli_nome,
    COUNT(e.id_equipamento) AS quantidade_equipamentos
FROM clientes c
INNER JOIN equipamentos e
    ON c.id_cliente = e.id_cliente
GROUP BY c.id_cliente, c.cli_nome
ORDER BY quantidade_equipamentos DESC;


-- 9 consulta
-- Calcular a soma dos valores de todos os serviços
-- registrados no sistema, permitindo consultar o valor total dos serviços
-- cadastrados, independentemente do status.

SELECT SUM(ser_valor) AS valor_total_servicos
FROM servicos;


-- 10 consulta
-- Calcular o valor médio dos serviços registrados
-- na assistência técnica, arredondando o resultado para duas casas decimais.

SELECT ROUND(AVG(ser_valor), 2) AS valor_medio
FROM servicos;


-- 11 consulta
-- Localizar os serviços relacionados a notebooks
-- que apresentam problemas cuja descrição contém as palavras
-- "defeito" ou "Lentidao", exibindo o cliente, o equipamento,
-- o problema relatado, o técnico responsável e o status do serviço.

SELECT
    c.cli_nome AS cliente,
    e.equ_marca AS marca,
    e.equ_modelo AS modelo,
    e.equ_problema AS problema,
    t.tec_nome AS tecnico,
    s.ser_status AS status
FROM clientes c
INNER JOIN equipamentos e
    ON c.id_cliente = e.id_cliente
INNER JOIN servicos s
    ON e.id_equipamento = s.id_equipamento
INNER JOIN tecnicos t
    ON s.id_tecnico = t.id_tecnico
WHERE e.equ_tipo = 'Notebook'
  AND (
      e.equ_problema LIKE '%defeito%'
      OR e.equ_problema LIKE '%Lentidao%'
  )
ORDER BY c.cli_nome;


-- 12 consulta
-- Calcular o valor total do estoque de peças da empresa,
-- multiplicando a quantidade disponível pelo preço unitário de cada peça
-- e somando os resultados para estimar o valor financeiro do estoque.

SELECT
    SUM(pec_quantidade * pec_preco) AS valor_total_estoque
FROM pecas;


-- 13 consulta
-- Listar os serviços com valor superior a R$ 200,00,
-- exibindo o ID, o valor cobrado e o status, organizando os resultados
-- do serviço mais caro para o mais barato.

SELECT id_servico, ser_valor, ser_status
FROM servicos
WHERE ser_valor > 200
ORDER BY ser_valor DESC;


-- 14 consulta
-- Contabilizar quantos serviços existem em cada status,
-- permitindo que a gerência visualize a quantidade de serviços concluídos,
-- em andamento, aguardando peças ou em análise, ordenando os status
-- pela maior quantidade de registros.

SELECT
    ser_status,
    COUNT(*) AS quantidade
FROM servicos
GROUP BY ser_status
ORDER BY quantidade DESC;


-- 15 consulta
-- Consultar os serviços que já foram concluídos,
-- exibindo o ID do serviço, a data de saída e o valor cobrado,
-- organizando os resultados pela data de conclusão, da mais antiga
-- para a mais recente.

SELECT
    id_servico,
    ser_data_saida,
    ser_valor
FROM servicos
WHERE ser_status = 'Concluido'
ORDER BY ser_data_saida ASC;