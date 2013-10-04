class ContactMailer < ActionMailer::Base
  default :from => "realestate034@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  
  def enquiry(contact, property)
    @contact = contact
    @property = property
    @message = "Hi builder #{property.builder.email}. #{contact.email} wants to enquiry your property"
   mail(:to => property.builder.email, :subject => @message)
  end
  
end