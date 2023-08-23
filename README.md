# Fast Trivia - README

O FastTrivia é um projeto utilizado para teste técnico para vaga de desenvolvedor flutter na checkmob, contendo uma aAplicação em que o usuário receba um questionário, com uma ou mais perguntas, tendo alternativas, e possa responder de acordo, conhecimentos, ao final ser retornado a sua pontuação total.

## Requisitos dos Testes

- Ao selecionar a opção de responder um novo questionário, a aplicação deverá receber o modelo de questionário a ser respondido via uma requisição mock HTTP;
- Permitir que o usuário responda questionários com questões do tipo seleção única;
- Exibir a lista de questionários respondidos pelo usuário;
- Permitir que o usuário selecione um questionário respondido anteriormente e exibir quais foram as respostas informadas.
- Inclua instruções sobre o projeto no readme.md do repositório, tais como versão do Flutter e outras ferramentas utilizadas.

## Requisitos não atendidos

- Tela de histórico não exibe todos os quizz jogados, apenas o último;


## Versões Utilizadas

- SDK: 33
- Flutter: 3.10.5
- Dart: 3.0.5
- DevTools: 2.23.1
- Emulador: Redmi Note 7

- **Banco de Dados**
  - json_rest_server: ^1.5.10

## Passos Iniciais

- Antes de iniciar, verifique se você possui as mesmas versões utilizadas no projeto.
- Altere seu ip local dentro do arquivo **/lib/src/core/ui/constants.dart** 

### Configurando API e Banco

O projeto possui a API e o banco de dados hospedados no mockados. Para utilização:

1. Ative o Json Rest Server pelo pub:
   ```
   dart pub global activate json_rest_server
   ```
2. Navegue até a pastas **/api** que se encontra no projeto
3. Execute o comando em um terminal, de preferência powershell:
   ```
   json_rest_server run
   ```
   ou
   ```
   jrs run
   ```

### Observações

1. Foi usado o **Shared Preferences** para armazenar os dados da request, realizando a requisição ao iniciar a aplicação do modelo de questionário, permitindo acessos posteriores sem internet.
2. Utilizei a fonte **Poppins** e images de licença livre.
3. Os widgets de **alerta** e **fixed spacer** foram construídos por mim e usados de forma recorrente em meus projetos.
