Spree::UserRegistrationsController.class_eval do
  def create
    @user = build_resource(spree_user_params)
    if resource.save
      set_flash_message(:notice, :signed_up)
      sign_in(:spree_user, @user)
      session[:spree_user_signup] = true
      associate_user
      associate_past_orders
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords(resource)
      render :new
    end 
  end

  # Associate the user's past orders (probably just 1) with this ID
  def associate_past_orders
    orders = Spree::Order.where("email = ?", @user.email)
    unless orders == nil
      orders.each { |order|
        order.associate_user!(@user)
      }
    end
  end
end

