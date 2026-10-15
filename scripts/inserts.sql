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