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
        :email => "kacper.morawski1@wp.pl",              
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
        :active => 1,                                     
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

    $stock_available = Hash[
        :id_product => 20,
        :id_product_attribute => 0,
        :id_shop => 1,
        :id_shop_default =>1,
        :quantity => 1000,
        :depends_on_stock => 0,
        :out_of_stock => 2,
        :location => ""
    ]

    $cart = Hash[
        :id_address_delivery => 1,
        :id_address_invoice => 1,
        :id_currency => 1,
        :id_customer => 1,
        :id_guest => 0,
        :id_lang => 1,
        :id_shop_group => 1,
        :id_shop => 1,
        :id_carrier => 1,
        :recyclable => 0,
        :gift => 0,
        :gift_message => "",
        :mobile_theme => 0,
        :delivery_option => "{\"3\":\"2,\"}",
        :secure_key => "b44a6d9efd7a0076a0fbce6b15eaf3b1",
        :allow_seperated_package => 0,
        :date_add => "2022-07-15 09:17:24",
        :date_upd => "2022-07-22 09:17:24",
        :id_product => 22,
        :id_product_attribute => 0,
        :id_address_delivery1 => 1,
        :id_customization => 0,
        :quantity => 1
   ]

    $order = Hash[
        :id_address_delivery => 5,
        :id_address_invoice => 5,
        :id_currency => 1,
        :id_lang => 1,
        :id_customer => 1,
        :id_carrier => 2,
        :current_state => 1,
        :modulee => "ps_wirepayment",
        :invoice_number => 1,
        :invoice_date =>"",
        :delivery_number => 0,
        :delivery_date =>"",
        :valid => 0,
        :date_add => "2022-07-15 09:17:27",
        :date_upd => "2022-07-22 09:17:28",
        :shipping_number => "",
        :note => "",
        :id_shop_group => 1,
        :id_shop => 1,
        :secure_key => "b44a6d9efd7a0076a0fbce6b15eaf3b1",
        :payment => "Bank wire",
        :recyclable => 0,
        :gift => 0,
        :gift_message => "",
        :mobile_theme => 0,
        :total_discounts => "",
        :total_discounts_tax_incl => "",
        :total_discounts_tax_excl => "",
        :total_paid => "25.000000",
        :total_paid_tax_incl => "",
        :total_paid_tax_excl => "",
        :total_paid_real => "25.000000",
        :total_products => "25.000000",
        :total_products_wt => "25.000000",
        :total_shipping => "",
        :total_shipping_tax_incl => "",
        :total_shipping_tax_excl => "",
        :carrier_tax_rate => "",
        :total_wrapping => "",
        :total_wrapping_tax_incl => "",
        :total_wrapping_tax_excl => "",
        :round_mode => 2,
        :round_type => 2,
        :conversion_rate => 1.000000,
        :reference => "",
        :product_id => 22,
        :product_attribute_id => 1,
        :product_quantity => 1,
        :product_name => "Polska Gurom",
        :product_reference => "demo-100",
        :product_ean13 => "",
        :product_isbn =>"",
        :product_upc =>"",
        :product_price => "",
        :id_customization => 0 ,
        :unit_price_tax_incl => "",
        :unit_price_tax_excl => ""
    ]   

    $order_update = Hash[
        :id =>26,
        :id_address_delivery => 5,
        :id_address_invoice => 5,
        :id_cart => 18,
        :id_currency => 1,
        :id_lang => 1,
        :id_customer => 1,
        :id_carrier => 2,
        :current_state => 1,
        :modulee => "ps_wirepayment",
        :invoice_number => 1,
        :invoice_date =>"0000-00-00 00:00:00",
        :delivery_number => 0,
        :delivery_date => "0000-00-00 00:00:00",
        :valid => 0,
        :date_add => "2022-07-15 09:17:27",
        :date_upd => "2022-07-22 09:17:28",
        :shipping_number => "",
        :note => "",
        :id_shop_group => 1,
        :id_shop => 1,
        :secure_key => "b44a6d9efd7a0076a0fbce6b15eaf3b1",
        :payment => "Payments by check",
        :recyclable => 0,
        :gift => 0,
        :gift_message => "",
        :mobile_theme => 0,
        :total_discounts => "",
        :total_discounts_tax_incl => "",
        :total_discounts_tax_excl => "",
        :total_paid => "25.000000",
        :total_paid_tax_incl => "",
        :total_paid_tax_excl => "",
        :total_paid_real => "25.000000",
        :total_products => "25.000000",
        :total_products_wt => "25.000000",
        :total_shipping => "",
        :total_shipping_tax_incl => "",
        :total_shipping_tax_excl => "",
        :carrier_tax_rate => "",
        :total_wrapping => "",
        :total_wrapping_tax_incl => "",
        :total_wrapping_tax_excl => "",
        :round_mode => 0,
        :round_type => 0,
        :conversion_rate => 1.000000,
        :reference => "",
        :product_id => 20,
        :product_attribute_id => 1,
        :product_quantity => 1,
        :product_name => "Polska Gurom",
        :product_reference => "demo-100",
        :product_ean13 => "",
        :product_isbn =>"",
        :product_upc =>"",
        :product_price => "",
        :id_customization => 0 ,
        :unit_price_tax_incl => "",
        :unit_price_tax_excl => ""
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
        :price=>25.000000,
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
        :name=>"Nowy przedmiot",
        #:name1=>"",
        :description=>"alamakota",
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

    $employee = Hash[
        :id_lang => 1,
        :last_passwd_gen => "2022-07-19 03:17:31",
        :stats_date_from => "2022-06-19",
        :stats_date_to => "2022-07-19",
        :stats_compare_from => "2022-07-19 03:17:31",
        :stats_compare_to => "2022-07-19 03:17:31",
        :passwd => "presta",
        :lastname => "B",
        :firstname => "B",
        :email => "root1@root.com",
        :active => 1,
        :id_profile =>2,
        :bo_color => "",
        :default_tab =>1,
        :bo_theme => "default",
        :bo_css => "theme.css",
        :bo_width => 0,
        :bo_menu => 1,
        :stats_compare_option => 1,
        :preselect_date_range => "",
        :id_last_order => 0,
        :id_last_customer_message => 0,
        :id_last_customer => 0,
        :reset_password_token => "",
        :reset_password_validity => "0000-00-00 00:00:00",
        :has_enabled_gravatar => 0
    ]

    $configuration = Hash[
        :value => 1,
        :name => "ALE",
        :id_shop_group => "",
        :id_shop =>"",
        :date_add =>"2022-07-19 09:17:24",
        :date_upd =>"2022-07-19 09:17:24"
    ]

    $translated_configurations = Hash[
        :value => "#IN",
        :date_add => "2022-07-19 03:17:31",
        :date_upd => "2022-07-19 03:17:31",
        :name => "PS_INVOICE_KEK",
        :id_shop_group => '',
        :id_shop =>''

    ]

    $tax_rule_group = Hash[
        :name => "PL- PODATEK 200%",
        :active => 1,
        :deleted =>0,
        :date_add =>"2022-07-19 09:17:29",
        :date_upd =>"2022-07-19 09:17:29"
    ]

    $tax_rule = Hash[
        :id_tax_rules_group =>1,
        :id_state =>4,
        :id_country =>20,
        :zipcode_from =>0,
        :zipcode_to =>0,
        :id_tax =>53,
        :behavior =>1,
        :description =>""
    ]

    $tax = Hash[
        :rate => 10.000,
        :active => 1,
        :deleted => 0,
        :name => "NOWY TAX"
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

    $address = Hash[
        :id_customer => 1,
        :id_manufacturer =>0,
        :id_supplier =>0,
        :id_warehouse =>0,
        :id_country =>21,
        :id_state =>0,
        :aliass =>"KACPER",
        :company =>"KACPER",
        :lastname =>"KACPER",
        :firstname =>"KACPER",
        :vat_number =>0000,
        :address1 =>"PAPAP",
        :address2 =>"",
        :postcode =>26300,
        :city =>"OPOCZNO",
        :other =>'',
        :phone =>978654321,
        :phone_mobile =>123456789,
        :dni =>0000,
        :deleted =>0,
        :date_add =>"2022-07-19 09:18:22",
        :date_upd =>"2022-07-19 09:18:22"
    ]

    $contact = Hash[
        :email => "root3@root.com",
        :customer_service => 1,
        :name => "JEDNAK NIE",
        :desciption => "AAAA"
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


    $carrier = Hash[
        :deleted => 0,
        :is_module => 0,
        :id_tax_rules_group => 1,
        :id_reference => 1,
        :name => "MA MA",
        :active => 1,
        :is_free => 1,
        :url => '',
        :shipping_handling => 0,
        :shipping_external =>0,
        :range_behavior =>0,
        :shipping_method =>1,
        :max_width =>0,
        :max_height =>0,
        :max_depth =>0,
        :max_weight =>0.000000,
        :grade =>0,
        :external_module_name =>'',
        :need_range =>0,
        :position =>0,
        :delay =>"Carrier 1 ala"
    ]

    $cart_rule = Hash[
        :id_customer => 1,
        :date_from => "2022-07-19 09:18:22",
        :date_to => "2022-07-19 09:18:22",
        :description => "",
        :quantity => 1,
        :quantity_per_user => 1,
        :priority => 1,
        :partial_use => 1,
        :code => '',
        :minimum_amount => 1,
        :minimum_amount_tax =>0,
        :minimum_amount_currency =>0,
        :minimum_amount_shipping =>0,
        :country_restriction =>0,
        :carrier_restriction =>0,
        :group_restriction =>0,
        :cart_rule_restriction =>0,
        :product_restriction =>0,
        :shop_restriction =>0,
        :free_shipping => 1,
        :reduction_percent =>0,
        :reduction_amount =>0,
        :reduction_tax =>0,
        :reduction_currency =>0,
        :reduction_product =>0,
        :reduction_exclude_special =>0,
        :gift_product =>0,
        :gift_product_attribute =>0,
        :highlight =>0,
        :active =>1,
        :date_add =>"2022-07-19 09:18:22",
        :date_upd =>"2022-07-19 09:18:22",
        :name =>"LALASDAS"
    ]

    

   $stock_availables = Hash[
        :id_product =>21,
        :id_product_attribute => 19,
        :id_shop => 1,
        :id_shop_group =>0,
        :quantity => 300,
        :depends_on_stock =>0,
        :out_of_stock =>1,
        :location =>""
   ]
    
   $order_states = Hash[
    :unremovable =>1,
    :delivery =>0,
    :hidden =>0,
    :send_email =>1,
    :module_name =>"",
    :invoice =>0,
    :color =>"#34209E",
    :logable =>0,
    :shipped =>0,
    :paid =>0,
    :pdf_delivery =>0,
    :pdf_invoice =>0,
    :deleted =>0,
    :name => "cos tam",
    :template => "outstock"]

    $order_slip = Hash[
    :id_customer => 1,
    :id_order => 5,
    :conversion_rate => 1.000000,
    :total_products_tax_excl => 0.000000,
    :total_products_tax_incl =>0.000000,
    :total_shipping_tax_excl =>0.000000,
    :total_shipping_tax_incl =>0.000000,
    :amount => 1,
    :shipping_cost => 0.000000,
    :shipping_cost_amount =>0.000000,
    :partial => 0,
    :date_add => "2022-07-14 09:01:15",
    :date_upd => "2022-07-14 09:01:15",
    :order_slip_type => 1,
    :id_order_detail => 1,
    :product_quantity => 1,
    :amount_tax_excl => 0.000000,
    :amount_tax_incl =>0.000000
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
        :date_add => "2022-07-14 09:01:15"
       ]

    $order_invoice = Hash[
        :id_order => 1,
        :number => 1,
        :delivery_number =>1,
        :delivery_date =>"2022-07-14 09:01:15",
        :total_discount_tax_excl => 0.000000,
        :total_discount_tax_incl => 0.000000,
        :total_paid_tax_excl => 0.000000,
        :total_paid_tax_incl => 0.000000,
        :total_products => 0.000000,
        :total_products_wt => 0.000000,
        :total_shipping_tax_excl => 0.000000,
        :total_shipping_tax_incl => 0.000000,
        :shipping_tax_computation_method => 0.000000,
        :total_wrapping_tax_excl => 0.000000,
        :total_wrapping_tax_incl => 0.000000,
        :shop_address =>"lalalala",
        :note =>"",
        :date_add =>"2022-07-14 09:01:15"]

    $order_history = Hash[
        :id_employee =>1,
        :id_order_state =>1,
        :id_order => 1,
        :date_add =>"2022-07-14 09:01:15"
    ]

    $order_detail = Hash[
        :id_order =>1,
        :product_id =>20,
        :product_attribute_id =>1,
        :product_quantity_reinjected =>0,
        :group_reduction =>0.00,
        :discount_quantity_applied =>0,
        :download_hash =>"",
        :download_deadline =>"0000-00-00 00:00:00",
        :id_order_invoice =>0,
        :id_warehouse =>0,
        :id_shop =>1,
        :id_customization =>0,
        :product_name =>"cokolwiek",
        :product_quantity =>1,
        :product_quantity_in_stock =>1,
        :product_quantity_return =>0,
        :product_quantity_refunded =>0,
        :product_price =>12.900000,
        :reduction_percent =>0.00,
        :reduction_amount =>0.000000,
        :reduction_amount_tax_incl =>0.000000,
        :reduction_amount_tax_excl =>0.000000,
        :product_quantity_discount =>0.000000,
        :product_ean13 =>"",
        :product_isbn =>"",
        :product_upc =>"",
        :product_mpn =>"",
        :product_reference =>"demo-100",
        :product_supplier_reference =>"",
        :product_weight =>0.000000,
        :tax_computation_method =>0,
        :id_tax_rules_group =>0,
        :ecotax =>0.000000,
        :ecotax_tax_rate => 0.000,
        :download_nb =>0,
        :unit_price_tax_incl =>12.900000,
        :unit_price_tax_excl =>12.900000,
        :total_price_tax_incl =>12.900000,
        :total_price_tax_excl =>12.900000,
        :total_shipping_price_tax_excl =>0.000000,
        :total_shipping_price_tax_incl =>0.000000,
        :purchase_supplier_price =>0.000000,
        :original_product_price =>12.900000,
        :original_wholesale_price =>0.000000,
        :total_refunded_tax_excl =>0.000000,
        :total_refunded_tax_incl =>0.000000,
        :tax_id => 1
    ]

    $order_cart_rule = Hash[
        :id_order =>1,
        :id_cart_rule =>1,
        :id_order_invoice =>1,
        :name =>"cart rule",
        :value =>0.000000,
        :value_tax_excl => 0.000000,
        :free_shipping =>0,
        :deleted =>0
    ]

    $order_carrier = Hash[
        :id_order =>1,
        :id_carrier => 1,
        :id_order_invoice =>1,
        :weight =>0.000000,
        :shipping_cost_tax_excl =>0.000000,
        :shipping_cost_tax_incl =>0.000000,
        :tracking_number => 0,
        :date_add =>"2022-07-14 09:01:15"
    ]

end

    