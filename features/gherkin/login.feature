#language: pt

@login
Funcionalidade: Login

   Contexto: Acessar página de cadastro
      * acessar a página de login
   
   @login_sucesso
   Cenário: Realizar login com sucesso
      Quando preencher usuário e senha corretamente no login
      Então validar que login foi realizado com sucesso

   @login_senha_incorreta
   Cenário: Senha incorreta
      Quando preencher usuário e senha incorreta
      Então validar que é apresentado mensagem de erro de senha incorreta 
   
   @login_nao_preencher_senha
   Cenário: Não preencher senha
      Quando preencher apenas o usuário no login
      E tentar realizar o login
      Então validar que é apresentado a mensagem de campo obrigatório para preenchimento de senha