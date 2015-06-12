require_relative('contact.rb')



class Rolodex #class for sorting
  @@id = 1

  def initialize
    @contacts = [] #every instance of the crm should have an empty array so that the new information has a place to be stored inside th app
  end

  def add_contact(first_name, last_name, email, notes)
    contact = Contact.new(@@id, first_name, last_name, email, notes)
    @@id += 1

    @contacts << contact
  end

  def all
    @contacts
  end



  def find_contact(id)
    find_Contact = @contacts.find do |contact|
    id == contact.id
    end
    return find_Contact
  end

  def edit_last(id, new_last_name)
    edit_L = find_contact(id)
    edit_L.last_name = new_last_name
  end

  def edit_first(id, new_first_name)
    edit_F = find_contact(id)
    edit_F.first_name = new_first_name
  end

  def edit_email(id, new_email)
    edit_email = find_contact(id)
    edit_email.email = new_email
  end

  def edit_notes (id, new_notes)
    edit_N = find_contact(id)
    edit_N.notes = new_notes
  end


end


#must think about division of work in OO system - ie. is it the job of the contact, the rolodex or other
#contact- get input and
#rolodex job - store and organize the informatio