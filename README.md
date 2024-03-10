
# meltano_postgres_s3
# Configuração do Ambiente e Acesso à Nuvem

Este guia fornece instruções sobre como configurar seu ambiente de desenvolvimento, incluindo a execução de um banco de dados local usando Docker Compose, e como acessar serviços em nuvem usando um arquivo .env. Além disso, demonstra como utilizar o Meltano para extrair dados de um banco de dados PostgreSQL e carregá-los em arquivos CSV no Amazon S3.

## Configuração do Ambiente Virtual (venv)

1. Abra um terminal.

2. Navegue até o diretório raiz do seu projeto.

3. Crie um novo ambiente virtual executando o seguinte comando:
    ```bash
    python -m venv venv
    ```

4. Ative o ambiente virtual:
    - No Windows:
    ```bash
    venv\Scripts\activate
    ```
    - No macOS e Linux:
    ```bash
    source venv/bin/activate
    ```

## Instalação de Pacotes

1. Certifique-se de que o ambiente virtual está ativado.

2. Instale os pacotes necessários a partir do arquivo requirements.txt:
    ```bash
    pip install -r requirements.txt
    ```

## Execução de um Banco de Dados Local com Docker Compose

1. Certifique-se de que o Docker Desktop está instalado e em execução no seu sistema.

2. No diretório raiz do seu projeto, execute o Docker Compose para iniciar o banco de dados local (por exemplo, MySQL, PostgreSQL, etc.). Por exemplo, se você estiver usando um arquivo `docker-compose.yaml`:
    ```bash
    docker-compose up -d
    ```

    Certifique-se de que o arquivo `docker-compose.yaml` esteja configurado corretamente para iniciar o banco de dados local desejado.

## Configuração do Arquivo .env

1. Crie um arquivo chamado `.env` no diretório raiz do seu projeto.

2. Dentro do arquivo `.env`, configure as variáveis de ambiente necessárias para acessar serviços em nuvem. Por exemplo, se você estiver usando AWS, configure as seguintes variáveis:
    ```plaintext
    AWS_ACCESS_KEY_ID=seu_access_key_id
    AWS_SECRET_ACCESS_KEY=sua_secret_access_key
    AWS_REGION=sua_regiao
    ```

    Certifique-se de substituir `seu_access_key_id`, `sua_secret_access_key` e `sua_regiao` pelos valores correspondentes fornecidos pela AWS.

3. Guarde este arquivo com cuidado e não o compartilhe publicamente, pois contém informações sensíveis de autenticação.

## Execução do Meltano para Extração e Carregamento de Dados

1. Certifique-se de que o ambiente virtual está ativado.

2. No terminal, execute os seguintes comandos para instalar e configurar o Meltano:
    ```bash
    pip install meltano
    meltano install
    ```

3. Após a instalação bem-sucedida, execute o seguinte comando para extrair dados do banco de dados PostgreSQL e carregá-los em arquivos CSV no Amazon S3:
    ```bash
    meltano run tap-postgres target-csv-s3
    ```

    Certifique-se de que o Meltano esteja configurado corretamente para se conectar ao banco de dados PostgreSQL e ao Amazon S3, conforme necessário.

## Notas Importantes

- Sempre ative o ambiente virtual antes de executar o código ou instalar novos pacotes.

- Certifique-se de que o Docker Desktop esteja em execução e o Docker Compose esteja instalado para iniciar o banco de dados local.

- Mantenha o arquivo `.env` seguro e não o compartilhe publicamente para proteger suas credenciais de acesso à nuvem.

- Certifique-se de seguir as práticas recomendadas de segurança ao lidar com informações sensíveis, como credenciais de acesso à nuvem.

Este guia deve ajudá-lo a configurar seu ambiente de desenvolvimento, incluindo um banco de dados local, e acessar serviços em nuvem, além de utilizar o Meltano para extrair e carregar dados de forma eficiente. Se você tiver dúvidas ou problemas, consulte a documentação oficial do serviço em nuvem que está utilizando, do Docker Compose e do Meltano, ou procure ajuda da comunidade.


## Comandos principais

### testes
```
meltano config tap-csv test
```

### Extração do csv para o bucket s3 aws
```
meltano run tap-csv target-s3-csv
```

### Extração do banco local para o bucket s3 aws
```
docker compose up -d
meltano run tap-postgres target-s3-csv
```

### Ingestão do bucket s3 aws para RDS-postegres aws
```
meltano run tap-s3-csv target-postgres
```

### Dbt
```
meltano run dbt-postgres:run
```