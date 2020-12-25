#language: pt

@cadastro
Funcionalidade: Cadastro

   Contexto: Acessar página de cadastro
      * acessar a página de cadastro

   @cadastro_sucesso
   Cenário: Realizar cadastro com sucesso
      Quando preencher usuário e senha corretamente no cadastro
      Então validar que o cadastro foi realizado com sucesso

   @cadastro_senhas_divergentes
   Cenário: Senhas não coincidem
      Quando preencher usuário e senhas divergentes
      Então validar que é apresentado mensagem que as senhas não combinam

   @cadastro_usuario_ja_cadastrado
   Cenário: Usuário já cadastrado
      Quando informar um usuário já existente no cadastro
      E tentar realizar o cadastro
      Então validar que é apresentado a mensagem de que Usuário já está cadastrado