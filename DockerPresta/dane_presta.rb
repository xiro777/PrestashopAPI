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
        :id_cart => 6,
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
        :total_paid => 30.900000,
        :total_paid_tax_incl => 30.300000,
        :total_paid_tax_excl => 30.900000,
        :total_paid_real => 0.000000,
        :total_products => 23.900000,
        :total_products_wt => 23.900000,
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
        :reference => "",
        :order_row  =>"order_row", 
        :virtualEntity => "true",
    ]   
    $product= Hash[
        :id_manufacturer => 1,
        :id_supplier => 71,
        :id_category_default=>1,
        :new =>"",
        :cache_default_attribute =>0,
        :id_default_image =>'',
        :id_default_combination =>0,
        :id_tax_rules_group =>1,
        #:position_in_category =>"",
        :type =>"simple",
        :id_shop_default =>1,
        :reference => "demo_100",
        :supplier_reference =>"",
        :location =>"",
        :width => 3.000000,
        :height =>4.000000,
        :depth=>5.000000,
        :weight =>6.000000,
        :quantity_discount =>0,
        :ean13 => "00000145",
        :isbn => "",
        :upc=>"",
        :mpn=>"",
        :cache_is_pack=>0,
        :cache_has_attachments=>0,
        :is_virtual=>0,
        :state=>1,
        :additional_delivery_times=>1,
        :delivery_in_stock=>"",
        #:delivery_in_stock1=>"",
        :delivery_out_stock=>"",
        #:delivery_out_stock1=>"",
        :product_type => "",
        :on_sale=>0,
        :online_only=>0,
        :ecotax=>0.000000,
        :minimal_quantity=>1,
        :low_stock_threshold=>0,
        :low_stock_alert=>0,
        :price=>12.900000,
        :wholesale_price=>0.000000,
        :unity=>"",
        :unit_price_ratio=>0.000000,
        :additional_shipping_cost=>0.000000,
        :customizable=>0,
        :text_fields=>0,
        :uploadable_files=>0,
        :active=>1,
        :redirect_type=>"301-category",
        :id_type_redirected=>'',
        :available_for_order=>1,
        :available_date=>"0000-00-00",
        :show_condition=>0,
        :condition=>"new",
        :show_price=>1,
        :indexed=>0,
        :visibility=>"both",
        :advanced_stock_management=>0,
        :date_add=>"2022-07-13 10:17:01",
        :date_upd=>"2022-07-13 10:17:01",
        :pack_stock_type=>0,
        :meta_description=>"",
        #:meta_description1=>"",
        :meta_keywords=>"",
        #:meta_keywords1=>"",
        :meta_title=>"",
        #:meta_title1=>"",
        :link_rewrite=>"",
        #:link_rewrite1=>"",
        :name=>"Przedmiot 123",
        #:name1=>"",
        :description=>"dsadasdasdasdadsada",
        #:description1=>"",
        :description_short=>"aa",
        #:description_short1=>"",
        :available_now=>"",
        #:available_now1=>"",
        :available_later=>"",
        :available_later1=>"",
        :category_id=>10,
        :image_id=>'',
        :combination_id=>40,
        :product_option_value_id=>26,
        :product_features_id=>3,
        :product_feature_values_id=>11,
        :tag_id=>'',
        :stock_available_id =>'',
        :stock_available_id_product_attribute=>'',
        :attachment_id=>'',
        :product_accessories_id=>'',
        :product_bundle_id=>'',
        :product_attribute_id=>'',
        :quantity=>''
    ]

    $attachments = Hash[
        :file => "",
        :file_name => "",
        :file_size => 1,
        :mime => "",
        :name => "attachment_1",
        :name1 => "",
        :desciption =>"attach desc",
        :desciption1 =>"",
        :product_id => 10
    ]

    $categories = Hash[
        :id_parent => 0,
        :active => 1,
        :id_shop_default => 1,
        :is_root_category => 0,
        :position => 0,
        :date_add => "2022-07-14 08:59:49",
        :date_upd =>"2022-07-14 08:59:49",
        :name => "categoria-test",
        :name1 => "",
        :link_rewrite =>"",
        :link_rewrite1 =>"",
        :description =>"categoria desciption",
        :description1 =>"",
        :meta_title =>"",
        :meta_title1 =>"",
        :meta_description =>"",
        :meta_description1 =>"",
        :meta_keywords =>"",
        :meta_keywords1 =>"",
        :id_category => 2,
        :id_product =>25
    ]

    $combination = Hash[
    :id_product => 25,
    :location => 1,
    :ean13 => "",
    :isbn =>"",
    :upc =>"",
    :mpn =>"",
    :quantity => 100,
    :reference => "demo-100",
    :supplier_reference => "",
    :wholesale_price => 0.000000,
    :price => 0.000000,
    :ecotax => 0.000000,
    :weight => 0.000000,
    :unit_price_impact => 0.000000,
    :minimal_quantity => 1,
    :low_stock_threshold => "",
    :low_stock_alert => 0,
    :default_on => 1 ,
    :available_date => "0000-00-00",
    :id_product_option_value => 26,
    :id_image => 100
    ]

    $manufacturers = Hash[
        :active => 1,
        :name => "manu name",
        :date_add => "2022-07-14 09:01:15",
        :date_upd => "2022-07-14 09:01:15",
        :desciption => "a fajna fabryka",
        :desciption1 =>"",
        :short_description =>"",
        :short_description1 =>"",
        :meta_title =>"",
        :meta_title1 => "",
        :meta_description =>"",
        :meta_description1 => "",
        :meta_keywords =>"",
        :meta_keywords1 => "",
        :address_id => 6
    

    ]

    $tag = Hash[
        :id_lang => 1,
        :name => "tag1"
    ]

    $product_customization_fields = Hash[
        :id_product => 25,
        :type => 1,
        :required => 1,
        :is_module => 0,
        :is_deleted => 0,
        :name =>"ciekawe co to za pole",
        :name1 => ""
    ]

    $product_feature_values = Hash[
        :id_feature => 3,
        :custom => 0,
        :value => "pppppp",
        :value1 => ""
    ]

    $product_features = Hash[
        :position => 2,
        :name => "kota",
        :name1 => ""
    ]

    $product_option_values = Hash[
        :id_attribute_group =>1,
        :color => "x000000",
        :position => 2,
        :name => "halo",
        :name1 => ""
    ]

    $product_supplier = Hash[

    :id_product => 25,
    :id_product_attribute => 1,
    :id_supplier => 1,
    :id_currency => 1,
    :product_supplier_reference => "demo-11",
    :product_supplier_price_te => 5.490000

    ]

    $product_option = Hash[
        :is_color_group => 0,
        :group_type => "Select",
        :position => 0,
        :name => "SizeSize",
        :name1 => "",
        :public_name => "SizeSize",
        :public_name1 => "",
        :product_option_value => 1
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
        :id_product => 15,
        :id_product_attribute => 23,
        :id_address_delivery1 => 3,
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

   $stock_availables = Hash[
        :id_product =>25,
        :id_product_attribute => 19,
        :id_shop => 1,
        :id_shop_group =>0,
        :quantity => 300,
        :depends_on_stock =>0,
        :out_of_stock =>1,
        :location =>""
   ]
    
end

    