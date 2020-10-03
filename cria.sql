CREATE TABLE T_SLV_AUTOR(
	cd_autor number(3) not null,
	nm_primeiro_autor varchar2(20) not null,
	nm_segundo_autor varchar2(40) not null
);

ALTER TABLE T_SLV_AUTOR ADD CONSTRAINT 
pk_slv_autor PRIMARY KEY(cd_autor);

CREATE TABLE T_SLV_CATEGORIA(
	cd_categoria number(3) not null,
	ds_sigla_categoria char(3) not null,
	ds_categoria varchar2(30) not null
);

ALTER TABLE T_SLV_CATEGORIA ADD CONSTRAINT 
pk_slv_categoria PRIMARY KEY(cd_categoria);

ALTER TABLE T_SLV_CATEGORIA ADD CONSTRAINT 
un_slv_categoria_sigla UNIQUE(ds_sigla_categoria);

ALTER TABLE T_SLV_CATEGORIA ADD CONSTRAINT 
un_slv_categoria_desc UNIQUE(ds_categoria);

CREATE TABLE T_SLV_LIVRO(
	nr_isbn number(8) not null,
	cd_categoria number(3) not null,
	nm_titulo varchar2(50) not null,
	ds_sinopse varchar2(200) not null,
	nr_edicao number(2) not null,
	nr_ano number(4) not null
);

ALTER TABLE T_SLV_LIVRO ADD CONSTRAINT 
pk_slv_livro PRIMARY KEY(nr_isbn);


ALTER TABLE T_SLV_LIVRO ADD CONSTRAINT
ck_slv_livro_ano CHECK (nr_ano > 0);

ALTER TABLE T_SLV_LIVRO ADD CONSTRAINT
ck_slv_livro_edicao CHECK (nr_edicao > 0);

CREATE TABLE T_SLV_AUTOR_LIVRO(
	nr_isbn number(8) not null,
	cd_autor number(3) not null,
	st_autor_principal number(1) not null
);

ALTER TABLE T_SLV_AUTOR_LIVRO ADD CONSTRAINT 
pk_slv_autor_livro PRIMARY KEY(nr_isbn,cd_autor);

ALTER TABLE T_SLV_AUTOR_LIVRO ADD CONSTRAINT
ck_slv_autor_livro_status CHECK (st_autor_principal in (1,2));

ALTER TABLE T_SLV_LIVRO ADD CONSTRAINT 
fk_slv_livro_categoria FOREIGN KEY(cd_categoria)
REFERENCES T_SLV_CATEGORIA (cd_categoria);

ALTER TABLE T_SLV_AUTOR_LIVRO ADD CONSTRAINT 
fk_slv_autor_livro_autor FOREIGN KEY(cd_autor)
REFERENCES T_SLV_AUTOR (cd_autor);

ALTER TABLE T_SLV_AUTOR_LIVRO ADD CONSTRAINT 
fk_slv_autor_livro_livro FOREIGN KEY(nr_isbn)
REFERENCES T_SLV_LIVRO (nr_isbn);





ALTER TABLE T_SLV_CATEGORIA RENAME COLUMN 
ds_sigla_categoria TO ds_sigla_categ;

ALTER TABLE T_SLV_CATEGORIA DROP CONSTRAINT 
un_slv_categoria_desc;

ALTER TABLE T_SLV_CATEGORIA
ADD CONSTRAINT UN_SLV_CATEG_DESC UNIQUE(ds_categoria);

ALTER TABLE T_SLV_AUTOR MODIFY
nm_segundo_autor varchar2(30);

ALTER TABLE T_SLV_AUTOR ADD
ds_email varchar2(40) not null;

ALTER TABLE T_SLV_AUTOR MODIFY
ds_email varchar2(60) null;

ALTER TABLE T_SLV_AUTOR_LIVRO MODIFY
nr_isbn number(13);

ALTER TABLE T_SLV_LIVRO MODIFY
nr_isbn number(13);

ALTER TABLE T_SLV_AUTOR ADD
nm_pais_origem varchar2(30) null;

ALTER TABLE T_SLV_LIVRO 
ADD CONSTRAINT UN_SLV_LIVRO_TITULO UNIQUE(nm_titulo);

ALTER TABLE T_SLV_AUTOR_LIVRO 
DROP CONSTRAINT FK_SLV_AUTOR_LIVRO_AUTOR;

ALTER TABLE T_SLV_LIVRO 
DROP CONSTRAINT PK_SLV_LIVRO CASCADE;

ALTER TABLE T_SLV_CATEGORIA 
DISABLE CONSTRAINT UN_SLV_CATEGORIA_SIGLA;
