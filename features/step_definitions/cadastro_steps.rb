Dado('acessar a página de cadastro') do
   @cadastro.load
   @usuario = Faker::Internet.email
   @senha = Faker::Internet.password
 end

Quando('preencher usuário e senha corretamente no cadastro') do
  @cadastro.has_btn_cadastrar?
  @cadastro.realizar_cadastro(@usuario, @senha)
end

Então('validar que o cadastro foi realizado com sucesso') do
   expect(current_url).to eql(@url['login'])
end 

Quando('preencher usuário e senhas divergentes') do
  @cadastro.has_btn_cadastrar?
  @cadastro.realizar_cadastro(@usuario, @senha, rand(9999..100000))
end

Então('validar que é apresentado mensagem que as senhas não combinam') do
  @cadastro.has_msg_senhas_nao_combinam?
  expect(@cadastro.msg_senhas_nao_combinam.text).to eql(@messages['cadastro']['senhas_nao_combinam'])
end

Quando('tentar realizar o cadastro') do
  @cadastro.btn_cadastrar.click
end


Quando('informar um usuário já existente no cadastro') do
  @cadastro.realizar_cadastro(@user_data['login']['username1'], @senha)
end

Então('validar que é apresentado a mensagem de que Usuário já está cadastrado') do
  @cadastro.has_msg_usuario_ja_cadastrado?
  expect(@cadastro.msg_usuario_ja_cadastrado.text).to eql(@messages['cadastro']['usuario_ja_cadastrado'])
end