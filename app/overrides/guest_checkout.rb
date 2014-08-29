Deface::Override.new( :virtual_path => 'spree/orders/show',
                      :name         => 'add_registration_form_in_order_complete_page',
                      :insert_bottom=> '.result-item',
                      :partial      => 'spree/orders/reg_after_order',
                      :disabled     => false)
