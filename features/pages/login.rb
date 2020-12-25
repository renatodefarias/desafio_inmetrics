class LoginPage < SitePrism::Page
   set_url '/accounts/login'

   element :inpt_usuario, 'div.container-login100 > div > form > div:nth-child(5) > input'
   element :inpt_senha, 'div.container-login100 > div > form > div:nth-child(7) > input'
   element :btn_entre, "div [class='login100-form-btn']"
   element :msg_usuario_senha_invalidos, "div [class='alert alert-danger alert-dismissible fade show']"
   element :msg_campo_obrigatorio, "[class='wrap-input100 validate-input alert-validate']"

   def acessar(login,senha)
      inpt_usuario.set login
      inpt_senha.set senha
      btn_entre.click
   end

end