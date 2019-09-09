create database farmacia;
use farmacia;
create table tb_produto 
(id_produto int not null auto_increment primary key,
 nm_produto varchar(45) not null,
 vl_produto decimal(8,2) not null,
 qt_estoque int not null, 
 st_ativo char(1) not null);

 create table tb_cliente 
(id_cliente int not null auto_increment primary key,
 nm_cliente varchar(45) not null,
 cpf_cliente varchar(14) not null,
 dt_nascimento date not null, 
 rg_cliente varchar(12) not null,
 st_ativo char(1) not null);

 create table tb_tipo_pagamento 
(id_tp_pagamento int not null auto_increment primary key,
 nm_tp_pagamento varchar(20) not null,
 st_ativo char(1) not null);

 create table tb_venda
(id_venda int not null auto_increment primary key,
 dt_venda datetime not null, 
 id_cliente int null ,
 tp_pagamento int not null,
 CONSTRAINT ligacao_tb_venda_tb_tp_pagamento
 FOREIGN KEY (tp_pagamento)
 REFERENCES tb_tipo_pagamento (id_tp_pagamento));

 create table tb_item_venda
(id_item_venda int not null auto_increment primary key,
 id_produto int not null, 
 qt_vendida int null ,
 vl_produto decimal(8,2) not null,
 id_venda int not null,
 CONSTRAINT ligacao_tb_produto_tb_item_venda
 FOREIGN KEY (id_produto)
 REFERENCES tb_produto (id_produto),
 CONSTRAINT ligacao_tb_venda_tb_item_venda
 FOREIGN KEY (id_venda)
 REFERENCES tb_venda (id_venda));

 create table tb_telefone_cliente
(id_tel_cliente int not null auto_increment primary key,
 id_cliente int null ,
 tel_cliente varchar(15) not null,
 CONSTRAINT ligacao_tb_cliente_tb_telefone_cliente
 FOREIGN KEY (id_cliente)
 REFERENCES tb_cliente (id_cliente));
 use farmacia;

INSERT INTO tb_produto (nm_produto, vl_produto, qt_estoque, st_ativo)
VALUES
('Merthiolate 30ml', 16.49, 50, 'S'), ('Dorflex Envelope Com 10 Comprimidos',5.00,126 , 'S'),
('Sabonete Liquido Dove Baby 200ml',13.64 ,37 , 'S'), ('Xylocaina Pomada 25g',20.75 ,23 , 'S'),
('Protetor Solar Episol COlor Extra Clara Fps70', 90.29, 17, 'S'), ('Locerul 50mg 2,5 ml Esmalte Antimicotico',100.33 ,7 , 'S');

INSERT INTO tb_cliente (nm_cliente, cpf_cliente, dt_nascimento, rg_cliente, st_ativo)
VALUES
('Ailton Cruz','111.222.333-44','2001-06-13','16.878.023-5','S'), ('Maria da Conceição','999.888.777-66','1996-11-03','23.105.701-3','S'),
('Josinilda Silva','555.666.111-00','2004-03-28','27.909.101','S'), ('João José Antônio Arantes','100.200.300-40','2007-09-16','21.111.111-1','S'),
('Tárcio Telles','900.800.700-60','1981-05-23','26.800.343','S');

INSERT INTO tb_tipo_pagamento (nm_tp_pagamento, st_ativo)
VALUES ('Dinheiro','S'), ('Cheque','S'), ('Cartão Débito', 'S'), ('Cartão Crédio', 'S');

INSERT INTO tb_telefone_cliente (id_cliente, tel_cliente)
VALUES (1, '(11) 3456-1111'),(1,'(11) 91234-5678'),(2, '(11) 99999-1111'),(3, '(19) 3775-6091'),(3, '(19) 98888-2020'),
               (4, '(11) 98765-4321'),(5, '(19) 12345-6789');

