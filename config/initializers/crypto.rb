FileUtils.chdir File.expand_path("~/.ssh") do
  Rails.application.secrets.merge!(
    private_key: File.read('example_rsa'),
    public_key:  File.read('example_rsa.pem')
  )
end
