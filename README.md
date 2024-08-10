# Projeto de Loja Virtual

## Descrição

Este projeto tem como objetivo criar uma loja virtual usando WordPress, Docker, Git e GitHub. O projeto é parte de uma atividade do curso de DevOps, que abrange o desenvolvimento, o versionamento e o gerenciamento de um ambiente de aplicação em contêineres.

## Tecnologias Utilizadas

- **WordPress**: Sistema de gerenciamento de conteúdo (CMS) para a criação da loja virtual.
- **Docker**: Plataforma para criar, implantar e executar aplicações em contêineres.
- **Git**: Sistema de controle de versão para rastreamento de mudanças no código fonte.
- **GitHub**: Plataforma de hospedagem para controle de versão e colaboração no projeto.

## Estrutura do Projeto

Este projeto utiliza o Docker para criar contêineres para o WordPress e o banco de dados MySQL. A configuração do projeto é definida no arquivo `docker-compose.yml`.

### Arquivos Principais

- **docker-compose.yml**: Arquivo de configuração do Docker Compose que define os serviços e redes necessárias.
- **.env**: Arquivo de variáveis de ambiente para configurar as credenciais do banco de dados e outras configurações.
- **README.md**: Este arquivo, que fornece uma visão geral do projeto e instruções de uso.


### O arquivo .gitkeep é um arquivo de marcador usado para garantir que diretórios vazios sejam incluídos no controle de versão com Git. Aqui está uma explicação mais detalhada:


## Configuração do Ambiente

### Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/) instalado.
- [Docker Compose](https://docs.docker.com/compose/install/) instalado.
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) instalado.

### Configuração

1. Clone o repositório do GitHub:

    ```bash
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. Crie um arquivo `.env` com as seguintes variáveis:

    ```env
    MYSQL_ROOT_PASSWORD=sua_senha_root
    MYSQL_DATABASE=sua_database
    MYSQL_USER=seu_usuario
    MYSQL_PASSWORD=sua_senha
    ```

3. Inicie os contêineres com Docker Compose:

    ```bash
    docker-compose up -d
    ```

4. Acesse a interface do WordPress navegando para [http://localhost:8081](http://localhost:8081) e siga as instruções para configurar sua loja virtual.

## Uso

- **WordPress**: Acesse a interface administrativa do WordPress em [http://localhost:8081/wp-admin](http://localhost:8081/wp-admin) para gerenciar sua loja.
- **Banco de Dados**: O MySQL está acessível no contêiner, mas não é exposto diretamente para a rede externa.

## Comandos Úteis

- **Parar os contêineres**:

    ```bash
    docker-compose down
    ```

- **Verificar os logs dos contêineres**:

    ```bash
    docker-compose logs
    ```

- **Reiniciar os contêineres**:

    ```bash
    docker-compose restart
    ```

## Contribuição


Este projeto foi elaborado em dupla: Bruno e Axel.
