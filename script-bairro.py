# Aqui você pode mexer, mas precisa analisar como está seu cenário na DIVISÃO DE TAREFAS.sql
cd_bairro = 259
cd_cidade = 87
cd_cidade_limite = 130
#   Caso fique com dúvidas, aqui está o meu de exemplo:
#   cd_bairro = 259
#   cd_cidade = 87
#   cd_cidade_limite = 130

# Não mexer nessa var, é o padrão necessário na DIVISÃO DE TAREFAS.sql
bairros_por_cidade = 3

# Reseta o arquivo toda vez
open('querySql-bairro.txt', 'w').close()
arquivo = open('querySql-bairro.txt', 'w')

for cd_cidade in range(cd_cidade, cd_cidade_limite+1):
    for i in range(bairros_por_cidade):
        #Escreve informação nova
        arquivo.write(
            f"INSERT INTO T_SAK_BAIRRO (cd_bairro,cd_cidade,nm_bairro) VALUES ({cd_bairro},{cd_cidade},'');" + "\n")
        cd_bairro += 1
    cd_cidade += 1

#LEMBRE-SE: ainda será necessário colocar manualmente os valores dos varchars
#LEMBRE-SE: para não ficar dando conflito no git, o txt não será armazenado no git!
#Após concluído, veja o arquivo querySql-bairro.txt