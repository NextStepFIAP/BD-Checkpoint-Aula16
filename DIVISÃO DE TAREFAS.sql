--RESUMO--
departamento mínimo 7
funcionario 35
dependente 9 
telefone 70
projeto  com data 2
projeto sem data 3
execucao dos projetos :
    projeto
        3 funcionários
    projeto
        3 funcionario
    projeto
        3 funcionário
        
26 estados
   10 cidades
       3 bairros
           5 endereços
                        
tipo endereços
    residencial 
    comercial
    veraneio

funcionário 35
    endereço 2
total endereço: 70 endereços

--PARTE 1 DA TAREFA--

28  CELSO - PROJETOS SEM DATA + ESTADOS
35  EDUARDO - FUNCIONÁRIO
35  GUILHERME - TELEFONE
35  WILLIAM - TELEFONE2
12  ROGÉRIO - PROJETO COM DATA + DEPARTAMENTO + TIPO ENDEREÇOS 
18  HENRIQUE - FUNCIONÁRIOS POR PROJETO + DEPENDENTES

--PARTE 2 DA TAREFA

43 cidades pra cada pessoa
	Celso 1 a 43
   William 44 a 87
   Eduardo 88 a 130
   Guilherme 131 a 173
   Rogério 174 a 216
   Henrique 217 a 260
130 bairros pra cada pessoa
  Celso 1 a 130
  William 131 a 262
  Eduardo 263 a 394
  Guilherme 395 a 526
  Rogério 527 a 658
  Henrique 659 a 786
650 endereços para cada pessoa
  Celso 1 a 650
  William 651 a 1301
  Eduardo 1302 a 1952
  Guilherme 1953 a 2603
  Rogério 2604 a 3254
  Henrique  3255 a 3900
70 funcionário-endereço
  Celso 1 a 70
  William 71 a 141
  Eduardo 142 a 212
  Guilherme 213 a 283
  Rogério 284 a 354
  Henrique 355 a 420

--EXEMPLOS DE INSERT--

DELETE FROM T_SLV_AUTOR CASCADE CONSTRAINT;
DELETE FROM T_SLV_CATEGORIA CASCADE CONSTRAINT;
DELETE FROM T_SLV_LIVRO CASCADE CONSTRAINT;
DELETE FROM T_SLV_AUTOR_LIVRO CASCADE CONSTRAINT;


CREATE SEQUENCE SequenceName
As int
start with 1
Increment by 1 ;

INSERT INTO T_SAK_DEPTO (cd_depto,nm_depto,sg_depto) VALUES (1234,'TECNOLOGIA DA INFORMAÇÃO CORPORATIVA','TIC');


INSERT INTO T_SAK_ESTADO (cd_estado,nm_estado,sg_estado) VALUES (1,'SÃO PAULO','SP');
INSERT INTO T_SAK_ESTADO (cd_estado,nm_estado,sg_estado) VALUES (2,'RIO DE JANEIRO','RJ');


INSERT INTO T_SAK_CIDADE (cd_cidade,cd_estado,nm_cidade) VALUES (10,1,'BOTUCATU');
INSERT INTO T_SAK_CIDADE (cd_cidade,cd_estado,nm_cidade) VALUES (11,2,'ANGRA DOS REIS');

INSERT INTO T_SAK_BAIRRO (cd_bairro,cd_cidade,nm_bairro) VALUES (111,10,'CENTRO');
INSERT INTO T_SAK_BAIRRO (cd_bairro,cd_cidade,nm_bairro) VALUES (222,11,'VILA SANTO ANTONIO');

INSERT INTO T_SAK_ENDERECO (cd_end_correio,cd_bairro,nr_cep,ds_logradouro) VALUES (1000,111,18603590,'RUA DOS PRINCIPES');
INSERT INTO T_SAK_ENDERECO (cd_end_correio,cd_bairro,nr_cep,ds_logradouro) VALUES (2000,222,09530681,'AVENIDA PRESIDENTE VARGAS');



INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1000,1234,'PAULO SILVA',TO_DATE('30/04/1988','DD/MM/YYYY'),'SOLTEIRO',10000,TO_DATE('19/09/2020','DD/MM/YYYY'));
INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1001,1234,'MARIANA SOUZA',TO_DATE('25/06/2000','DD/MM/YYYY'),'SOLTEIRA',5000,TO_DATE('12/02/2018','DD/MM/YYYY'));
INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1002,1234,'RAFAELA DIAS',TO_DATE('18/12/1974','DD/MM/YYYY'),'CASADA',20000,TO_DATE('21/07/2000','DD/MM/YYYY'));

INSERT INTO T_SAK_TIPO_ENDERECO (cd_tipo_endereco,nm_tipo_endereco) VALUES (1,'RESIDENCIAL');
INSERT INTO T_SAK_TIPO_ENDERECO (cd_tipo_endereco,nm_tipo_endereco) VALUES (2,'VERANEIO');

INSERT INTO T_SAK_FUNCIONARIO_ENDERECO (cd_func,cd_end_func,cd_end_correio,cd_tipo_endereco,ds_complemento,nr_logradouro) VALUES (1000, 1, 1000,1,NULL,2080);
INSERT INTO T_SAK_FUNCIONARIO_ENDERECO (cd_func,cd_end_func,cd_end_correio,cd_tipo_endereco,ds_complemento,nr_logradouro) VALUES (1001, 1, 2000,2,'BLOCO C APTO 51',1543);
INSERT INTO T_SAK_FUNCIONARIO_ENDERECO (cd_func,cd_end_func,cd_end_correio,cd_tipo_endereco,ds_complemento,nr_logradouro) VALUES (1002, 1, 2000,2,'RUA SEM SAÍDA',658);

UPDATE T_SAK_FUNCIONARIO SET VL_SALARIO = VL_SALARIO * 1.4723;

INSERT INTO T_SAK_PROJETO (cd_projeto,nm_projeto,vl_budget_projeto,dt_inicio) VALUES (456,'DRAGON BALL',200000,TO_DATE('19/09/2020','DD/MM/YYYY'));

UPDATE T_SAK_PROJETO SET DT_TERMINO = SYSDATE WHERE CD_PROJETO = 456;

INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1003,1234,'TESTE DA APLICAÇÃO',TO_DATE('12/12/1980','DD/MM/YYYY'),'DIVORCIADO',7500,TO_DATE('05/01/2005','DD/MM/YYYY'));

UPDATE T_SAK_FUNCIONARIO SET VL_SALARIO = (SELECT NVL( AVG(VL_SALARIO),0) AS VL_MEDIO FROM T_SAK_FUNCIONARIO) WHERE NM_FUNCIONARIO = 'TESTE DA APLICAÇÃO';

DELETE FROM T_SAK_TELEFONE WHERE CD_FUNC = 1002 AND CD_TELEFONE = 1;
-- commit
COMMIT;



