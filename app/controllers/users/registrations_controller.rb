class Users::RegistrationsController < Devise::RegistrationsController
  #Extend default Devise gem behaviour so that
  # users signing up with the Pro account (Plan ID 2)
  #save with a special Stripe subscription function 
  #Otherwise Devise sign ups user as usual
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_payment
        else
          resource.save
        end
      end
    end
  end
end
