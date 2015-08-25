class ShareMailer < ActionMailer::Base
  default from: "wildgenius99@gmail.com"

  def savings(contact)
  	@contact = contact
  	@url = "http://0.0.0.0:3000"
  	mail to: "#{contact.email}",
  			from: "wildgenius99@gmail.com",
  				subject: "Brand new savings at Mall is Life!"

  end	
end
