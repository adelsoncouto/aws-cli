# Uso

## Obter as credenciais

Gere suas credenciais de acesso:

* Acesse sua conta na AWS
* Clique no seu nome (canto superior esquerdo)
* Na seção que **Chaves de acesso para acesso à CLI, ao SDK e à API** clique em **Criar chave de acesso**
* Faça o download do arquivo *.csv*
* Abra o arquivo e coloque os valores no arquivo *credentials/credentials*
* No arquivo *credentials/config* ajuste conforme preferir

Mais detalhes sobre o AWS CLI podem ser obtidas [aqui](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html) 

Outros detalhes sobre a conta na AWS podem ser encontradas [aqui](https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/getting-started_create-admin-group.html)

## Acesso usando arquivo de configuração

```sh
docker run --rm -it \
  --name aws-cli \
  --hostname aws-cli \
  -v ./credentials:/root/.aws \
  adelsoncouto/aws-cli:latest <command line>
```

## Acesso usando variáveis de ambiente

```sh
docker run --rm -it \
  --name aws-cli \
  --hostname aws-cli \
  -e AWS_ACCESS_KEY_ID=<accessKeyId> \
  -e AWS_SECRET_ACCESS_KEY=<secretAccessKey> \
  -e AWS_DEFAULT_REGION=us-east-1 \
  -e AWS_DEFAULT_OUTPUT=json \
  adelsoncouto/aws-cli:latest <command line>
```

Outras variáives


**AWS_ACCESS_KEY_ID** – Especifica uma chave de acesso da AWS associada a um usuário ou função do IAM.

**AWS_SECRET_ACCESS_KEY** – Especifica a chave secreta associada à chave de acesso. Essencialmente, essa é a "senha" para a chave de acesso.

**AWS_SESSION_TOKEN** – Especifica o valor do token de sessão necessário se você estiver usando credenciais de segurança temporárias. Para obter mais informações, consulte Seção de saída do comando assume-role no AWS CLI Command Reference.

**AWS_DEFAULT_REGION** – Especifica a região da AWS para a qual enviar a solicitação.

**AWS_DEFAULT_OUTPUT** – Especifica o formato de saída a ser usado.

**AWS_DEFAULT_PROFILE** – especifica o nome do perfil da CLI com as credenciais e as opções a serem usadas. Esse pode ser o nome de um perfil armazenado em um arquivo credentials ou config ou o valor default para usar o perfil padrão. Se você especificar essa variável de ambiente, ela substituirá o comportamento de usar o perfil denominado [default] no arquivo de configuração.

**AWS_CA_BUNDLE** – Especifica o caminho para um pacote de certificado a ser usado para a validação de certificado HTTPS.

**AWS_SHARED_CREDENTIALS_FILE** – Especifica a localização do arquivo que a AWS CLI usa para armazenar as chaves de acesso (o padrão é ~/.aws/credentials).

**AWS_CONFIG_FILE** – Especifica a localização do arquivo que a AWS CLI usa para armazenar os perfis de configuração (o padrão é ~/.aws/config).

Mais detalhes podem ser obtidos [aqui](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-configure-envvars.html)
