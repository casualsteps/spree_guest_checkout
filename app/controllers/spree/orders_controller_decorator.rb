Spree::OrdersController.class_eval do
  def show
    @order = Spree::Order.find_by_number!(params[:id])
  end

  private
    def check_authorization
      session[:access_token] = cookies.signed[:access_token] if cookies.signed[:access_token]
      session[:access_token] = params[:token] if params[:token]
      order = Spree::Order.find_by_number(params[:id]) || current_order

      if order
        authorize! :edit, order, session[:access_token]
      else
        authorize! :create, Spree::Order.new
      end
    end
end
