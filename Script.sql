create database db_revenda_gustavoenrique;

create table cliente (
id_cliente serial primary key,
nome varchar(50) not null,
telefone varchar(15) not null,
email varchar(100) not null,
endereco_id int not null,
foreign key (endereco_id) references endereco (id_endereco)
);

CREATE TABLE cartas (
id_carta serial primary key,
nome VARCHAR(100) not null,
raridade varchar(100) not null,
descricao TEXT,
preco numeric(10, 2) not null
);

create table endereco (
id_endereco serial primary key,
cep char(8) not null,
estado varchar (50) not null,
cidade varchar (50) not null,
bairro varchar (50) not null,
rua varchar (50) not null,
numero varchar (50) not null,
complemento varchar (50),
endereco_entrega boolean not null
);


CREATE TABLE pedidos (
id_pedido serial primary key,
id_cliente int not null,
endereco_id int not null,
data_pedido timestamp default now(),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (endereco_id) references endereco(id_endereco)
);


CREATE TABLE cartas_pedidos (
id_pedido int not null,
id_carta int not null,
quantidade int not null,
primary key (id_pedido, id_carta),
foreign key (id_pedido) references pedidos(id_pedido),
foreign key (id_carta) references cartas(id_carta)
);

create table pagamentos (
id_pagamento serial primary key,
tipo varchar(50) not null,
foreign key (id_pagamento) references cliente (id_cliente)
);

INSERT INTO endereco (cep, estado, cidade, bairro, rua, numero, complemento, endereco_entrega) VALUES
('01001000', 'SP', 'São Paulo', 'Centro', 'Rua Augusta', '1000', 'Apto 101', true),
('20040002', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', '150', NULL, true),
('30140071', 'MG', 'Belo Horizonte', 'Savassi', 'Rua da Bahia', '200', 'Casa', false),
('40010020', 'BA', 'Salvador', 'Barra', 'Rua Chile', '50', NULL, true),
('70040900', 'DF', 'Brasília', 'Asa Sul', 'CLS 214', '75', 'Bloco B', false),
('80010010', 'PR', 'Curitiba', 'Batel', 'Rua Pasteur', '222', NULL, true),
('60040020', 'CE', 'Fortaleza', 'Meireles', 'Avenida Beira Mar', '300', 'Ap 202', true),
('58040010', 'PB', 'João Pessoa', 'Tambaú', 'Rua das Trincheiras', '100', NULL, false),
('88010005', 'SC', 'Florianópolis', 'Centro', 'Rua Felipe Schmidt', '123', 'Sala 3', true),
('50010040', 'PE', 'Recife', 'Boa Viagem', 'Rua dos Navegantes', '450', NULL, true);

INSERT INTO cliente (nome, telefone, email, endereco_id) VALUES
('Alice Santos', '11987654321', 'alice.santos@email.com', 1),
('Bruno Oliveira', '21999887766', 'bruno.oliveira@email.com', 2),
('Carla Pereira', '31991234567', 'carla.pereira@email.com', 3),
('Daniel Lima', '71998765432', 'daniel.lima@email.com', 4),
('Eduarda Gomes', '61999998888', 'eduarda.gomes@email.com', 5),
('Felipe Rocha', '41988776655', 'felipe.rocha@email.com', 6),
('Gabriela Alves', '85999887744', 'gabriela.alves@email.com', 7),
('Henrique Souza', '83998877663', 'henrique.souza@email.com', 8),
('Isabela Martins', '47997665544', 'isabela.martins@email.com', 9),
('João Fernandes', '81995544332', 'joao.fernandes@email.com', 10);

INSERT INTO cartas (nome, raridade, descricao, preco) VALUES
('Venusaur', 'Rara', 'Pokémon planta com grandes habilidades de ataque.', 110.00),
('Blastoise', 'Rara', 'Pokémon água com poderosa concha protetora.', 115.50),
('Pidgeot', 'Comum', 'Pokémon voador rápido e ágil.', 20.00),
('Alakazam', 'Muito Rara', 'Pokémon psíquico com inteligência elevada.', 180.00),
('Machamp', 'Rara', 'Pokémon lutador com força imensa.', 95.00),
('Gengar', 'Muito Rara', 'Pokémon fantasma que assombra seus adversários.', 140.00),
('Onix', 'Comum', 'Pokémon pedra com corpo serpente.', 30.00),
('Dragonite', 'Muito Rara', 'Pokémon dragão com grande poder e velocidade.', 220.00),
('Magikarp', 'Comum', 'Pokémon fraco mas com potencial evolutivo.', 5.00),
('Jolteon', 'Rara', 'Pokémon elétrico com ataques rápidos.', 85.00);

INSERT INTO pedidos (id_cliente, endereco_id, data_pedido) VALUES
(1, 1, '2025-09-01 10:00:00'),
(2, 2, '2025-09-01 11:15:00'),
(3, 3, '2025-09-02 09:30:00'),
(4, 4, '2025-09-02 14:45:00'),
(5, 5, '2025-09-03 16:00:00'),
(6, 6, '2025-09-04 08:20:00'),
(7, 7, '2025-09-05 12:00:00'),
(8, 8, '2025-09-05 13:30:00'),
(9, 9, '2025-09-06 15:15:00'),
(10, 10, '2025-09-07 17:45:00');

INSERT INTO cartas_pedidos (id_pedido, id_carta, quantidade) VALUES
(1, 1, 1),
(1, 5, 2),
(2, 2, 1),
(2, 10, 1),
(3, 3, 4),
(4, 4, 1),
(5, 6, 1),
(6, 7, 3),
(7, 8, 1),
(8, 9, 10),
(9, 1, 2),
(10, 2, 1);

INSERT INTO pagamentos (tipo) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Boleto Bancário'),
('Pix'),
('Transferência Bancária'),
('Dinheiro'),
('PayPal'),
('Mercado Pago'),
('Apple Pay'),
('Google Pay');


select * from cliente c 

select * from cartas c 

select * from endereco

select *from pedidos p 

select * from cartas_pedidos cp 

select * from pagamentos p 

alter table endereco
add constraint chk_uf_length check (char_length(uf) = 2),
add constraint chk_cep_length check (char_length(cep) = 8);



alter table produto
add constraint chk_largura_nonnegative check (largura >= 0),
add constraint chk_altura_nonnegative check (altura >= 0),
add constraint chk_profundidade_nonnegative check (profundidade >= 0);
