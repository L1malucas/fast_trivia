# Fast Trivia - README

O FastTrivia é um projeto feito para etapa de teste técnico da vaga: desenvolvedor Flutter, na CheckMob. 
Contém uma aplicação na qual o usuário recebe um questionário com uma ou mais perguntas, tendo alternativas, e pode responder de acordo com seus conhecimentos. Ao final, a pontuação total é retornada.

## Requisitos dos Testes

- Ao selecionar a opção de responder um novo questionário, a aplicação deverá receber o modelo de questionário a ser respondido via uma requisição mock HTTP;
- Permitir que o usuário responda questionários com questões do tipo seleção única;
- Exibir a lista de questionários respondidos pelo usuário;
- Permitir que o usuário selecione um questionário respondido anteriormente e exibir quais foram as respostas informadas.
- Inclua instruções sobre o projeto no readme.md do repositório, tais como versão do Flutter e outras ferramentas utilizadas.

## Requisitos não atendidos

- A tela de histórico não exibe todos os questionários jogados, apenas o último.

## Versões Utilizadas

- SDK: 33
- Flutter: 3.10.5
- Dart: 3.0.5
- DevTools: 2.23.1
- Emulador: Redmi Note 7 (5.6 polegadas)

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
2. Ao sair, o aplicativo limpa as informações salvas no shared.
3. Utilizei a fonte **Poppins** e images de licença livre.
4. Os widgets de **alerta** e **fixed spacer** foram construídos por mim e são usados de forma recorrente em meus projetos.