module PrestaDane

    $customer1  = Hash[
        :id_default_group => 3,                                     
        :id_lang => 1,                                     
        :newsletter_date_add => "0000-00-00 00:00:00",                 
        :ip_registration_newsletter => "",                                    
        :last_passwd_gen => "2022-07-07 04:59:11",                 
        :secure_key => "09dbbc486ceeb311e0d7814915f947fc",    
        :deleted => 0,                                     
        :passwd => "prestashop",                         
        :lastname => "Morawski",                            
        :firstname => "Kacper",                              
        :email => "kacper.morawski3@wp.pl",              
        :id_gender => 1,                                     
        :birthday => "0000-00-00",                          
        :newsletter => 0,                                     
        :optin => 1,                                     
        :website =>"",                                    
        :company => "",                                    
        :siret => "",                                    
        :ape => "",                                    
        :outstanding_allow_amount => "0.000000",                            
        :show_public_prices => 0,                                     
        :id_risk => 0,                                     
        :max_payment_days => 0,                                     
        :active => 0,                                     
        :note => "",                                    
        :is_guest => 0,                                     
        :id_shop => 1,                                     
        :id_shop_group => 1,                                     
        :date_add => "2022-07-07 10:59:11",                 
        :date_upd => "2022-07-07 10:59:11",                 
        :reset_password_token => "",                                    
        :reset_password_validity =>"0000-00-00 00:00:00",                 
        :id_group => 3                                      
    ]

    $language = 
    Hash[
        :name => "Polish",
        :iso_code => "pl",
        :locale => "pl-PL",
        :language_code => "pl-pl",
        :active => 0,
        :is_rtl => 0,
        :date_format_lite =>"01/01/2022",
        :date_format_full => "01/01/2022 00:00:00"
    ]

    $order = Hash[
        :id_address_delivery => 5,
        :id_address_invoice => 5,
        :id_cart => 5,
        :id_currency => 1,
        :id_lang => 1,
        :id_customer => 2,
        :id_carrier => 2,
        :current_state => 10,
        :module => "ps_wirepayment",
        :invoice_number => 0,
        :invoice_date =>"0000-00-00 00:00:00",
        :delivery_number => 0,
        :delivery_date => "0000-00-00 00:00:00",
        :valid => 0,
        :date_add => "2022-07-11 09:17:27",
        :date_upd => "2022-07-11 09:17:28",
        :shipping_number => "true",
        :note => "",
        :id_shop_group => 1,
        :id_shop => 1,
        :secure_key => "b44a6d9efd7a0076a0fbce6b15eaf3b1",
        :payment => "Bank wire",
        :recyclable => 0,
        :gift => 0,
        :gift_message => "",
        :mobile_theme => 0,
        :total_discounts => 0.000000,
        :total_discounts_tax_incl => 0.000000,
        :total_discounts_tax_excl => 0.000000,
        :total_paid => 20.900000,
        :total_paid_tax_incl => 27.300000,
        :total_paid_tax_excl => 25.900000,
        :total_paid_real => 0.000000,
        :total_products => 18.900000,
        :total_products_wt => 18.900000,
        :total_shipping => 7.000000,
        :total_shipping_tax_incl => 8.400000,
        :total_shipping_tax_excl => 7.000000,
        :carrier_tax_rate => 0.000,
        :total_wrapping => 0.000000,
        :total_wrapping_tax_incl => 0.000000,
        :total_wrapping_tax_excl => 0.000000,
        :round_mode => 0,
        :round_type => 0,
        :conversion_rate => 1.000000,
        :reference => "KHWLILZLL",
        :order_row  =>"order_row", 
        :virtualEntity => "true",
        :product_id => 7,
        :product_attribute_id => 25,
        :product_quantity => 1,
        :product_name => "Brown bear cushion Color : Black",
        :product_reference => "demo_16",
        :product_ean13 => "",
        :product_isbn => "",
        :product_upc => "",
        :product_price => 18.900000,
        :id_customization => 0,
        :unit_price_tax_incl => 18.900000,
        :unit_price_tax_excl => 18.900000
    ]   




    $carts = 
    Hash[
        :id_address_delivery => 5,
        :id_address_invoice => 5,
        :id_currency => 1,
        :id_customer => 2,
        :id_guest => 1,
        :id_lang => 1,
        :id_shop_group => 1,
        :id_shop => 1,
        :id_carrier => 2,
        :recyclable => 0,
        :gift => 0,
        :gift_message => "",
        :mobile_theme => 0,
        :delivery_option => "{\"3\":\"2,\"}",
        :secure_key => "b44a6d9efd7a0076a0fbce6b15eaf3b1",
        :allow_seperated_package => 0,
        :date_add => "2022-07-11 09:17:24",
        :date_upd => "2022-07-11 09:17:24",
        :cart_row => "cart_row",
        :virtualEntity => "true",
        :id_product => 15,
        :id_product_attribute => 23,
        :id_address_delivery_1 => 3,
        :id_customization => 0,
        :quantity => 1
   ]

   $order_payment = Hash[
    :order_reference => "XKBKNABJK",
    :id_currency => 1,
    :amount => 61.800000,
    :payment_method => "Payment by check",
    :conversion_rate => 1.000000,
    :transaction_id => 1,
    :card_number => "12345678901234567890123456",
    :card_brand => "Visa",
    :card_expiration => "08/22",
    :card_holder=> "Morawski",
    :date_add => "0000-00-00 00:00:00"
   ]
    
end

# :product_id => 2,
        # :product_attribute_id => 9,
        # :product_quantity => 1,
        # :product_name =>"Hummingbird printed sweater - Color : White, Size : S",
        # :product_reference => "demo_3",
        # :product_ean13 => "",
        # :product_isbn => "",
        # :product_upc => "",
        # :product_price => 35.900000,
        # :id_customization => 0,
        # :unit_price_tax_incl => "",
        # :unit_price_tax_excl => ""
    