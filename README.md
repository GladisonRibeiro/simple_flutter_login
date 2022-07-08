# simple_flutter_login




____


Login no Flutter usando a biblioteca Bloc com base na [documentação](https://bloclibrary.dev/#/flutterlogintutorial)

<br/>

<figure>
  <img src="simple_flutter_login.gif" alt="preview do app">
  <figcaption>Preview do app</figcaption>
</figure>

<br/>

## Conceitos aplicados

- BlocProvider, widget Flutter que fornece um bloco para seus filhos;
- BlocBuilder, widget Flutter que lida com a construção do widget em resposta a novos estados;
- Adicionando eventos com context.read;
- Evitar reconstruções desnecessárias com o Equatable;
- RepositoryProvider, um widget Flutter que fornece um repositório para seus filhos;
- BlocListener, um widget Flutter que invoca o código do ouvinte em resposta a mudanças de estado no bloco;
- Atualizando a interface do usuário com base em uma parte de um estado de bloco com context.select;

<br/>

## Dependencias:

- flutter_bloc
- formz
- equatable
- authentication_repository (pacote local para organização do domínio)
- user_repository (pacote local para organização do domínio)
- bloc_test
- mocktail

____




