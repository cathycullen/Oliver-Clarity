if Rails.env == "development"
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true
  ActiveMerchant::Billing::Base.mode = :test

  login = "MF7551-99"
  password="xBoY5e3zseAPdLc0qnFFpzZPxLRmvk6l"
elsif Rails.env == "production"
  login = 'MF7551-99'
  password='xBoY5e3zseAPdLc0qnFFpzZPxLRmvk6l'
end
GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
      login: login,
      password: password
})