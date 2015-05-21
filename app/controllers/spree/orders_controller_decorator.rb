Spree::OrdersController.class_eval do

  def check_authorization
    cookies.permanent.signed[:guest_token] = params[:token] if params[:token]
    order = Spree::Order.find_by_number(params[:id]) || current_order

    #if url has ship_address_id we don't need token because it comes from the link in order confirm E-mail
    if order != nil and params[:ship_address_id] == order.ship_address_id.to_s
      cookies.signed[:guest_token] = order.guest_token
    end

    if order
      authorize! :edit, order, cookies.signed[:guest_token]
    else
      authorize! :create, Spree::Order
    end
  end
end
