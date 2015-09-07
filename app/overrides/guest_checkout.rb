Deface::Override.new( :virtual_path => 'spree/orders/show',
                      :name         => 'add_registration_form_in_order_complete_page',
                      :insert_bottom=> '.result-item',
                      :partial      => 'spree/orders/reg_after_order',
                      :disabled     => true,
                      :original     => '22fcb5cfe62977684eb18c70593bd659d31a8859')
