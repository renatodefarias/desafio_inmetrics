#language: pt

@funcionario
Funcionalidade: Gerenciar Funcionários

   Contexto: Acessar página de funcionários
      * acessar a página de funcionários
      * preencher usuário e senha corretamente no login
      * validar que login foi realizado com sucesso

   @cadastro_funcionario
   Esquema do Cenário: Cadastrar Funcionario
      Quando clicar na opção novo funcionario
      E preencher as informacoes necessarias <cargo> <salario> <sexo> <tipo_contratacao> <admissao>
      Então validar que o cadastro de funcionario foi realizado com sucesso

      Exemplos:
      | cargo             | salario | sexo        | tipo_contratacao | admissao     |
      | 'Analista Senior' | 2500    | 'masculino' | CLT              | '01/01/2018' |
      | 'Analista Pleno'  | 1500    | 'feminino'  | PJ               | '13/10/2020' |
      | 'Analista Junior' | 1000    | 'masculino' | PJ               | '15/06/2020' |

   @editar_funcionario
   Esquema do Cenário: Editar Funcionario
      Quando pesquisar o <cpf> do funcionario a ser editado
      E clicar para editar o funcionario
      E alterar as informacoes <nome> <cargo> <cpf> <salario> <sexo> <tipo_contratacao> <admissao>
      E clicar em enviar
      Então validar que a alteracao foi realizada com sucesso

      Exemplos:
      | nome | cargo             | cpf     | salario     | sexo        | tipo_contratacao | admissao     |
      |      | 'Analista Senior' |         | 2500        | 'masculino' | CLT              | '01/01/2018' |
      |      | 'Analista Pleno'  |         | 1500        | 'feminino'  | PJ               | '13/10/2020' |
      |      | 'Analista Junior' |         | 1000        | 'masculino' | PJ               | '15/06/2020' |

   @cadastro_usuario_ja_cadastrado
   Cenário: Usuário já cadastrado
      Quando informar um usuário já existente no cadastro
      E tentar realizar o cadastro
      Então validar que é apresentado a mensagem de que Usuário já está cadastrado