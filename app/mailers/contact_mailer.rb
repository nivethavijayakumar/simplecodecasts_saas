class ContactMailer < ActiveMailer::Base
    default to: 'nivetha_vijay@rocketmail.com'
    
    def contact_email(name, email, body)
        
        @name = name
        @email = email
        @body = body
        
        mail(from: email, subject: 'Contact form Message')
    end
end
