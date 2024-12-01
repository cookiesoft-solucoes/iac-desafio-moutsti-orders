# Como referenciar variaveis no projeto

## 1. Exemplo 1 - criar arquivo terraform.tfvars para definicao das variaveis

``
pvt_key = "/caminho-da-chave"
do_token = "valor_variavel"
``

Para referenciar a variável é basta apenas:

var.pvt_key # nesse caso estamos acessando o valor da variavel pvt_key


## 1. Exemplo 2 - criar variaveis de ambiente no seguinte padrão

``
export TF_VAR_pvt_key="/caminho-da-chave"
export TF_VAR_do_token="valor_variavel"
``

### Obs.: No uso de variaveis o terraform priorizada as definidas no ambiente do sistema. 