INSERT INTO tb_venda (dt_venda, id_cliente, tp_pagamento)
VALUES ('2019-08-02',1,1), ('2019-08-07',3,4),('2019-08-07',5,1),('2019-08-19',1,2),('2019-08-19',4,2);

INSERT INTO tb_item_venda (id_produto, qt_vendida, vl_produto, id_venda)
VALUES (1,2,16.49,1),(3,3,13.64,1),(5,1,90.29,1),(2,10,5.00,2),(2,2,5.00,3),(6,1,100.33,3),(4,1,20.75,4), (5,2,90.29,5), (2,6,5.00,5);

SELECT* FROM TB_CLIENTE;
UPDATE TB_CLIENTE
SET RG_CLIENTE='2.999.888-X'
WHERE ID_CLIENTE=4;

UPDATE TB_CLIENTE
SET NM_CLIENTE='JOSINALDO SILVA', DT_NASCIMENTO='1994-03-28'
WHERE ID_CLIENTE=3;

SELECT* FROM TB_TIPO_PAGAMENTO;
UPDATE TB_TIPO_PAGAMENTO
SET ST_ATIVO='N'
WHERE ID_TP_PAGAMENTO=2;

SELECT* FROM TB_CLIENTE;
SELECT* FROM TB_VENDA;

UPDATE TB_ITEM_VENDA
SET QT_VENDIDA=10
WHERE ID_CLIENTE=1 AND ID_PRODUTO=5;


SELECT * FROM TB_ITEM_VENDA;

SELECT * FROM TB_VENDA
WHERE ID_CLIENTE = 4  AND DT_VENDA = '2019-08-19';


SELECT * FROM TB_ITEM_VENDA, TB_VENDA WHERE ID_CLIENTE = 4;   


SELECT * FROM TB_PRODUTO, TB_ITEM_VENDA;

SELECT * FROM TB_TELEFONE_CLIENTE WHERE ID_CLIENTE=3 AND TEL_CLIENTE='(19) 98888-2020';

DELETE FROM TB_TELEFONE_CLIENTE WHERE ID_TEL_CLIENTE= 4;

SELECT * FROM TB_CLIENTE WHERE DT_NASCIMENTO < '2000-01-01';

CREATE TABLE TB_FORNECEDOR(
ID_FORNECEDOR int not null auto_increment primary key,
NM_FORNECEDOR VARCHAR(45) not null,
CNPJ varchar(45) not null,
ST_ativo char(1) not null);

create table tb_compra(
ID_compra int not null auto_increment primary key,
dt_compra date not null,
ID_fornecedor int null,
tp_pagamento char(1)not null,
 CONSTRAINT ligacao_tb_fornecedor_tb_compra
 FOREIGN KEY (ID_fornecedor)
 REFERENCES tb_fornecedor (id_fornecedor));
 
 create table tb_item_compra(
 id_item_compra int not null auto_increment primary key,
 ID_produto int not null,
 QT_comprada int not null,
 VL_produto decimal(8,2) not null,
 ID_COMPRA int not null,
 
 CONSTRAINT ligacao_tb_ITEM_COMPRA_tb_compra
 FOREIGN KEY (ID_compra)
 REFERENCES tb_compra (id_compra),
 
 CONSTRAINT ligacao_tb_produto_tb_item_compra
 FOREIGN KEY (ID_PRODUTO)
 REFERENCES tb_produto (id_produto));
 
 insert into TB_FORNECEDOR  values(0, 'Fornece Tudo S/A', '01.747.007/0001-34','S');
 insert into TB_FORNECEDOR values (0, 'Vem Que Tem', '21.881.745/0001-87', 'S');
 insert into TB_FORNECEDOR values (0, 'Conte Comigo S/A', '21.881.217/0001-28', 'S');
 
 
 SELECT * FROM TB_FORNECEDOR;
 
 DELETE FROM TB_FORNECEDOR WHERE (id_FORNECEDOR = 3);

 

select * from tb_compra;


select * from tb_item_compra;
INSERT INTO TB_COMPRA VALUES







