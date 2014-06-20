Deface::Override.new( :virtual_path => 'spree/orders/_complete',
                      :name         => 'add_registration_form_in_order_complete_page',
                      :insert_before=> 'ul[class="order-summary"]',
                      :partial      => 'spree/orders/reg_after_order',
                      :disabled     => false)
