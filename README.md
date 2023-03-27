# Desafio de engenharia de dados da Refera!

![Infra dos banco de dados](fluxo.png)

Para não sobrecarregar nosso banco de dados transacional, precisamos ter um ambiente separado para analisar nossos dados sem grandes problemas. Precisamos extrair todas as tabelas do banco de dados `transactional` e carregar-las para o banco de dados `analytics`. Poderíamos fazer de várias formas: 
 
- Usando a ferramenta de integração Airbyte e script bash com Octavia CLI
- Com script Python
- Com script Bash

Escolhi usar script Bash.

## Configuração do Ambiente e execução do script

O script feito em bash automatiza a criação de um diretório de backup do banco de dados dvdrental para que o banco de dados analytics possa restaurar o arquivo e carregá-lo.

Execute o comando abaixo(chmod a+x para dar permissão ao arquivo):

```bash
chmod a+x script.sh
./script.sh
```

