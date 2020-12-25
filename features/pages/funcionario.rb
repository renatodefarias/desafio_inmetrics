class FuncionarioPage < SitePrism::Page
   set_url '/empregados'

   element :btn_novo_funcionario, 'li:nth-child(2) > a'
   element :input_nome, '#inputNome'
   element :input_cargo, '#inputCargo'
   element :input_cpf, '#cpf'
   element :input_salario, '#dinheiro'
   element :select_sexo, '#slctSexo'
   element :radio_tipo_contratacao_clt, '#clt'
   element :radio_tipo_contratacao_pj, '#pj'
   element :input_admissao, '#inputAdmissao'
   element :btn_enviar, "input[type='submit']"

end