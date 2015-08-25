class ContactsController < ApplicationController

	def new
		@contact = Contact.new
		
	end	

	def create 
		@contact = Contact.new(contact_params)
		
		if @contact.valid?

		ShareMailer.savings(@contact).deliver
			redirect_to contacts_path, notice:  'The savings are in route!'
		else
			flash[:alert] = 'Cannot send message.'
		render :new
		end
	end				

private

	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end	

end	