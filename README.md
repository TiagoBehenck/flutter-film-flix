# Filme Flix

Filme Flix é um aplicativo Flutter para explorar, buscar e gerenciar filmes. Ele oferece funcionalidades como busca de filmes, exibição de detalhes, favoritos e navegação intuitiva.

## Funcionalidades

- **Busca de Filmes**: Pesquise filmes por título e visualize os resultados em tempo real.
- **Detalhes do Filme**: Veja informações detalhadas sobre cada filme, incluindo sinopse, elenco, e mais.
- **Favoritos**: Adicione ou remova filmes da sua lista de favoritos.
- **Navegação**: Navegue facilmente entre as páginas de busca, favoritos, configurações e detalhes do filme.

## Estrutura do Projeto

### Principais Diretórios

- **`lib/core`**: Contém a lógica principal do aplicativo, incluindo serviços, repositórios, navegação e estados.
- **`lib/models`**: Modelos de dados usados no aplicativo, como `Movie`, `Genre`, `ProductionCompany`, entre outros.
- **`lib/widgets`**: Componentes reutilizáveis, como listas de filmes, carrosséis e botões.
- **`lib/infra/db`**: Gerenciamento de armazenamento local usando `SharedPreferences`.

### Principais Arquivos

- **`main.dart`**: Ponto de entrada do aplicativo.
- **`routes.dart`**: Configuração das rotas de navegação.
- **`search_page.dart`**: Página de busca de filmes.
- **`detail_page.dart`**: Página de detalhes do filme.
- **`favorites_page.dart`**: Página de filmes favoritos.

## Tecnologias Utilizadas

- **Flutter**: Framework principal para desenvolvimento do aplicativo.
- **Dio**: Biblioteca para requisições HTTP.
- **SharedPreferences**: Gerenciamento de armazenamento local.
- **GoRouter**: Navegação e gerenciamento de rotas.

## Configuração e Execução

### Pré-requisitos

- Flutter instalado ([guia de instalação](https://docs.flutter.dev/get-started/install)).
- Chave de API para o serviço de filmes (configurada no arquivo `AppConfig`).

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/filme_flix.git
   cd filme_flix
    ```

2. Instale as dependências
    ```bash
    flutter pub get
    ```

3. Configure a chave de API no arquivo `lib/app_config.dart`

4. Execute o aplicativo
    ```bash
    flutter run
    ```
