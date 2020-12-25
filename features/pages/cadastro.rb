class CadastroPage < SitePrism::Page
   set_url '/accounts/signup'
   
   element :inpt_usuario, "input[name='username']"
   element :inpt_senha, "[name='pass']"
   element :inpt_repetir_senha, "[name='confirmpass']"
   element :btn_cadastrar, "button[class='login100-form-btn']"
   element :msg_senhas_nao_combinam, 'div:nth-child(5) > span > div'
   element :msg_usuario_ja_cadastrado, 'div.p-t-10.p-b-1 > span > div'
   element :msg_campo_obrigatorio_senha, 'body > div > div > div > form > div:nth-child(6)'
   element :msg_campo_obrigatorio_repetir_senha, 'body > div > div > div > form > div:nth-child(8)'

   def realizar_cadastro(usuario, senha, repetir_senha=senha)
      inpt_usuario.set usuario
      inpt_senha.set senha
      inpt_repetir_senha.set repetir_senha
      btn_cadastrar.click
   end

end