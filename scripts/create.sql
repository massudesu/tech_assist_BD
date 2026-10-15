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

