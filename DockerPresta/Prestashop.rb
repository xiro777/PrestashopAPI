require 'open-uri'
require 'httparty'
require 'pp'
require 'json'
require 'uri'
require_relative 'dane_presta.rb'
require_relative 'creating_hashes.rb'

class Presta
    
    include HTTParty
    include PrestaDane
    include Create

    @auth = {username: "67I8CPY4MCCLPZYGBVR64QDV7QDILIII", password: ""}

    def initialize
        @api_url = "http://localhost:8080/api"
        
    end
    def self.getaddresses(id)
        address = HTTParty.get("http://localhost:8080/api/addresses/#{id}", basic_auth: @auth )
        puts address.body,address.code
    end

    def self.post_language(tab)
        language = HTTParty.post("http://localhost:8080/api/languages/",
            {
                body: 
                "<prestashop>
                    <language>
                        <id></id>
                        <name>#{tab[:name]}(#{tab[:name]})</name>
                        <iso_code>#{tab[:iso_code]}</iso_code>
                        <locale>#{tab[:locale]}</locale>
                        <language_code>#{tab[:language_code]}</language_code>
                        <active>#{tab[:active]}</active>
                        <is_rtl>#{tab[:is_rtl]}</is_rtl>
                        <date_format_lite>#{tab[:date_format_lite]}</date_format_lite>
                        <date_format_full>#{tab[:date_format_full]}</date_format_full>
                    </language>
                </prestashop>",

                basic_auth: @auth,
                header: 
                {
                    'Content-Type' => 'application/x-www-form-urlencoded',
                    "charset"=>'utf-8'
                }
            }
        )
        puts language.body, language.code 
    end

    def self.get_customer(id)
        cust = HTTParty.get("http://localhost:8080/api/customers/#{id}",
            {
                basic_auth: @auth,
                header: 
                {
                    'Content-Type' => 'application/x-www-form-urlencoded',
                    "charset"=>'utf-8'
                }
            }
        )
        puts cust.body, cust.code
    end
       
    def self.post_customer(customer)
        customer = HTTParty.post("http://localhost:8080/api/customers/",{
            body:
            "<prestashop>
                <customer>
                    <id></id>
                    <id_default_group href=\"http://localhost:8080/api/groups/\">#{customer[:id_default_group]}</id_default_group>
                    <id_lang href=\"http://localhost:8080/api/languages/\">#{customer[:id_lang]}</id_lang>
                    <newsletter_date_add>#{customer[:ip_registration_newsletter]}</newsletter_date_add>
                    <ip_registration_newsletter>#{customer[:ip_registration_newsletter]}</ip_registration_newsletter>
                    <last_passwd_gen>#{customer[:last_passwd_gen]}</last_passwd_gen>
                    <secure_key>#{customer[:secure_key]}</secure_key>
                    <deleted>#{customer[:deleted]}</deleted>
                    <passwd>#{customer[:passwd]}</passwd>
                    <lastname>#{customer[:lastname]}</lastname>
                    <firstname>#{customer[:firstname]}</firstname>
                    <email>#{customer[:email]}</email>
                    <id_gender>#{customer[:id_gender]}</id_gender>
                    <birthday>#{customer[:birthday]}</birthday>
                    <newsletter>#{customer[:newsletter]}</newsletter>
                    <optin>#{customer[:optin]}</optin>
                    <website>#{customer[:website]}</website>
                    <company>#{customer[:company]}</company>
                    <siret>#{customer[:siret]}</siret>
                    <ape>#{customer[:ape]}</ape>
                    <outstanding_allow_amount>#{customer[:outstanding_allow_amount]}</outstanding_allow_amount>
                    <show_public_prices>#{customer[:show_public_prices]}</show_public_prices>
                    <id_risk>#{customer[:id_risk]}</id_risk>
                    <max_payment_days>#{customer[:max_payment_days]}</max_payment_days>
                    <active>#{customer[:active]}</active>
                    <note>#{customer[:note]}</note>
                    <is_guest>#{customer[:is_guest]}</is_guest>
                    <id_shop>#{customer[:id_shop]}</id_shop>
                    <id_shop_group>#{customer[:id_shop_group]}</id_shop_group>
                    <date_add>#{customer[:date_add]}</date_add>
                    <date_upd>#{customer[:date_upd]}</date_upd>
                    <reset_password_token>#{customer[:reset_password_token]}</reset_password_token>
                    <reset_password_validity>#{customer[:reset_password_validity]}</reset_password_validity>
                    <associations>
                        <groups nodeType=\"group\" api=\"groups\">
                        <group href=\"http://localhost:8080/api/groups/\">
                        <id>#{customer[:id]}</id>
                        </group>
                        </groups>
                    </associations>
                </customer>
            </prestashop>",
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        }
        )
        puts customer.body, customer.code        
    end

    def self.delete_customer(id)
        cust = HTTParty.delete("http://localhost:8080/api/customers/#{id}",
        {
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
                
            }) 
        puts cust.code
    end    

    def self.update_customer(id,customer)
        cust = HTTParty.put("http://localhost:8080/api/customers/#{id}",
        {
            body: 
            "<prestashop>
                <customer>
                    <id>#{id}</id>
                    <id_default_group href=\"http://localhost:8080/api/groups/\">#{customer[:id_default_group]}</id_default_group>
                    <id_lang href=\"http://localhost:8080/api/languages/\">#{customer[:id_lang]}</id_lang>
                    <newsletter_date_add>#{customer[:ip_registration_newsletter]}</newsletter_date_add>
                    <ip_registration_newsletter>#{customer[:ip_registration_newsletter]}</ip_registration_newsletter>
                    <last_passwd_gen>#{customer[:last_passwd_gen]}</last_passwd_gen>
                    <secure_key>#{customer[:secure_key]}</secure_key>
                    <deleted>#{customer[:deleted]}</deleted>
                    <passwd>#{customer[:passwd]}</passwd>
                    <lastname>#{customer[:lastname]}</lastname>
                    <firstname>#{customer[:firstname]}</firstname>
                    <email>#{customer[:email]}</email>
                    <id_gender>#{customer[:id_gender]}</id_gender>
                    <birthday>#{customer[:birthday]}</birthday>
                    <newsletter>#{customer[:newsletter]}</newsletter>
                    <optin>#{customer[:optin]}</optin>
                    <website>#{customer[:website]}</website>
                    <company>#{customer[:company]}</company>
                    <siret>#{customer[:siret]}</siret>
                    <ape>#{customer[:ape]}</ape>
                    <outstanding_allow_amount>#{customer[:outstanding_allow_amount]}</outstanding_allow_amount>
                    <show_public_prices>#{customer[:show_public_prices]}</show_public_prices>
                    <id_risk>#{customer[:id_risk]}</id_risk>
                    <max_payment_days>#{customer[:max_payment_days]}</max_payment_days>
                    <active>#{customer[:active]}</active>
                    <note>#{customer[:note]}</note>
                    <is_guest>#{customer[:is_guest]}</is_guest>
                    <id_shop>#{customer[:id_shop]}</id_shop>
                    <id_shop_group>#{customer[:id_shop_group]}</id_shop_group>
                    <date_add>#{customer[:date_add]}</date_add>
                    <date_upd>#{customer[:date_upd]}</date_upd>
                    <reset_password_token>#{customer[:reset_password_token]}</reset_password_token>
                    <reset_password_validity>#{customer[:reset_password_validity]}</reset_password_validity>
                    <associations>
                        <groups nodeType=\"group\" api=\"groups\">
                        <group href=\"http://localhost:8080/api/groups/\">
                        <id>#{customer[:id]}</id>
                        </group>
                        </groups>
                    </associations>
                </customer>
            </prestashop>",
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        })
        puts cust.code
    end

   def self.post_order_payment(order_payment)
        payment = HTTParty.post("http://localhost:8080/api/order_payments/",
        {
            body: 
            "<prestashop>
                <order_payment>
                <id></id>   
                    <order_reference>#{order_payment[:order_reference]}</order_reference>       
                    <id_currency>#{order_payment[:id_currency]}</id_currency>
                    <amount>#{order_payment[:amount]}</amount>
                    <payment_method>#{order_payment[:payment_method]}</payment_method>
                    <conversion_rate>#{order_payment[:conversion_rate]}</conversion_rate>
                    <transaction_id>#{order_payment[:transaction_id]}</transaction_id>
                    <card_number>#{order_payment[:card_number]}</card_number>
                    <card_brand>#{order_payment[:card_brand]}</card_brand>
                    <card_expiration>#{order_payment[:card_expiration]}</card_expiration>
                    <card_holder>#{order_payment[:card_holder]}</card_holder>
                    <date_add>#{order_payment[:date_add]}</date_add>
                </order_payment>
            </prestashop>",
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        })
        puts cust.body,cust.code
   end

    
    def self.post_carts(carts)
        cart = HTTParty.post("http://localhost:8080/api/carts/",
        {
            body:
            "<prestashop>
                <cart>
                <id></id>
                <id_address_delivery href=\"http://localhost:8080/api/addresses/\">#{carts[:id_address_delivery]}</id_address_delivery>
                <id_address_invoice href=\"http://localhost:8080/api/addresses/\">#{carts[:id_address_invoice]}</id_address_invoice>
                <id_currency href=\"http://localhost:8080/api/currencies/\">#{carts[:id_currency]}</id_currency>
                <id_customer href=\"http://localhost:8080/api/customers/\">#{carts[:id_customer]}</id_customer>
                <id_guest href=\"http://localhost:8080/api/guests/\">#{carts[:id_guest]}</id_guest>
                <id_lang href=\"http://localhost:8080/api/languages/\">#{carts[:id_lang]}</id_lang>
                <id_shop_group>#{carts[:id_shop_group]}</id_shop_group>
                <id_shop>#{carts[:id_shop]}</id_shop>
                <id_carrier>#{carts[:id_carrier]}</id_carrier>
                <recyclable>#{carts[:recyclable]}</recyclable>
                <gift>#{carts[:gift]}</gift>
                <gift_message>#{carts[:gift_message]}</gift_message>
                <mobile_theme>#{carts[:mobile_theme]}</mobile_theme>
                <delivery_option>#{carts[:delivery_option]}</delivery_option>
                <secure_key>#{carts[:secure_key]}</secure_key>
                <allow_seperated_package>#{carts[:allow_seperated_package]}</allow_seperated_package>
                <date_add>#{carts[:date_add]}</date_add>
                <date_upd>#{carts[:date_upd]}</date_upd>
                    <associations>
                        <cart_rows nodeType=\"#{carts[:cart_row]}\" virtualEntity=\"#{carts[:virtualEntity]}\">
                            <#{carts[:cart_row]}>
                            <id_product href=\"http://localhost:8080/api/products/\">#{carts[:id_product]}</id_product>
                            <id_product_attribute href=\"http://localhost:8080/api/combinations/\">#{carts[:id_product_attribute]}</id_product_attribute>
                            <id_address_delivery href=\"http://localhost:8080/api/addresses/\">#{carts[:id_address_delivery_1]}</id_address_delivery>
                            <id_customization href=\"http://localhost:8080/api/customizations/\">#{carts[:id_customization]}</id_customization>
                            <quantity>#{carts[:quantity]}</quantity>
                            </#{carts[:cart_row]}>
                        </cart_rows>
                    </associations>
                </cart>
            </prestashop>",
            
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        })
        puts cart.body,cart.code
    end

    def self.delete_carts(id)
        carts = HTTParty.delete("http://localhost:8080/api/carts/#{id}",
        {
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        })
        puts carts.body,carts.code

    end

    def self.post_order(order)
        order = HTTParty.post("http://localhost:8080/api/orders/",
            {
                body:
                "<prestashop>
                <order>
                <id></id>
                <id_address_delivery href=\"http://localhost:8080/api/addresses/\">#{order[:id_address_delivery]}</id_address_delivery>
                <id_address_invoice href=\"http://localhost:8080/api/addresses/\">#{order[:id_address_invoice]}</id_address_invoice>
                <id_cart href=\"http://localhost:8080/api/carts/\">#{order[:id_cart]}</id_cart>
                <id_currency href=\"http://localhost:8080/api/currencies/\">#{order[:id_currency]}</id_currency>
                <id_lang href=\"http://localhost:8080/api/languages/\">#{order[:id_lang]}</id_lang>
                <id_customer href=\"http://localhost:8080/api/customers/\">#{order[:id_customer]}</id_customer>
                <id_carrier href=\"http://localhost:8080/api/carriers/\">#{order[:id_carrier]}</id_carrier>
                <current_state href=\"http://localhost:8080/api/order_states/\">#{order[:current_state]}</current_state>
                <module>#{order[:module]}</module>
                <invoice_number>#{order[:invoice_number]}</invoice_number>
                <invoice_date>#{order[:invoice_date]}</invoice_date>
                <delivery_number>#{order[:delivery_number]}</delivery_number>
                <delivery_date>#{order[:delivery_date]}</delivery_date>
                <valid>#{order[:valid]}</valid>
                <date_add>#{order[:date_add]}</date_add>
                <date_upd>#{order[:date_upd]}</date_upd>
                <shipping_number notFilterable=\"#{order[:shipping_number]}\"></shipping_number>
                <note>#{order[:note]}</note>
                <id_shop_group>#{order[:id_shop_group]}</id_shop_group>
                <id_shop>#{order[:id_shop]}</id_shop>
                <secure_key>#{order[:secure_key]}</secure_key>
                <payment>#{order[:payment]}</payment>
                <recyclable>#{order[:recyclable]}</recyclable>
                <gift>#{order[:gift]}</gift>
                <gift_message>#{order[:gift_message]}</gift_message>
                <mobile_theme>#{order[:mobile_theme]}</mobile_theme>
                <total_discounts>#{order[:total_discounts]}</total_discounts>
                <total_discounts_tax_incl>#{order[:total_discounts_tax_incl]}</total_discounts_tax_incl>
                <total_discounts_tax_excl>#{order[:total_discounts_tax_excl]}</total_discounts_tax_excl>
                <total_paid>#{order[:total_paid]}</total_paid>
                <total_paid_tax_incl>#{order[:total_paid_tax_incl]}</total_paid_tax_incl>
                <total_paid_tax_excl>#{order[:total_paid_tax_excl]}</total_paid_tax_excl>
                <total_paid_real>#{order[:total_paid_real]}</total_paid_real>
                <total_products>#{order[:total_products]}</total_products>
                <total_products_wt>#{order[:total_products_wt]}</total_products_wt>
                <total_shipping>#{order[:total_shipping]}</total_shipping>
                <total_shipping_tax_incl>#{order[:total_shipping_tax_incl]}</total_shipping_tax_incl>
                <total_shipping_tax_excl>#{order[:total_shipping_tax_excl]}</total_shipping_tax_excl>
                <carrier_tax_rate>#{order[:carrier_tax_rate]}</carrier_tax_rate>
                <total_wrapping>#{order[:total_wrapping]}</total_wrapping>
                <total_wrapping_tax_incl>#{order[:total_wrapping_tax_incl]}</total_wrapping_tax_incl>
                <total_wrapping_tax_excl>#{order[:total_wrapping_tax_excl]}</total_wrapping_tax_excl>
                <round_mode>#{order[:round_mode]}</round_mode>
                <round_type>#{order[:round_type]}</round_type>
                <conversion_rate>#{order[:conversion_rate]}</conversion_rate>
                <reference>#{order[:reference]}</reference>
                <associations>
                <order_rows nodeType=\"#{order[:order_row]}\" virtualEntity=\"#{order[:virtualEntity]}\">
                <#{order[:order_row]}>
                <id></id>
                <product_id href=\"http://localhost:8080/api/products/\">#{order[:product_id]}</product_id>
                <product_attribute_id>#{order[:product_attribute_id]}</product_attribute_id>
                <product_quantity>#{order[:product_quantity]}</product_quantity>
                <product_name>#{order[:product_name]}</product_name>
                <product_reference>#{order[:product_reference]}</product_reference>
                <product_ean13>#{order[:product_ean13]}</product_ean13>
                <product_isbn>#{order[:product_isbn]}</product_isbn>
                <product_upc>#{order[:product_upc]}</product_upc>
                <product_price>#{order[:product_price]}</product_price>
                <id_customization href=\"http://localhost:8080/api/customizations/\">#{order[:id_customization]}</id_customization>
                <unit_price_tax_incl>#{order[:unit_price_tax_incl]}</unit_price_tax_incl>
                <unit_price_tax_excl>#{order[:unit_price_tax_excl]}</unit_price_tax_excl>
                </#{:order_row}>
                </order_rows>
                </associations>
                </order>
                </prestashop>",
                basic_auth: @auth,
                header:
                {
                    'Content-Type' => 'application/x-www-form-urlencoded',
                    "charset"=>'utf-8'
                }
            })
            puts order.body, order.code,order.response
    end

    def self.delete_order(id)
        order = HTTParty.delete("http://localhost:8080/api/orders/#{id}",
        {
            basic_auth: @auth,
            header:
            {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        })
        puts order.code
    end
   
    
end

############## TESTING METHODS #############

#wyswietl adres
#print Presta.getaddresses(1)

#dodaj jezyk
#Presta.post_language($language)


#dodaj customera
#Presta.post_customer($customer1)

#usun customera
#Presta.delete_customer(5)

#wywiestl customera
#Presta.get_customer(2)

#cos jest nie tak z order reference
#Presta.post_order_payment($payment_method)

#Usuwanie dziala
#Presta.delete_carts(5)

#dodaje tyle ze wysypuje blad
#Presta.post_carts($carts)

#dziala
#Presta.delete_order(5)

###NOT WORKING###

#Presta.update_customer(2,$customer1)


#fatal error 500 
#Presta.post_order($order)



















# NOT WORKING


 # def self.post_carts(carts)
    #     cart = HTTParty.post("http://localhost:8080/api/carts/",
    #     {
    #         body:
    #         "<prestashop>
    #             <cart>
    #             <id></id>
    #             <id_address_delivery href=\"http://localhost:8080/api/addresses/\">#{carts[:id_address_delivery]}</id_address_delivery>
    #             <id_address_invoice href=\"http://localhost:8080/api/addresses/\">#{carts[:id_address_invoice]}</id_address_invoice>
    #             <id_currency href=\"http://localhost:8080/api/currencies/\">#{carts[:id_currency]}</id_currency>
    #             <id_customer href=\"http://localhost:8080/api/customers/\">#{carts[:id_customer]}</id_customer>
    #             <id_guest href=\"http://localhost:8080/api/guests/\">#{carts[:id_guest]}</id_guest>
    #             <id_lang href=\"http://localhost:8080/api/languages/\">#{carts[:id_lang]}</id_lang>
    #             <id_shop_group>#{carts[:id_shop_group]}</id_shop_group>
    #             <id_shop>#{carts[:id_shop]}</id_shop>
    #             <id_carrier>#{carts[:id_carrier]}</id_carrier>
    #             <recyclable>#{carts[:recyclable]}</recyclable>
    #             <gift>#{carts[:gift]}</gift>
    #             <gift_message>#{carts[:gift_message]}</gift_message>
    #             <mobile_theme>#{carts[:mobile_theme]}</mobile_theme>
    #             <delivery_option>#{carts[:delivery_option]}</delivery_option>
    #             <secure_key>#{carts[:secure_key]}</secure_key>
    #             <allow_seperated_package>#{carts[:allow_seperated_package]}</allow_seperated_package>
    #             <date_add>#{carts[:date_add]}</date_add>
    #             <date_upd>#{carts[:date_upd]}</date_upd>
    #                 <associations>
    #                     <cart_rows nodeType=\"#{carts[:cart_row]}\" virtualEntity=\"#{carts[:virtualEntity]}\">
    #                         <#{carts[:cart_row]}>
    #                         <id_product href=\"http://localhost:8080/api/products/\">#{carts[:id_product]}</id_product>
    #                         <id_product_attribute href=\"http://localhost:8080/api/combinations/\">#{carts[:id_product_attribute]}</id_product_attribute>
    #                         <id_address_delivery href=\"http://localhost:8080/api/addresses/\">#{carts[:id_address_delivery_1]}</id_address_delivery>
    #                         <id_customization href=\"http://localhost:8080/api/customizations/\">#{carts[:id_customization]}</id_customization>
    #                         <quantity>#{carts[:quantity]}</quantity>
    #                         </#{carts[:cart_row]}>
    #                     </cart_rows>
    #                 </associations>
    #             </cart>
    #         </prestashop>",
            
    #         basic_auth: @auth,
    #         header: {
    #             'Content-Type' => 'application/x-www-form-urlencoded',
    #             "charset"=>'utf-8'
    #         }
    #     })
    #     puts cart.body,cart.code
    # end

    # def self.post_order(order)
    #     order = HTTParty.post("http://localhost:8080/api/orders/",
    #         {
    #             body:
    #             "<prestashop>
    #                 <order>
    #                     <id></id>
    #                     <id_address_delivery href=\"http://localhost:8080/api/addresses/\">#{order[:id_address_delivery]}</id_address_delivery>
    #                     <id_address_invoice href=\"http://localhost:8080/api/addresses/\">#{order[:id_address_invoice]}</id_address_invoice>
    #                     <id_cart href=\"http://localhost:8080/api/carts/\">#{order[:id_cart]}</id_cart>
    #                     <id_currency href=\"http://localhost:8080/api/currencies/\">#{order[:id_currency]}</id_currency>
    #                     <id_lang href=\"http://localhost:8080/api/languages/\">#{order[:id_lang]}</id_lang>
    #                     <id_customer href=\"http://localhost:8080/api/customers/\">#{order[:id_customer]}</id_customer>
    #                     <id_carrier href=\"http://localhost:8080/api/carriers/\">#{order[:id_carrier]}</id_carrier>
    #                     <current_state href=\"http://localhost:8080/api/order_states/\">#{order[:current_state]}</current_state>
    #                     <module>#{order[:modul]}</module>
    #                     <invoice_number>#{order[:invoice_number]}</invoice_number>
    #                     <invoice_date>#{order[:invoice_date]}</invoice_date>
    #                     <delivery_number>#{order[:delivery_number]}</delivery_number>
    #                     <delivery_date>#{order[:delivery_date]}</delivery_date>
    #                     <valid>#{order[:valid]}</valid>
    #                     <date_add>#{order[:date_add]}</date_add>
    #                     <date_upd>#{order[:date_upd]}</date_upd>
    #                     <shipping_number notFilterable=\"#{order[:shipping_number]}\"></shipping_number>
    #                     <note>#{order[:note]}</note>
    #                     <id_shop_group>#{order[:id_shop_group]}</id_shop_group>
    #                     <id_shop>#{order[:id_shop]}</id_shop>
    #                     <secure_key>#{order[:secure_key]}</secure_key>
    #                     <payment>#{order[:payment]}</payment>
    #                     <recyclable>#{order[:recyclable]}</recyclable>
    #                     <gift>#{order[:gift ]}</gift>
    #                     <gift_message>#{order[:gift_message]}</gift_message>
    #                     <mobile_theme>#{order[:mobile_theme]}</mobile_theme>
    #                     <total_discounts>#{order[:total_discounts]}</total_discounts>
    #                     <total_discounts_tax_incl>#{order[:total_discounts_tax_incl]}</total_discounts_tax_incl>
    #                     <total_discounts_tax_excl>#{order[:total_discounts_tax_excl]}</total_discounts_tax_excl>
    #                     <total_paid>#{order[:total_paid]}</total_paid>
    #                     <total_paid_tax_incl>#{order[:total_paid_tax_incl]}</total_paid_tax_incl>
    #                     <total_paid_tax_excl>#{order[:total_paid_tax_excl]}</total_paid_tax_excl>
    #                     <total_paid_real>#{order[:total_paid_real]}</total_paid_real>
    #                     <total_products>#{order[:total_products]}</total_products>
    #                     <total_products_wt>#{order[:total_products_wt]}</total_products_wt>
    #                     <total_shipping>#{order[:total_shipping]}</total_shipping>
    #                     <total_shipping_tax_incl>#{order[:total_shipping_tax_incl]}</total_shipping_tax_incl>
    #                     <total_shipping_tax_excl>#{order[:total_shipping_tax_excl]}</total_shipping_tax_excl>
    #                     <carrier_tax_rate>#{order[:carrier_tax_rate]}</carrier_tax_rate>
    #                     <total_wrapping>#{order[:total_wrapping]}</total_wrapping>
    #                     <total_wrapping_tax_incl>#{order[:total_wrapping_tax_incl]}</total_wrapping_tax_incl>
    #                     <total_wrapping_tax_excl>#{order[:total_wrapping_tax_excl]}</total_wrapping_tax_excl>
    #                     <round_mode>#{order[:round_mode]}</round_mode>
    #                     <round_type>#{order[:round_type]}</round_type>
    #                     <conversion_rate>#{order[:conversion_rate]}</conversion_rate>
    #                     <reference>#{order[:reference]}</reference>
    #                     <associations>
    #                         <order_rows nodeType=\"#{order[:order_row]}\" virtualEntity=\"#{order[:virtualEntity]}\">
    #                             <#{order[:order_row]}>
    #                                 <id></id>
    #                                 <product_id href=\"http://localhost:8080/api/products/\">#{order[:product_id]}</product_id>
    #                                 <product_attribute_id>#{order[:product_attribute_id]}</product_attribute_id>
    #                                 <product_quantity>#{order[:product_quantity]}</product_quantity>
    #                                 <product_name>#{order[:product_name]}</product_name>
    #                                 <product_reference>#{order[:product_reference]}</product_reference>
    #                                 <product_ean13>#{order[:product_ean13]}</product_ean13>
    #                                 <product_isbn>#{order[:product_isbn]}</product_isbn>
    #                                 <product_upc>#{order[:product_upc]}</product_upc>
    #                                 <product_price>#{order[:product_price]}</product_price>
    #                                 <id_customization href=\"http://localhost:8080/api/customizations/\">#{order[:id_customization]}</id_customization>
    #                                 <unit_price_tax_incl>#{order[:unit_price_tax_incl]}</unit_price_tax_incl>
    #                                 <unit_price_tax_excl>#{order[:unit_price_tax_excl]}</unit_price_tax_excl>
    #                             </#{order[:order_row]}>
    #                         </order_rows>
    #                     </associations>
    #                 </order>
    #             </prestashop>",
    #             basic_auth: @auth,
    #             header:
    #             {
    #                 'Content-Type' => 'application/x-www-form-urlencoded',
    #                 "charset"=>'utf-8'
    #             }
    #         })
    #         puts order.body, order.code
    # end

