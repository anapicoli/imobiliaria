create database imovel;
use imovel;

create table estado(
sg_estado char(2) not null primary key,
nm_estado varchar(50) not null
);

create table cidade(
cd_cidade integer not null primary key,
nm_cidade varchar(50) not null,
sg_estado char(2) not null,
foreign key (sg_estado)
references estado (sg_estado)
);

create table bairro(
cd_bairro integer not null primary key,
nm_bairro varchar(50) not null,
cd_cidade integer not null,
sg_estado char(2) not null,
foreign key (cd_cidade)
references cidade(cd_cidade),
foreign key (sg_estado)
references estado(sg_estado)
);

create table faixa_imovel(
cd_faixa integer not null primary key,
nm_faixa varchar(50) not null,
vl_minimo decimal(7,2) not null,
vl_maximo decimal(11,2) not null
);

create table compradores(
cd_comprador integer not null primary key,
nm_comprador varchar(50) not null,
nm_enderecocomprador varchar(255) not null,
nr_cpfcomprador numeric(11,0) not null,
cd_cidade integer not null,
cd_bairro integer not null,
sg_estado char(2) not null,
tel_comprador numeric(11,0) not null,
foreign key (cd_cidade)
references cidade(cd_cidade),
foreign key (cd_bairro)
references bairro(cd_bairro),
foreign key (sg_estado)
references estado(sg_estado)
);

create table vendedor(
cd_vendedor integer not null primary key,
nm_vendedor varchar(50) not null,
nm_endereco varchar(255) not null,
nr_cpf numeric(11,0) not null,
cd_cidade integer not null,
cd_bairro integer not null,
sg_estado char(2) not null,
telefone numeric(11,0) not null,
data_nasc date not null,
foreign key (cd_cidade)
references cidade(cd_cidade),
foreign key (cd_bairro)
references bairro(cd_bairro),
foreign key (sg_estado)
references estado(sg_estado)
);

create table imovel(
cd_imovel integer not null primary key,
cd_vendedor integer not null,
cd_bairro integer not null,
cd_cidade integer not null,
sg_estado char(2) not null,
nm_endereco varchar(255) not null,
nr_areautil decimal(7,2) not null,
nr_areatotal decimal(7,2) not null,
vl_preco decimal(11,2) not null,
cd_oferta integer null,
st_vendido bit not null,
data_lancto date not null,
foreign key (cd_vendedor)
references vendedor(cd_vendedor),
foreign key (cd_bairro)
references bairro(cd_bairro),
foreign key (cd_cidade)
references cidade(cd_cidade),
foreign key (sg_estado)
references estado(sg_estado)
);

ALTER TABLE imovel
MODIFY COLUMN st_vendido BIT(1) NOT NULL;

create table oferta(
cd_oferta integer not null primary key,
cd_imovel integer not null,
cd_comprador integer not null,
vl_oferta decimal(11,2) not null,
dt_oferta date not null,
foreign key (cd_imovel)
references imovel(cd_imovel),
foreign key (cd_comprador)
references compradores(cd_comprador)
);

