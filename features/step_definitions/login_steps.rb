Dado('acessar a página de login') do
   @login.load
 end
 
 Quando('preencher usuário e senha corretamente no login') do
   @login.has_btn_entre?
   @login.acessar(@user_data['login']['username2'], @user_data['login']['password2'])
 end

 Então('validar que login foi realizado com sucesso') do
   expect(current_url).to eql(@url['logged'])
end
 
 Quando('preencher usuário e senha incorreta') do
   @login.has_btn_entre?
   @login.acessar(@user_data['login']['username2'], '1234567')
 end
 
 Então('validar que é apresentado mensagem de erro de senha incorreta') do
   expect(@login.msg_usuario_senha_invalidos.text).to include(@messages['login']['usuario_senha_invalido'])
 end
 
 Quando('preencher apenas o usuário no login') do
   @login.inpt_usuario.set @user_data['login']['username2']
 end
 
 Quando('tentar realizar o login') do
   @login.btn_entre.click
 end
 
 Então('validar que é apresentado a mensagem de campo obrigatório para preenchimento de senha') do
   @login.has_msg_campo_obrigatorio?
   expect(page.find("div[class='wrap-input100 validate-input alert-validate']")[:'data-validate']).to eql(@messages['login']['campo_obrigatorio'])
 end