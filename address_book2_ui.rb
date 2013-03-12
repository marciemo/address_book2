require 'active_record'
require './lib/contact'
require './lib/email'
require './lib/phone'
# require './lib/address'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

def welcome
  puts "Welcome to the Address Book!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a contact, 'l' to list your contacts."
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'e'
      exit
    else
      invalid
    end
  end
end

def add
  puts "Please enter the first name of your contact: "
  first_name = gets.chomp
  puts "Please enter the last name of your contact: "
  last_name = gets.chomp
  contact = Contact.new(:first_name => first_name, :last_name => last_name)
  if contact.save
    puts "'#{first_name} #{last_name}' has been added to your Address Book."
    add_info(contact)
  else
    puts "That was not a valid name:"
    task.errors.full_messages.each {|message| puts message}
  end
end
  

def add_info(contact)
  what_info = nil
  until what_info == 'f'
    puts "Press 'e' to add an email address, 'p' to add a phone number, 'a' to add a mailing address or 'f' to finish."
    what_info = gets.chomp
    case what_info
    when 'e'
      add_email(contact)
    when 'p'
      add_phone(contact)
    when 'a'
      add_address(contact)
    when 'f'
      finish(contact)
    else
      invalid
    end
  end
end

def finish(contact)
  puts "The following information has been added to your address book.\n\n"
  display_all_contact_info
end

def add_email(contact)
  puts "Please enter the type of email for your contact (home/work/other): "
  category = gets.chomp
  puts "Please enter the email address: "
  email_address = gets.chomp
  email = Email.new(:email_address => email_address, :category => category, :contact_id => contact.id)
  if email.save
    puts "#{email_address} has been added for #{contact.first_name} #{contact.last_name}."
  else
    puts "That was not a valid email address."
    task.errors.full_messages.each {|message| puts message}
  end
end

def add_phone(contact)
  puts "Please enter the type of phone number for your contact\n(home/work/mobile/other): "
  category = gets.chomp
  puts "Please enter the phone number (xxx-xxx-xxxx): "
  phone_number = gets.chomp
  phone = Phone.new(:number => phone_number, :category => category, :contact_id => contact.id)
  if phone.save
    puts "#{category.capitalize!} phone: #{phone_number}, has been added for #{contact.first_name} #{contact.last_name}."
  else
    puts "That was not a valid phone number."
    task.errors.full_messages.each {|message| puts message}
  end
end

def add_address(contact)

end

def list
  puts "Here is everyone in your Address Book:\n\n"
  contacts = Contact.all
  contacts.each {|contact| puts contact.first_name + " " + contact.last_name}
end

def invalid
  "Please choose a valid entry."
end

welcome