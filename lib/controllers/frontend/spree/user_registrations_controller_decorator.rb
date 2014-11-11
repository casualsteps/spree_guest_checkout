Spree::UserRegistrationsController.class_eval do
  def create
    @user = build_resource(spree_user_params)
    if resource.save
      set_flash_message(:notice, :signed_up)
      sign_in(:spree_user, @user)
      session[:spree_user_signup] = true
      associate_user
      associate_past_orders
      associate_address
      associate_payment_profile
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

  # Associate the order's address to user's address
  def associate_address
    order = Spree::Order.where("email = ?", @user.email).order("created_at").last
    if order.present?
      @user.update_attributes(bill_address_id: order.billing_address.id, ship_address_id: order.shipping_address.id)
    end
  end

  # Associate the order's payment source to user's payment source
  def associate_payment_profile
    order = Spree::Order.where("email = ?", @user.email).order("created_at").last
    if order.try(:payments).present?
      payment_source = order.payments.last.source
      payment_source.update_attributes(user_id: @user.id)
    end
  end

end

