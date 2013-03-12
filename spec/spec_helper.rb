require 'active_record'
require 'rspec'
require 'shoulda-matchers'
require 'contact'
require 'email'
require 'phone'
require 'address'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:all) do
    Contact.all.each {|contact| contact.destroy}
    Email.all.each {|email| email.destroy}
    Phone.all.each {|phone| phone.destroy}
    Address.all.each {|address| address.destroy}
  end
end