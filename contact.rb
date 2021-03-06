class Contact
  attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id

  def initialize(id, first_name, last_name, email, notes)
    @id = id
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes
  end

  def full_name
  "#{first_name} #{last_name }"
  end



end



#id must be unique so each contact has a unique indentifier --> therefore no need for defualt