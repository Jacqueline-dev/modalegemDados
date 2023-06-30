/*
Autor: jacqueline Ferreira"
*/

USE livaria;

-- CREATE DATABE livaria;
-- CREATE DATABASE IS NOT EXIST livaria;

CREATE TABLE autor (
idautor int not null auto_increment,
nome varchar(50) not null,
email varchar(50) null,
datanascimento date null,
paisnascimento varchar(50) null,
primary key (idautor)
);

CREATE TABLE autoria(
  idlivro Int not null,
  idautor Int not null,
  primary key (idlivro, idautor),
  key fk_autoria_autor (idautor),
  key fk_autoria_livro (idlivro),
  constraint fk_autoria_autor foreign key (idautor) references autor(idautor),
  constraint fK_autoria_livro foreign key (idlivro) references livro(idlivro)
  
);

CREATE TABLE genero(
  idgenero int not null auto_increment,
  descricao varchar(100) not null,
  primary key (idgenero)

);

CREATE TABLE cliente(
id_cliente int not null auto_increment,
nomecliente varchar(150) not null,
dddtelefone varchar(3) default null,
telefone varchar(15) default null,
datacadastro date not null,
endereco varchar(100) default null,
cidade varchar(45) null,
primary key (idcliente),
constraint fk_cliente_cidade foreign key (cidade) references cidade (codigo_cidade)
);

-- excluindo tabela e add outra

alter table livraria.autor
drop column datanascimento,
add column biografia text null;

alter table livro
add column idioma varchar(20) null after codigoeditora,
add column idgenero int null after idioma,
add column preco float null after idgenero,
add index fk_livro_genero (idgenero ASC);