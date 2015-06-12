require_relative('rolodex.rb')

class CRM
  attr_reader :name

  def self.run(name) #self.method_name creates a class method
    my_crm = CRM.new(name) #when you call new on a class- inside of hte class it calls initalize (when you call new initalize method is automatic)
    my_crm.main_menu
  end #this instatiates the class and will run the program so at the botton you can write CRM.run and program will work

  def initialize(name)
    @name = name #assigns local variables to instance variables using the @ symbol
    @rolodex = Rolodex.new
  end


  def print_main_menu
    puts "[1] add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact "
    puts "[6] Exit"
  end

  def choose_option(choice)


    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_contact
    when 4 then display_attribute
    when 5 then delete_contact
    when 6
      puts "Goodbye"
      exit
    else
      puts "I'm sorry #{first_name}, I'm afraid I can't do that"
    end
  end

  def main_menu
    @rolodex.add_contact("a", "b", "c", "d")
    @rolodex.add_contact("e", "f", "g", "h")
    @rolodex.add_contact("i", "j", "k", "l")

    puts "Welcome to #{@name}"
    while true
      print_main_menu

      print "Select an option:"
      input = gets.chomp.to_i



      choose_option(input)
    end
  end

  def add_contact
    puts "Adding a contact"
    print "First name:"
    first_name = gets.chomp

    print "Last name:"
    last_name = gets.chomp

    print "Email:"
    email = gets.chomp

    print "Notes:"
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)

  end

  def edit_contact
    puts "what is your id"
      id = gets.chomp.to_i
    puts "what would you like to edit"
      info_edit = gets.chomp
    puts "what is the new piece of information"
      new_information = gets.chomp

      case info_edit
      when "last name" then @rolodex.edit_last(id, new_information)
      when "first name" then @rolodex.edit_first(id, new_information)
      when "email" then @rolodex.edit_email(id, new_information)
      when "notes" then @rolodex.edit_notes(id, new_information)
      else puts "that field does not exist"
      end
      print "information updated"
    # print "Last name:"
    # last_name = gets.chomp

  end

  def display_contact
    @rolodex.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.notes}"
    end
  end

  def display_attribute
    @rolodex.all.each do |contact|
      puts " #{@@id} #{contact.first_name} #{contact.last_name}, #{contact.email}, #{contact.notes}"
    end
  end

end



CRM.run("my_crm")
