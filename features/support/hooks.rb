Before do
   @login ||= LoginPage.new
   @cadastro ||= CadastroPage.new
   @funcionario ||= FuncionarioPage.new
   @user_data = YAML.load_file("#{Dir.pwd}/features/support/data/test_data.yaml")
   @messages = YAML.load_file("#{Dir.pwd}/features/support/data/messages.yaml")
   @url = YAML.load_file("#{Dir.pwd}/features/support/data/urls.yaml")
end

Before do |scenario|
   ## Responsável por criar o diretório com evidencias, antes de iniciar o cenário.

   $scenario_name = scenario.name.gsub(/[#+ (),-]/,'#' => '', '+' => '', 'exemplos' => '',' ' => '_', '(' => '', ')' => '', ',' => '', '-' => '')
   $result_path = "report/screenshots"
   $folder_name = "#{$result_path}/#{Time.now.strftime('%Y%m%d%H%M%S')}_#{$scenario_name.downcase!}"
   Dir.mkdir($folder_name) unless File.exists?($folder_name)
 
end

After do |scenario|
   ## Geracao de evidencia caso o cenario falhe.

   if scenario.failed?
      $file_name_failed = "screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}_FAILED.png"
      page.save_screenshot("#{$folder_name}/#{$file_name_failed}")
      attach("#{$folder_name}/#{$file_name_success}", 'image/png')
   else
      $file_name_success = "screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}_SUCCESS.png"
      page.save_screenshot("#{$folder_name}/#{$file_name_success}")
      attach("#{$folder_name}/#{$file_name_success}", 'image/png')
  end
end

at_exit do
      ReportBuilder.configure do |config|
         config.input_path = 'report/cucumber.json'
         config.report_path = "#{$folder_name}"
         config.report_types = [:json,:html]
         config.report_title = 'Resultado dos Testes - Desafio Inmetrics'
         config.compress_image = true
         config.additional_info = {"Navegador" => "#{@driver}", "Data da Execução" => DateTime.now}
      end
      ReportBuilder.build_report
end