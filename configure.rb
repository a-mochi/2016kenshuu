require 'bundler/setup'
Bundler.require

Ekisuke::Configure.configure do |c|
  c.target_server = ENV['EKISPERT_API_SERVER']
  c.key = ENV['EKISPERT_API_KEY']
  c.proxy_server = "proxy.val.co.jp"
  c.proxy_port = 8080
end

Ekisuke::Connection.logger = Logger.new(File::NULL)