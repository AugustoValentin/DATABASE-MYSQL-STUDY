create database comercio;
use comercio;

CREATE TABLE Vendas (
ID int auto_increment Primary Key,
Nome_Vendedor Varchar(20),
Quantidade Int,
Produto Varchar(20),
Cidade Varchar(20)
);

INSERT INTO Vendas (Nome_Vendedor, Quantidade, Produto, Cidade)
  VALUES
('Jorge',1400,'Mouse','São Paulo'),
('Tatiana',1220,'Teclado','São Paulo'),
('Ana',1700,'Teclado','Rio de Janeiro'),
('Rita',2120,'Webcam','Recife'),
('Marcos',980,'Mouse','São Paulo'),
('Carla',1120,'Webcam','Recife'),
('Roberto',3145,'Mouse','São Paulo'),
('Rita',1000,'Webcam','São Paulo'),
('Roberto',156,'Mouse','Recife'),
('Tatiana',56,'Mouse','São Paulo'),
('Rita',143,'Teclado','Porto Alegre'),
('Marcos',300,'Mouse','Porto Alegre'),
('Marcos',53,'Teclado','Rio de Janeiro'),
('Roberto',100,'Mouse','São Paulo'),
('Carla',120,'Teclado','Recife'),
('Ana',184,'Teclado','Rio de Janeiro');

select * from vendas;
SELECT nome_vendedor, SUM(quantidade) FROM Vendas GROUP BY nome_vendedor; 
SELECT produto, nome_vendedor, SUM(quantidade) FROM vendas GROUP BY produto, nome_vendedor with rollup ORDER BY produto, nome_vendedor; 
SELECT produto, SUM(quantidade) FROM vendas GROUP BY produto with rollup; 

SELECT produto, nome_vendedor, SUM(quantidade), if(nome_vendedor ='Jorge', 'JG', 'jf') FROM vendas GROUP BY produto, nome_vendedor  ORDER BY produto, nome_vendedor;  

