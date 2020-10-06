# coding=utf-8
# Aqui você pode mexer, mas precisa analisar como está seu cenário na DIVISÃO DE TAREFAS.sql
cd_bairro = 131
cd_bairro_limite = 261

# Não mexer nessa var, é o padrão necessário na DIVISÃO DE TAREFAS.sql
enderecos_por_bairro = 5

# Reseta o arquivo toda vez
open('querySql-endereco.txt', 'w').close()
arquivo = open('querySql-endereco.txt', 'w')

for cd_bairro in range(cd_bairro,cd_bairro_limite+1):
    #CASO QUEIRA, COMENTE ESSA LINHA ABAIXO
    arquivo.write("Bairro {}: \n".format(cd_bairro))
    for i in range(enderecos_por_bairro):
        #Escreve informação nova
        arquivo.write(
            "INSERT INTO T_SAK_ENDERECO (cd_end_correio,cd_bairro,nr_cep,ds_logradouro) VALUES (seq_endereco.nextval,{},'RUA ');\n".format(cd_bairro))
    cd_bairro += 1

#LEMBRE-SE: ainda será necessário colocar manualmente os valores dos varchars
#LEMBRE-SE: para não ficar dando conflito no git, o txt não será armazenado no git!
#Após concluído, veja o arquivo querySql-bairro.txt
