######################################################################################################################################################################
#  
#   PRESTASHOP API 
#  
#   DEVELOPED BY: KACPER MORAWSKI
#
#   GITHUB: https://github.com/xiro777
#
#   LAST UPDATE: 18.07.2022
#
#   DESCRIPTION: File contains class with request sent to Prestashop API 
#
#   PRESTASHOP: v.1.7.8.6
#
#   PHP: 7.4
#
######################################################################################################################################################################


require 'httparty'
require_relative 'dane_presta.rb'
require_relative 'creating_hashes.rb'

class Presta
    
    include HTTParty
    include PrestaDane
    include Create

    @api_key = 'QR76XYPX1KM739U6FRMUZVXH44QR7J1W'
    @auth = {username: "QR76XYPX1KM739U6FRMUZVXH44QR7J1W", password: ""}
    @api_url = "http://localhost:8080/api/" 
    def initialize      
    end



    #########################################################################################################################





    def self.getaddresses(id)
        address = HTTParty.get("#{@api_url}addresses/#{id}", basic_auth: @auth )
        puts address.body,address.code
    end


    ##### ATACHMENTS ###############################################################################################################################################

    def self.post_attachments(attachments)
        attach = HTTParty.post("#{@api_url}attachments/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <attachment>
              <id></id>
              <file>#{attachments[:file]}</file>
              <file_name>#{attachments[:file_name]}</file_name>
              <file_size>#{attachments[:file_size]}</file_size>
              <mime>#{attachments[:mime]}</mime>
              <name>
                <language id=\"1\">#{attachments[:name]}</language>
                <language id=\"2\">#{attachments[:name1]}</language>
              </name>
              <description>
                <language id=\"1\">#{attachments[:desciption]}</language>
                <language id=\"2\">#{attachments[:desciption1]}</language>
              </description>
              <associations>
                <products>
                  <product>
                    <id>#{attachments[:product_id]}</id>
                  </product>
                </products>
              </associations>
            </attachment>
          </prestashop>",
            basic_auth: @auth,
            header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
            }
        })
        puts attach.body, attach.code
    end

    def self.update_attachments(id,attachments)
      attach = HTTParty.put("#{@api_url}attachments/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <attachment>
            <id>#{id}</id>
            <file>#{attachments[:file]}</file>
            <file_name>#{attachments[:file_name]}</file_name>
            <file_size>#{attachments[:file_size]}</file_size>
            <mime>#{attachments[:mime]}</mime>
            <name>
              <language id=\"1\">#{attachments[:name]}</language>
              <language id=\"2\">#{attachments[:name1]}</language>
            </name>
            <description>
              <language id=\"1\">#{attachments[:desciption]}</language>
              <language id=\"2\">#{attachments[:desciption1]}</language>
            </description>
            <associations>
              <products>
                <product>
                  <id>#{attachments[:product_id]}</id>
                </product>
              </products>
            </associations>
          </attachment>
        </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts attach.body, attach.code
    end

    def self.delete_attachments(id)
      attach = HTTParty.delete("#{@api_url}attachments/#{id}",
      {
          basic_auth: @auth
      })
      puts attach.body, attach.code
    end

    def self.get_attachments(id)
      attach = HTTParty.get("#{@api_url}attachments/#{id}",
      {
          basic_auth: @auth
      })
      puts attach.body, attach.code
    end

    ##### LANGUAGE ###################################################################################################################################################

    def self.post_language(tab)
        language = HTTParty.post("#{@api_url}languages/",
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

    def self.update_language(id,tab)
      language = HTTParty.put("#{@api_url}languages/#{id}",
          {
              body: 
              "<prestashop>
                  <language>
                      <id>#{id}</id>
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
    def self.delete_language(id)
      language = HTTParty.delete("#{@api_url}languages/#{id}",
          {
              basic_auth: @auth
          }
      )
      puts language.body, language.code 
    end

    def self.get_language(id)
      language = HTTParty.get("#{@api_url}languages/#{id}",
          {
              basic_auth: @auth
          }
      )
      puts language.body, language.code 
    end

       
    ##### CUSTOMERS ##################################################################################################################################################

    def self.post_customer(customer)
        customer = HTTParty.post("#{@api_url}customers/",{
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

    def self.update_customer(id,customer)
        cust = HTTParty.put("#{@api_url}customers/#{id}",
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
            
        })
        puts cust.body, cust.code
    end

    def self.delete_customer(id)
      cust = HTTParty.delete("#{@api_url}customers/#{id}",
      {
          basic_auth: @auth       
      }) 
      puts cust.body, cust.code
    end  
    
    def self.get_customer(id)
      cust = HTTParty.get("#{@api_url}customers/#{id}",
      {
        basic_auth: @auth              
      }) 
      puts cust.body, cust.code
    end 

    ##### POST CARTS #################################################################################################################################################

    def self.post_carts(carts)
      cart = HTTParty.post("#{@api_url}carts/",
      {
          body:
          "<prestashop>
            <cart>
              <id/>
              <id_address_delivery>#{carts[:id_address_delivery]}</id_address_delivery>
              <id_address_invoice>#{carts[:id_address_invoice]}</id_address_invoice>
              <id_currency>#{carts[:id_currency]}</id_currency>
              <id_customer>#{carts[:id_customer]}</id_customer>
              <id_guest>#{carts[:id_guest]}</id_guest>
              <id_lang>#{carts[:id_lang]}</id_lang>
              <id_carrier>#{carts[:id_carrier]}</id_carrier>
              <recyclable>#{carts[:recyclable]}</recyclable>
              <gift>#{carts[:gift]}</gift>
              <gift_message>#{carts[:gift_message]}</gift_message>
              <associations>
                <cart_rows>
                <cart_row>
              <id_product>#{carts[:id_product]}</id_product>
              <id_product_attribute>#{carts[:id_product_attribute]}</id_product_attribute>
              <quantity>#{carts[:quantity]}</quantity>
                </cart_row>
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

    def self.update_carts(id,carts)
      cart = HTTParty.put("#{@api_url}carts/#{id}",
      {
          body:
          "<prestashop>
          <cart>
          <id>#{id}</id>
          <id_address_delivery>#{carts[:id_address_delivery]}</id_address_delivery>
          <id_address_invoice>#{carts[:id_address_invoice]}</id_address_invoice>
          <id_currency>#{carts[:id_currency]}</id_currency>
          <id_customer>#{carts[:id_customer]}</id_customer>
          <id_guest>#{carts[:id_guest]}</id_guest>
          <id_lang>#{carts[:id_lang]}</id_lang>
          <id_carrier>#{carts[:id_carrier]}</id_carrier>
          <recyclable>#{carts[:recyclable]}</recyclable>
          <gift>#{carts[:gift]}</gift>
          <gift_message>#{carts[:gift_message]}</gift_message>
          <associations>
            <cart_rows>
            <cart_row>
          <id_product>#{carts[:id_product]}</id_product>
          <id_product_attribute>#{carts[:id_product_attribute]}</id_product_attribute>
          <quantity>#{carts[:quantity]}</quantity>
            </cart_row>
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
        carts = HTTParty.delete("#{@api_url}carts/#{id}",
        {
            basic_auth: @auth
        })
        puts carts.body,carts.code
    end

    def self.get_carts(id)
      carts = HTTParty.get("#{@api_url}carts/#{id}",
      {
          basic_auth: @auth
      })
      puts carts.body,carts.code
    end


    ##### ORDER CARRIERS ############################################################################################################################################

    def self.post_order_carriers(order_carrier)
      ord = HTTParty.post("#{@api_url}order_carriers/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_carrier>
              <id></id>
              <id_order>#{order_carrier[:id_order]}</id_order>
              <id_carrier>#{order_carrier[:id_carrier]}</id_carrier>
              <id_order_invoice>#{order_carrier[:id_order_invoice]}</id_order_invoice>
              <weight>#{order_carrier[:weight]}</weight>
              <shipping_cost_tax_excl>#{order_carrier[:shipping_cost_tax_excl]}</shipping_cost_tax_excl>
              <shipping_cost_tax_incl>#{order_carrier[:shipping_cost_tax_incl]}</shipping_cost_tax_incl>
              <tracking_number>#{order_carrier[:tracking_number]}</tracking_number>
              <date_add>#{order_carrier[:date_add]}</date_add>
            </order_carrier>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
     end

     def self.update_order_carriers(id,order_carrier)
      ord = HTTParty.put("#{@api_url}order_carriers/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_carrier>
              <id>#{id}</id>
              <id_order>#{order_carrier[:id_order]}</id_order>
              <id_carrier>#{order_carrier[:id_carrier]}</id_carrier>
              <id_order_invoice>#{order_carrier[:id_order_invoice]}</id_order_invoice>
              <weight>#{order_carrier[:weight]}</weight>
              <shipping_cost_tax_excl>#{order_carrier[:shipping_cost_tax_excl]}</shipping_cost_tax_excl>
              <shipping_cost_tax_incl>#{order_carrier[:shipping_cost_tax_incl]}</shipping_cost_tax_incl>
              <tracking_number>#{order_carrier[:tracking_number]}</tracking_number>
              <date_add>#{order_carrier[:date_add]}</date_add>
            </order_carrier>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
     end

     def self.delete_order_carriers(id)
      ord = HTTParty.delete("#{@api_url}order_carriers/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
     end

     def self.get_order_carriers(id)
      ord = HTTParty.get("#{@api_url}order_carriers/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
     end

    ##### ORDER CART RULES ############################################################################################################################################

    def self.post_order_cart_rules(order_cart_rules)
      ord = HTTParty.post("#{@api_url}order_cart_rules/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_cart_rule>
            <id></id>
            <id_order>#{order_cart_rules[:id_order]}</id_order>
            <id_cart_rule>#{order_cart_rules[:id_cart_rule]}</id_cart_rule>
            <id_order_invoice>#{order_cart_rules[:id_order_invoice]}</id_order_invoice>
            <name>#{order_cart_rules[:name]}</name>
            <value>#{order_cart_rules[:value]}</value>
            <value_tax_excl>#{order_cart_rules[:value_tax_excl]}</value_tax_excl>
            <free_shipping>#{order_cart_rules[:free_shipping]}</free_shipping>
            <deleted>#{order_cart_rules[:deleted]}</deleted>
            </order_cart_rule>
        </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
    end

    def self.update_order_cart_rules(id,order_cart_rules)
      ord = HTTParty.put("#{@api_url}order_cart_rules/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_cart_rule>
            <id>#{id}</id>
            <id_order>#{order_cart_rules[:id_order]}</id_order>
            <id_cart_rule>#{order_cart_rules[:id_cart_rule]}</id_cart_rule>
            <id_order_invoice>#{order_cart_rules[:id_order_invoice]}</id_order_invoice>
            <name>#{order_cart_rules[:name]}</name>
            <value>#{order_cart_rules[:value]}</value>
            <value_tax_excl>#{order_cart_rules[:value_tax_excl]}</value_tax_excl>
            <free_shipping>#{order_cart_rules[:free_shipping]}</free_shipping>
            <deleted>#{order_cart_rules[:deleted]}</deleted>
            </order_cart_rule>
        </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
    end

    def self.delete_order_cart_rules(id)
      ord = HTTParty.delete("#{@api_url}order_cart_rules/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    def self.get_order_cart_rules(id)
      ord = HTTParty.get("#{@api_url}order_cart_rules/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    ##### ORDER DETAILS ############################################################################################################################################### 

    def self.post_order_details(order_detail)
      ord = HTTParty.post("#{@api_url}order_details/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_detail>
            <id></id>
            <id_order>#{order_detail[:id_order]}</id_order>
            <product_id>#{order_detail[:product_id]}</product_id>
            <product_attribute_id>#{order_detail[:product_attribute_id]}</product_attribute_id>
            <product_quantity_reinjected>#{order_detail[:product_quantity_reinjected]}</product_quantity_reinjected>
            <group_reduction>#{order_detail[:group_reduction]}</group_reduction>
            <discount_quantity_applied>#{order_detail[:discount_quantity_applied]}</discount_quantity_applied>
            <download_hash>#{order_detail[:download_hash]}</download_hash>
            <download_deadline>#{order_detail[:download_deadline]}</download_deadline>
            <id_order_invoice>#{order_detail[:id_order_invoice]}</id_order_invoice>
            <id_warehouse>#{order_detail[:id_warehouse]}</id_warehouse>
            <id_shop>#{order_detail[:id_shop]}</id_shop>
            <id_customization>#{order_detail[:id_customization]}</id_customization>
            <product_name>#{order_detail[:product_name]}</product_name>
            <product_quantity>#{order_detail[:product_quantity]}</product_quantity>
            <product_quantity_in_stock>#{order_detail[:product_quantity_in_stock]}</product_quantity_in_stock>
            <product_quantity_return>#{order_detail[:product_quantity_return]}</product_quantity_return>
            <product_quantity_refunded>#{order_detail[:product_quantity_refunded]}</product_quantity_refunded>
            <product_price>#{order_detail[:product_price]}</product_price>
            <reduction_percent>#{order_detail[:reduction_percent]}</reduction_percent>
            <reduction_amount>#{order_detail[:reduction_amount]}</reduction_amount>
            <reduction_amount_tax_incl>#{order_detail[:reduction_amount_tax_incl]}</reduction_amount_tax_incl>
            <reduction_amount_tax_excl>#{order_detail[:reduction_amount_tax_excl]}</reduction_amount_tax_excl>
            <product_quantity_discount>#{order_detail[:product_quantity_discount]}</product_quantity_discount>
            <product_ean13>#{order_detail[:product_ean13]}</product_ean13>
            <product_isbn>#{order_detail[:product_isbn]}</product_isbn>
            <product_upc>#{order_detail[:product_upc]}</product_upc>
            <product_mpn>#{order_detail[:product_mpn]}</product_mpn>
            <product_reference>#{order_detail[:product_reference]}</product_reference>
            <product_supplier_reference>#{order_detail[:product_supplier_reference]}</product_supplier_reference>
            <product_weight>#{order_detail[:product_weight]}</product_weight>
            <tax_computation_method>#{order_detail[:tax_computation_method]}</tax_computation_method>
            <id_tax_rules_group>#{order_detail[:id_tax_rules_group]}</id_tax_rules_group>
            <ecotax>#{order_detail[:ecotax]}</ecotax>
            <ecotax_tax_rate>#{order_detail[:ecotax_tax_rate]}</ecotax_tax_rate>
            <download_nb>#{order_detail[:download_nb]}</download_nb>
            <unit_price_tax_incl>#{order_detail[:unit_price_tax_incl]}</unit_price_tax_incl>
            <unit_price_tax_excl>#{order_detail[:unit_price_tax_excl]}</unit_price_tax_excl>
            <total_price_tax_incl>#{order_detail[:total_price_tax_incl]}</total_price_tax_incl>
            <total_price_tax_excl>#{order_detail[:total_price_tax_excl]}</total_price_tax_excl>
            <total_shipping_price_tax_excl>#{order_detail[:total_shipping_price_tax_excl]}</total_shipping_price_tax_excl>
            <total_shipping_price_tax_incl>#{order_detail[:total_shipping_price_tax_incl]}</total_shipping_price_tax_incl>
            <purchase_supplier_price>#{order_detail[:purchase_supplier_price]}</purchase_supplier_price>
            <original_product_price>#{order_detail[:original_product_price]}</original_product_price>
            <original_wholesale_price>#{order_detail[:original_wholesale_price]}</original_wholesale_price>
            <total_refunded_tax_excl>#{order_detail[:total_refunded_tax_excl]}</total_refunded_tax_excl>
            <total_refunded_tax_incl>#{order_detail[:total_refunded_tax_incl]}</total_refunded_tax_incl>
            <associations>
              <taxes>
                <tax>
                  <id>#{order_detail[:tax_id]}</id>
                </tax>
              </taxes>
            </associations>
          </order_detail>
        </prestashop>
        ",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
    end

    def self.update_order_details(id,order_detail)
      ord = HTTParty.put("#{@api_url}order_details/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_detail>
            <id>#{id}</id>
            <id_order>#{order_detail[:id_order]}</id_order>
            <product_id>#{order_detail[:product_id]}</product_id>
            <product_attribute_id>#{order_detail[:product_attribute_id]}</product_attribute_id>
            <product_quantity_reinjected>#{order_detail[:product_quantity_reinjected]}</product_quantity_reinjected>
            <group_reduction>#{order_detail[:group_reduction]}</group_reduction>
            <discount_quantity_applied>#{order_detail[:discount_quantity_applied]}</discount_quantity_applied>
            <download_hash>#{order_detail[:download_hash]}</download_hash>
            <download_deadline>#{order_detail[:download_deadline]}</download_deadline>
            <id_order_invoice>#{order_detail[:id_order_invoice]}</id_order_invoice>
            <id_warehouse>#{order_detail[:id_warehouse]}</id_warehouse>
            <id_shop>#{order_detail[:id_shop]}</id_shop>
            <id_customization>#{order_detail[:id_customization]}</id_customization>
            <product_name>#{order_detail[:product_name]}</product_name>
            <product_quantity>#{order_detail[:product_quantity]}</product_quantity>
            <product_quantity_in_stock>#{order_detail[:product_quantity_in_stock]}</product_quantity_in_stock>
            <product_quantity_return>#{order_detail[:product_quantity_return]}</product_quantity_return>
            <product_quantity_refunded>#{order_detail[:product_quantity_refunded]}</product_quantity_refunded>
            <product_price>#{order_detail[:product_price]}</product_price>
            <reduction_percent>#{order_detail[:reduction_percent]}</reduction_percent>
            <reduction_amount>#{order_detail[:reduction_amount]}</reduction_amount>
            <reduction_amount_tax_incl>#{order_detail[:reduction_amount_tax_incl]}</reduction_amount_tax_incl>
            <reduction_amount_tax_excl>#{order_detail[:reduction_amount_tax_excl]}</reduction_amount_tax_excl>
            <product_quantity_discount>#{order_detail[:product_quantity_discount]}</product_quantity_discount>
            <product_ean13>#{order_detail[:product_ean13]}</product_ean13>
            <product_isbn>#{order_detail[:product_isbn]}</product_isbn>
            <product_upc>#{order_detail[:product_upc]}</product_upc>
            <product_mpn>#{order_detail[:product_mpn]}</product_mpn>
            <product_reference>#{order_detail[:product_reference]}</product_reference>
            <product_supplier_reference>#{order_detail[:product_supplier_reference]}</product_supplier_reference>
            <product_weight>#{order_detail[:product_weight]}</product_weight>
            <tax_computation_method>#{order_detail[:tax_computation_method]}</tax_computation_method>
            <id_tax_rules_group>#{order_detail[:id_tax_rules_group]}</id_tax_rules_group>
            <ecotax>#{order_detail[:ecotax]}</ecotax>
            <ecotax_tax_rate>#{order_detail[:ecotax_tax_rate]}</ecotax_tax_rate>
            <download_nb>#{order_detail[:download_nb]}</download_nb>
            <unit_price_tax_incl>#{order_detail[:unit_price_tax_incl]}</unit_price_tax_incl>
            <unit_price_tax_excl>#{order_detail[:unit_price_tax_excl]}</unit_price_tax_excl>
            <total_price_tax_incl>#{order_detail[:total_price_tax_incl]}</total_price_tax_incl>
            <total_price_tax_excl>#{order_detail[:total_price_tax_excl]}</total_price_tax_excl>
            <total_shipping_price_tax_excl>#{order_detail[:total_shipping_price_tax_excl]}</total_shipping_price_tax_excl>
            <total_shipping_price_tax_incl>#{order_detail[:total_shipping_price_tax_incl]}</total_shipping_price_tax_incl>
            <purchase_supplier_price>#{order_detail[:purchase_supplier_price]}</purchase_supplier_price>
            <original_product_price>#{order_detail[:original_product_price]}</original_product_price>
            <original_wholesale_price>#{order_detail[:original_wholesale_price]}</original_wholesale_price>
            <total_refunded_tax_excl>#{order_detail[:total_refunded_tax_excl]}</total_refunded_tax_excl>
            <total_refunded_tax_incl>#{order_detail[:total_refunded_tax_incl]}</total_refunded_tax_incl>
            <associations>
              <taxes>
                <tax>
                  <id>#{order_detail[:tax_id]}</id>
                </tax>
              </taxes>
            </associations>
          </order_detail>
        </prestashop>
        ",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
    end

    def self.delete_order_details(id)
      ord = HTTParty.delete("#{@api_url}order_details/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    def self.get_order_details(id)
      ord = HTTParty.get("#{@api_url}order_details/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    ##### ORDER HISTORIES #############################################################################################################################################

    def self.post_order_histories(order_history)
      ord = HTTParty.post("#{@api_url}order_histories/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_history>
              <id></id>
              <id_employee>#{order_history[:id_employee]}</id_employee>
              <id_order_state>#{order_history[:id_order_state]}</id_order_state>
              <id_order>#{order_history[:id_order]}</id_order>
              <date_add>#{order_history[:date_add]}</date_add>
            </order_history>
           </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
    end

    def self.update_order_histories(id,order_history)
      ord = HTTParty.put("#{@api_url}order_histories/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_history>
              <id>#{id}</id>
              <id_employee>#{order_history[:id_employee]}</id_employee>
              <id_order_state>#{order_history[:id_order_state]}</id_order_state>
              <id_order>#{order_history[:id_order]}</id_order>
              <date_add>#{order_history[:date_add]}</date_add>
            </order_history>
           </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts ord.body,ord.code
    end

    def self.delete_order_histories(id)
      ord = HTTParty.delete("#{@api_url}order_histories/#{id}",
      {
          basic_auth: @auth,
      })
      puts ord.body,ord.code
    end

    def self.get_order_histories(id)
      ord = HTTParty.get("#{@api_url}order_histories/#{id}",
      {
          basic_auth: @auth,
      })
      puts ord.body,ord.code
    end

    ##### ORDER INVOICE ###############################################################################################################################################

    def self.post_order_invoice(order_invoice)
      order = HTTParty.post("#{@api_url}order_invoices/",
      {
          body: 
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_invoice>
              <id></id>
              <id_order>#{order_invoice[:id_order]}</id_order>
              <number>#{order_invoice[:number]}</number>
              <delivery_number>#{order_invoice[:delivery_number]}</delivery_number>
              <delivery_date>#{order_invoice[:delivery_date]}</delivery_date>
              <total_discount_tax_excl>#{order_invoice[:total_discount_tax_excl]}</total_discount_tax_excl>
              <total_discount_tax_incl>#{order_invoice[:total_discount_tax_incl]}</total_discount_tax_incl>
              <total_paid_tax_excl>#{order_invoice[:total_paid_tax_excl]}</total_paid_tax_excl>
              <total_paid_tax_incl>#{order_invoice[:total_paid_tax_incl]}</total_paid_tax_incl>
              <total_products>#{order_invoice[:total_products]}</total_products>
              <total_products_wt>#{order_invoice[:total_products_wt]}</total_products_wt>
              <total_shipping_tax_excl>#{order_invoice[:total_shipping_tax_excl]}</total_shipping_tax_excl>
              <total_shipping_tax_incl>#{order_invoice[:total_shipping_tax_incl]}</total_shipping_tax_incl>
              <shipping_tax_computation_method>#{order_invoice[:shipping_tax_computation_method]}</shipping_tax_computation_method>
              <total_wrapping_tax_excl>#{order_invoice[:total_wrapping_tax_excl]}</total_wrapping_tax_excl>
              <total_wrapping_tax_incl>#{order_invoice[:total_wrapping_tax_incl]}</total_wrapping_tax_incl>
              <shop_address>#{order_invoice[:shop_address]}</shop_address>
              <note>#{order_invoice[:note]}</note>
              <date_add>#{order_invoice[:date_add]}</date_add>
            </order_invoice>
        </prestashop>
        ",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts order.body,order.code
    end

    def self.update_order_invoice(id,order_invoice)
      order = HTTParty.put("#{@api_url}order_invoices/#{id}",
      {
          body: 
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_invoice>
              <id>#{id}</id>
              <id_order>#{order_invoice[:id_order]}</id_order>
              <number>#{order_invoice[:number]}</number>
              <delivery_number>#{order_invoice[:delivery_number]}</delivery_number>
              <delivery_date>#{order_invoice[:delivery_date]}</delivery_date>
              <total_discount_tax_excl>#{order_invoice[:total_discount_tax_excl]}</total_discount_tax_excl>
              <total_discount_tax_incl>#{order_invoice[:total_discount_tax_incl]}</total_discount_tax_incl>
              <total_paid_tax_excl>#{order_invoice[:total_paid_tax_excl]}</total_paid_tax_excl>
              <total_paid_tax_incl>#{order_invoice[:total_paid_tax_incl]}</total_paid_tax_incl>
              <total_products>#{order_invoice[:total_products]}</total_products>
              <total_products_wt>#{order_invoice[:total_products_wt]}</total_products_wt>
              <total_shipping_tax_excl>#{order_invoice[:total_shipping_tax_excl]}</total_shipping_tax_excl>
              <total_shipping_tax_incl>#{order_invoice[:total_shipping_tax_incl]}</total_shipping_tax_incl>
              <shipping_tax_computation_method>#{order_invoice[:shipping_tax_computation_method]}</shipping_tax_computation_method>
              <total_wrapping_tax_excl>#{order_invoice[:total_wrapping_tax_excl]}</total_wrapping_tax_excl>
              <total_wrapping_tax_incl>#{order_invoice[:total_wrapping_tax_incl]}</total_wrapping_tax_incl>
              <shop_address>#{order_invoice[:shop_address]}</shop_address>
              <note>#{order_invoice[:note]}</note>
              <date_add>#{order_invoice[:date_add]}</date_add>
            </order_invoice>
        </prestashop>
        ",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts order.body,order.code
    end

    def self.delete_order_invoice(id)
      order = HTTParty.delete("#{@api_url}order_invoices/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end

    def self.get_order_invoice(id)
      order = HTTParty.get("#{@api_url}order_invoices/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end

    ###### ORDER PAYMENT #############################################################################################################################################

    def self.post_order_payment(order_payment)
      order = HTTParty.post("#{@api_url}order_payments/",
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
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts order.body,order.code
    end

    def self.update_order_payment(id,order_payment)
      order = HTTParty.put("#{@api_url}order_payments/#{id}",
      {
          body: 
          "<prestashop>
              <order_payment>
              <id>#{id}</id>   
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
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts order.body,order.code
    end

    def self.delete_order_payment(id)
      order = HTTParty.delete("#{@api_url}order_payments/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end

    def self.get_order_payment(id)
      order = HTTParty.get("#{@api_url}order_payments/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end


    ##### ORDER SLIP ###################################################################################################################################################

    def self.post_order_slip(order_slip)
      ord = HTTParty.post("#{@api_url}order_slip/",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_slip>
            <id></id>
            <id_customer>#{order_slip[:id_customer]}</id_customer>
            <id_order>#{order_slip[:id_order]}</id_order>
            <conversion_rate>#{order_slip[:conversion_rate]}</conversion_rate>
            <total_products_tax_excl>#{order_slip[:total_products_tax_excl]}</total_products_tax_excl>
            <total_products_tax_incl>#{order_slip[:total_products_tax_incl]}</total_products_tax_incl>
            <total_shipping_tax_excl>#{order_slip[:total_shipping_tax_excl]}</total_shipping_tax_excl>
            <total_shipping_tax_incl>#{order_slip[:total_shipping_tax_incl]}</total_shipping_tax_incl>
            <amount>#{order_slip[:amount]}</amount>
            <shipping_cost>#{order_slip[:shipping_cost]}</shipping_cost>
            <shipping_cost_amount>#{order_slip[:shipping_cost_amount]}</shipping_cost_amount>
            <partial>#{order_slip[:partial]}</partial>
            <date_add>#{order_slip[:date_add]}</date_add>
            <date_upd>#{order_slip[:date_upd]}</date_upd>
            <order_slip_type>#{order_slip[:order_slip_type]}</order_slip_type>
            <associations>
              <order_slip_details>
                <order_slip_detail>
                  <id></id>
                  <id_order_detail>#{order_slip[:id_order_detail]}</id_order_detail>
                  <product_quantity>#{order_slip[:product_quantity]}</product_quantity>
                  <amount_tax_excl>#{order_slip[:amount_tax_excl]}</amount_tax_excl>
                  <amount_tax_incl>#{order_slip[:amount_tax_incl]}</amount_tax_incl>
                </order_slip_detail>
              </order_slip_details>
            </associations>
          </order_slip>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
      })
      puts ord.body, ord.code
    end

    def self.update_order_slip(id,order_slip)
      ord = HTTParty.put("#{@api_url}order_slip/#{id}",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_slip>
            <id>#{id}</id>
            <id_customer>#{order_slip[:id_customer]}</id_customer>
            <id_order>#{order_slip[:id_order]}</id_order>
            <conversion_rate>#{order_slip[:conversion_rate]}</conversion_rate>
            <total_products_tax_excl>#{order_slip[:total_products_tax_excl]}</total_products_tax_excl>
            <total_products_tax_incl>#{order_slip[:total_products_tax_incl]}</total_products_tax_incl>
            <total_shipping_tax_excl>#{order_slip[:total_shipping_tax_excl]}</total_shipping_tax_excl>
            <total_shipping_tax_incl>#{order_slip[:total_shipping_tax_incl]}</total_shipping_tax_incl>
            <amount>#{order_slip[:amount]}</amount>
            <shipping_cost>#{order_slip[:shipping_cost]}</shipping_cost>
            <shipping_cost_amount>#{order_slip[:shipping_cost_amount]}</shipping_cost_amount>
            <partial>#{order_slip[:partial]}</partial>
            <date_add>#{order_slip[:date_add]}</date_add>
            <date_upd>#{order_slip[:date_upd]}</date_upd>
            <order_slip_type>#{order_slip[:order_slip_type]}</order_slip_type>
            <associations>
              <order_slip_details>
                <order_slip_detail>
                  <id></id>
                  <id_order_detail>#{order_slip[:id_order_detail]}</id_order_detail>
                  <product_quantity>#{order_slip[:product_quantity]}</product_quantity>
                  <amount_tax_excl>#{order_slip[:amount_tax_excl]}</amount_tax_excl>
                  <amount_tax_incl>#{order_slip[:amount_tax_incl]}</amount_tax_incl>
                </order_slip_detail>
              </order_slip_details>
            </associations>
          </order_slip>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
      })
      puts ord.body, ord.code
    end

    def self.delete_order_slip(id)
      ord = HTTParty.delete("#{@api_url}order_slip/#{id}",
      {
        basic_auth: @auth 
      })
      puts ord.body, ord.code
    end

    def self.get_order_slip(id)
      ord = HTTParty.get("#{@api_url}order_slip/#{id}",
      {
        basic_auth: @auth 
      })
      puts ord.body, ord.code
    end


    ##### ORDER_STATES ############################################################################################################################################

    def self.post_order_states(order_states)
      ord = HTTParty.post("#{@api_url}order_states/",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_state>
            <id></id>
            <unremovable>#{order_states[:unre]}</unremovable>
            <delivery>#{order_states[:delivery]}</delivery>
            <hidden>#{order_states[:hidden]}</hidden>
            <send_email>#{order_states[:send_email]}</send_email>
            <module_name>#{order_states[:module_name]}</module_name>
            <invoice>#{order_states[:invoice]}</invoice>
            <color>#{order_states[:color]}</color>
            <logable>#{order_states[:logable]}</logable>
            <shipped>#{order_states[:shipped]}</shipped>
            <paid>#{order_states[:paid]}</paid>
            <pdf_delivery>#{order_states[:pdf_delivery]}</pdf_delivery>
            <pdf_invoice>#{order_states[:pdf_invoice]}</pdf_invoice>
            <deleted>#{order_states[:deleted]}</deleted>
            <name>
              <language id=\"1\">#{order_states[:name]}</language>
            </name>
            <template>
              <language id=\"1\">#{order_states[:template]}</language>
            </template>
          </order_state>
        </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
      })
      puts ord.body, ord.code

    end

    def self.update_order_states(id,order_states)
      ord = HTTParty.put("#{@api_url}order_states/#{id}",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_state>
            <id>#{id}</id>
            <unremovable>#{order_states[:unre]}</unremovable>
            <delivery>#{order_states[:delivery]}</delivery>
            <hidden>#{order_states[:hidden]}</hidden>
            <send_email>#{order_states[:send_email]}</send_email>
            <module_name>#{order_states[:module_name]}</module_name>
            <invoice>#{order_states[:invoice]}</invoice>
            <color>#{order_states[:color]}</color>
            <logable>#{order_states[:logable]}</logable>
            <shipped>#{order_states[:shipped]}</shipped>
            <paid>#{order_states[:paid]}</paid>
            <pdf_delivery>#{order_states[:pdf_delivery]}</pdf_delivery>
            <pdf_invoice>#{order_states[:pdf_invoice]}</pdf_invoice>
            <deleted>#{order_states[:deleted]}</deleted>
            <name>
              <language id=\"1\">#{order_states[:name]}</language>
            </name>
            <template>
              <language id=\"1\">#{order_states[:template]}</language>
            </template>
          </order_state>
        </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
      })
      puts ord.body, ord.code

    end

    def self.delete_order_states(id)
      ord = HTTParty.delete("#{@api_url}order_states/#{id}",
      {
        basic_auth: @auth  
      })
      puts ord.body, ord.code

    end

    def self.get_order_states(id)
      ord = HTTParty.get("#{@api_url}order_states/#{id}",
      {
        basic_auth: @auth  
      })
      puts ord.body, ord.code

    end

    ###### ORDERS ####################################################################################################################################################

    def self.post_order(order)
      ord  = HTTParty.post("#{@api_url}orders/",
          {
              body:
              "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
              <order>
                  <id></id>
                  <id_address_delivery>#{order[:id_address_delivery]}</id_address_delivery>
                  <id_address_invoice>#{order[:id_address_invoice]}</id_address_invoice>
                  <id_cart>#{order[:id_cart]}</id_cart>
                  <id_currency>#{order[:id_currency]}</id_currency>
                  <id_lang>#{order[:id_lang]}</id_lang>
                  <id_customer>#{order[:id_customer]}</id_customer>
                  <id_carrier>#{order[:id_carrier]}</id_carrier>
                  <current_state>#{order[:current_state]}</current_state>
                  <module>#{order[:module]}</module>
                  <invoice_number>#{order[:invoice_number]}</invoice_number>
                  <invoice_date>#{order[:invoice_date]}</invoice_date>
                  <delivery_number>#{order[:delivery_number]}</delivery_number>
                  <delivery_date>#{order[:delivery_date]}</delivery_date>
                  <valid>#{order[:valid]}</valid>
                  <date_add>#{order[:date_add]}</date_add>
                  <date_upd>#{order[:date_upd]}</date_upd>
                  <shipping_number>#{order[:shipping_number]}</shipping_number>
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
                      <order_rows>
                          <order_row>
                          <id></id>
                          <product_id>#{order[:product_id]}</product_id>
                          <product_attribute_id>#{order[:product_attribute_id]}</product_attribute_id>
                          <product_quantity>#{order[:product_quantity]}</product_quantity>
                          <product_name>#{order[:product_name]}</product_name>
                          <product_reference>#{order[:product_reference]}</product_reference>
                          <product_ean13>#{order[:product_ean13]}</product_ean13>
                          <product_isbn>#{order[:product_isbn]}</product_isbn>
                          <product_upc>#{order[:product_upc]}</product_upc>
                          <product_price>#{order[:product_price]}</product_price>
                          <id_customization>#{order[:id_customization]}</id_customization>
                          <unit_price_tax_incl>#{order[:unit_price_tax_incl]}</unit_price_tax_incl>
                          <unit_price_tax_excl>#{order[:unit_price_tax_excl]}</unit_price_tax_excl>
                          </order_row>
                      </order_rows>
                  </associations>
              </order>
          </prestashop>",
              basic_auth: @auth,
              header: {
                "Content-Type" => 'text/xml',
                "charset" => 'utf-8'
               }
          })
          puts ord.body, ord.code
    end

    def self.update_order(id,order)
      ord  = HTTParty.put("#{@api_url}orders/#{id}",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order>
                <id>#{id}</id>
                <id_address_delivery>#{order[:id_address_delivery]}</id_address_delivery>
                <id_address_invoice>#{order[:id_address_invoice]}</id_address_invoice>
                <id_cart>#{order[:id_cart]}</id_cart>
                <id_currency>#{order[:id_currency]}</id_currency>
                <id_lang>#{order[:id_lang]}</id_lang>
                <id_customer>#{order[:id_customer]}</id_customer>
                <id_carrier>#{order[:id_carrier]}</id_carrier>
                <current_state>#{order[:current_state]}</current_state>
                <module>#{order[:module]}</module>
                <invoice_number>#{order[:invoice_number]}</invoice_number>
                <invoice_date>#{order[:invoice_date]}</invoice_date>
                <delivery_number>#{order[:delivery_number]}</delivery_number>
                <delivery_date>#{order[:delivery_date]}</delivery_date>
                <valid>#{order[:valid]}</valid>
                <date_add>#{order[:date_add]}</date_add>
                <date_upd>#{order[:date_upd]}</date_upd>
                <shipping_number>#{order[:shipping_number]}</shipping_number>
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
                    <order_rows>
                        <order_row>
                        <id></id>
                        <product_id>#{order[:product_id]}</product_id>
                        <product_attribute_id>#{order[:product_attribute_id]}</product_attribute_id>
                        <product_quantity>#{order[:product_quantity]}</product_quantity>
                        <product_name>#{order[:product_name]}</product_name>
                        <product_reference>#{order[:product_reference]}</product_reference>
                        <product_ean13>#{order[:product_ean13]}</product_ean13>
                        <product_isbn>#{order[:product_isbn]}</product_isbn>
                        <product_upc>#{order[:product_upc]}</product_upc>
                        <product_price>#{order[:product_price]}</product_price>
                        <id_customization>#{order[:id_customization]}</id_customization>
                        <unit_price_tax_incl>#{order[:unit_price_tax_incl]}</unit_price_tax_incl>
                        <unit_price_tax_excl>#{order[:unit_price_tax_excl]}</unit_price_tax_excl>
                        </order_row>
                    </order_rows>
                </associations>
            </order>
        </prestashop>",
            basic_auth: @auth,
            header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
             }
        })
        puts ord.body, ord.code
    end

    def self.delete_order(id)
      order = HTTParty.delete("#{@api_url}orders/#{id}",
      {
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }
      })
      puts order.code
    end

    def self.get_order(id)
    order = HTTParty.get("#{@api_url}orders/#{id}",
    {
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }
    })
    puts order.body, order.code
    end



    ##### CATEGORIES ######################################################################################################################################################

    def self.post_categories(categories)
      cat = HTTParty.post("#{@api_url}categories/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <category>
              <id></id>
              <id_parent>#{categories[:id_parent]}</id_parent>
              <active>#{categories[:active]}</active>
              <id_shop_default>#{categories[:id_shop_default]}</id_shop_default>
              <is_root_category>#{categories[:is_root_category]}</is_root_category>
              <position>#{categories[:position]}</position>
              <date_add>#{categories[:date_add]}</date_add>
              <date_upd>#{categories[:date_upd]}</date_upd>
              <name>
                <language id=\"1\">#{categories[:name]}</language>
                <language id=\"2\">#{categories[:name1]}</language>
              </name>
              <link_rewrite>
                <language id=\"1\">#{categories[:link_rewrite]}</language>
                <language id=\"2\">#{categories[:link_rewrite1]}</language>
              </link_rewrite>
              <description>
                <language id=\"1\">#{categories[:description]}</language>
                <language id=\"2\">#{categories[:description1]}</language>
              </description>
              <meta_title>
                <language id=\"1\">#{categories[:meta_title]}</language>
                <language id=\"2\">#{categories[:meta_title1]}</language>
              </meta_title>
              <meta_description>
                <language id=\"1\">#{categories[:meta_description]}</language>
                <language id=\"2\">#{categories[:meta_description1]}</language>
              </meta_description>
              <meta_keywords>
                <language id=\"1\">#{categories[:meta_keywords]}</language>
                <language id=\"2\">#{categories[:meta_keywords1]}</language>
              </meta_keywords>
              <associations>
                <categories>
                  <category>
                    <id>#{categories[:id_category]}</id>
                  </category>
                </categories>
                <products>
                  <product>
                    <id>#{categories[:id_product]}</id>
                  </product>
                </products>
              </associations>
            </category>
          </prestashop>
          ",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts cat.body,cat.code
    end

    def self.update_categories(id,categories)
      cat = HTTParty.put("#{@api_url}categories/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <category>
            <id>#{id}</id>
            <id_parent>#{categories[:id_parent]}</id_parent>
            <active>#{categories[:active]}</active>
            <id_shop_default>#{categories[:id_shop_default]}</id_shop_default>
            <is_root_category>#{categories[:is_root_category]}</is_root_category>
            <position>#{categories[:position]}</position>
            <date_add>#{categories[:date_add]}</date_add>
            <date_upd>#{categories[:date_upd]}</date_upd>
            <name>
              <language id=\"1\">#{categories[:name]}</language>
              <language id=\"2\">#{categories[:name1]}</language>
            </name>
            <link_rewrite>
              <language id=\"1\">#{categories[:link_rewrite]}</language>
              <language id=\"2\">#{categories[:link_rewrite1]}</language>
            </link_rewrite>
            <description>
              <language id=\"1\">#{categories[:description]}</language>
              <language id=\"2\">#{categories[:description1]}</language>
            </description>
            <meta_title>
              <language id=\"1\">#{categories[:meta_title]}</language>
              <language id=\"2\">#{categories[:meta_title1]}</language>
            </meta_title>
            <meta_description>
              <language id=\"1\">#{categories[:meta_description]}</language>
              <language id=\"2\">#{categories[:meta_description1]}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{categories[:meta_keywords]}</language>
              <language id=\"2\">#{categories[:meta_keywords1]}</language>
            </meta_keywords>
            <associations>
              <categories>
                <category>
                  <id>#{categories[:id_category]}</id>
                </category>
              </categories>
              <products>
                <product>
                  <id>#{categories[:id_product]}</id>
                </product>
              </products>
            </associations>
          </category>
        </prestashop>
        ",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

    })
    puts cat.body,cat.code
    end

    def self.delete_categories(id)
      cat = HTTParty.delete("#{@api_url}categories/#{id}",
      {
        basic_auth: @auth
      })
      puts cat.body,cat.code
    end

    def self.get_categories(id)
      cat = HTTParty.get("#{@api_url}categories/#{id}",
      {
        basic_auth: @auth
      })
      puts cat.body,cat.code
    end

    ##### COMBINATIONS ###############################################################################################################################################

    def self.post_combinations(combinations)
        comb = HTTParty.post("#{@api_url}combinations/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <combination>
              <id></id>
              <id_product>#{combinations[:id_product]}</id_product>
              <location>#{combinations[:location]}</location>
              <ean13>#{combinations[:ean13]}</ean13>
              <isbn>#{combinations[:isbn]}</isbn>
              <upc>#{combinations[:upc]}</upc>
              <mpn>#{combinations[:mpn]}</mpn>
              <quantity>#{combinations[:quantity]}</quantity>
              <reference>#{combinations[:reference]}</reference>
              <supplier_reference>#{combinations[:supplier_reference]}</supplier_reference>
              <wholesale_price>#{combinations[:wholesale_price]}</wholesale_price>
              <price>#{combinations[:price]}</price>
              <ecotax>#{combinations[:ecotax]}</ecotax>
              <weight>#{combinations[:weight]}</weight>
              <unit_price_impact>#{combinations[:unit_price_impact]}</unit_price_impact>
              <minimal_quantity>#{combinations[:minimal_quantity]}</minimal_quantity>
              <low_stock_threshold>#{combinations[:low_stock_threshold]}</low_stock_threshold>
              <low_stock_alert>#{combinations[:low_stock_alert]}</low_stock_alert>
              <default_on>#{combinations[:default_on]}</default_on>
              <available_date>#{combinations[:available_date]}</available_date>
              <associations>
                <product_option_values>
                  <product_option_value>
                    <id>#{combinations[:id_product_option_value]}</id>
                  </product_option_value>
                </product_option_values>
                <images>
                  <image>
                    <id>#{combinations[:id_image]}</id>
                  </image>
                </images>
              </associations>
            </combination>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts comb.body,comb.code
    end

    def self.update_combinations(id,combinations)
      comb = HTTParty.put("#{@api_url}combinations/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <combination>
            <id>#{id}</id>
            <id_product>#{combinations[:id_product]}</id_product>
            <location>#{combinations[:location]}</location>
            <ean13>#{combinations[:ean13]}</ean13>
            <isbn>#{combinations[:isbn]}</isbn>
            <upc>#{combinations[:upc]}</upc>
            <mpn>#{combinations[:mpn]}</mpn>
            <quantity>#{combinations[:quantity]}</quantity>
            <reference>#{combinations[:reference]}</reference>
            <supplier_reference>#{combinations[:supplier_reference]}</supplier_reference>
            <wholesale_price>#{combinations[:wholesale_price]}</wholesale_price>
            <price>#{combinations[:price]}</price>
            <ecotax>#{combinations[:ecotax]}</ecotax>
            <weight>#{combinations[:weight]}</weight>
            <unit_price_impact>#{combinations[:unit_price_impact]}</unit_price_impact>
            <minimal_quantity>#{combinations[:minimal_quantity]}</minimal_quantity>
            <low_stock_threshold>#{combinations[:low_stock_threshold]}</low_stock_threshold>
            <low_stock_alert>#{combinations[:low_stock_alert]}</low_stock_alert>
            <default_on>#{combinations[:default_on]}</default_on>
            <available_date>#{combinations[:available_date]}</available_date>
            <associations>
              <product_option_values>
                <product_option_value>
                  <id>#{combinations[:id_product_option_value]}</id>
                </product_option_value>
              </product_option_values>
              <images>
                <image>
                  <id>#{combinations[:id_image]}</id>
                </image>
              </images>
            </associations>
          </combination>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

    })
    puts comb.body,comb.code
    end

    def self.delete_combinations(id)
      comb = HTTParty.delete("#{@api_url}combinations/#{id}",
      {
        basic_auth: @auth
      })
    puts comb.body,comb.code
    end

    def self.get_combinations(id)
      comb = HTTParty.get("#{@api_url}combinations/#{id}",
      {
        basic_auth: @auth
      })
    puts comb.body,comb.code
    end


    
    ##### MANUFACTURERS ##############################################################################################################################################

    def self.post_manufacturers(manufacturers)
        attach = HTTParty.post("#{@api_url}manufacturers/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <manufacturer>
              <id></id>
              <active>#{manufacturers[:active]}</active>
              <name>#{manufacturers[:name]}</name>
              <date_add>#{manufacturers[:date_add]}</date_add>
              <date_upd>#{manufacturers[:date_upd]}</date_upd>
              <description>
                <language id=\"1\">#{manufacturers[:description]}</language>
                <language id=\"2\">#{manufacturers[:description1]}</language>
              </description>
              <short_description>
                <language id=\"1\">#{manufacturers[:short_description]}</language>
                <language id=\"2\">#{manufacturers[:short_description1]}</language>
              </short_description>
              <meta_title>
                <language id=\"1\">#{manufacturers[:meta_title]}</language>
                <language id=\"2\">#{manufacturers[:meta_title1]}</language>
              </meta_title>
              <meta_description>
                <language id=\"1\">#{manufacturers[:meta_description]}</language>
                <language id=\"2\">#{manufacturers[:meta_description1]}</language>
              </meta_description>
              <meta_keywords>
                <language id=\"1\">#{manufacturers[:meta_keywords]}</language>
                <language id=\"2\">#{manufacturers[:meta_keywords1]}</language>
              </meta_keywords>
              <associations>
                <addresses>
                  <address>
                    <id>#{manufacturers[:address_id]}</id>
                  </address>
                </addresses>
              </associations>
            </manufacturer>
          </prestashop>",
            basic_auth: @auth,
            header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
            }
        })
        puts attach.body, attach.code
    end

    def self.update_manufacturers(id,manufacturers)
      attach = HTTParty.put("#{@api_url}manufacturers/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <manufacturer>
            <id>#{id}</id>
            <active>#{manufacturers[:active]}</active>
            <name>#{manufacturers[:name]}</name>
            <date_add>#{manufacturers[:date_add]}</date_add>
            <date_upd>#{manufacturers[:date_upd]}</date_upd>
            <description>
              <language id=\"1\">#{manufacturers[:description]}</language>
              <language id=\"2\">#{manufacturers[:description1]}</language>
            </description>
            <short_description>
              <language id=\"1\">#{manufacturers[:short_description]}</language>
              <language id=\"2\">#{manufacturers[:short_description1]}</language>
            </short_description>
            <meta_title>
              <language id=\"1\">#{manufacturers[:meta_title]}</language>
              <language id=\"2\">#{manufacturers[:meta_title1]}</language>
            </meta_title>
            <meta_description>
              <language id=\"1\">#{manufacturers[:meta_description]}</language>
              <language id=\"2\">#{manufacturers[:meta_description1]}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{manufacturers[:meta_keywords]}</language>
              <language id=\"2\">#{manufacturers[:meta_keywords1]}</language>
            </meta_keywords>
            <associations>
              <addresses>
                <address>
                  <id>#{manufacturers[:address_id]}</id>
                </address>
              </addresses>
            </associations>
          </manufacturer>
        </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts attach.body, attach.code
    end

    def self.delete_manufacturers(id)
      attach = HTTParty.delete("#{@api_url}manufacturers/#{id}",
      {
          basic_auth: @auth,    
      })
      puts attach.body, attach.code
    end

    def self.get_manufacturers(id)
      attach = HTTParty.get("#{@api_url}manufacturers/#{id}",
      {
          basic_auth: @auth,    
      })
      puts attach.body, attach.code
    end

    ####### TAGS ####################################################################################################################################################


    def self.post_tags(tag)
        tag = HTTParty.post("#{@api_url}tags/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <tag>
              <id></id>
              <id_lang>#{tag[:id_lang]}</id_lang>
              <name>#{tag[:name]}</name>
            </tag>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts tag.body,tag.code
    end

    def self.update_tags(id,tag)
      tag = HTTParty.post("#{@api_url}tags/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <tag>
            <id>#{id}</id>
            <id_lang>#{tag[:id_lang]}</id_lang>
            <name>#{tag[:name]}</name>
          </tag>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

    })
    puts tag.body,tag.code
    end

    def self.update_tags(id,tag)
      tag = HTTParty.put("#{@api_url}tags/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <tag>
            <id>#{id}</id>
            <id_lang>#{tag[:id_lang]}</id_lang>
            <name>#{tag[:name]}</name>
          </tag>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

    })
    puts tag.body,tag.code
    end

    def self.delete_tags(id)
      tag = HTTParty.delete("#{@api_url}tags/#{id}",
        {basic_auth: @auth}
      )

    puts tag.body,tag.code
    end

    def self.get_tags(id)
      tag = HTTParty.get("#{@api_url}tags/#{id}",
        {basic_auth: @auth}
      )

    puts tag.body,tag.code
    end

    ##### PRODUCT CUSTOMIZATION FIELD ###################################################################################################################################

    def self.post_product_customization_field(product_customization_field)
        prod_cust_field = HTTParty.post("#{@api_url}product_customization_fields/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <customization_field>
              <id></id>
              <id_product>#{product_customization_field[:id_product]}</id_product>
              <type>#{product_customization_field[:type]}</type>
              <required>#{product_customization_field[:required]}</required>
              <is_module>#{product_customization_field[:is_module]}</is_module>
              <is_deleted>#{product_customization_field[:is_deleted]}</is_deleted>
              <name>
                <language id=\"1\">#{product_customization_field[:name]}</language>
                <language id=\"2\">#{product_customization_field[:name1]}</language>
              </name>
            </customization_field>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts prod_cust_field.body,prod_cust_field.code
    end

    def self.update_product_customization_field(id,product_customization_field)
      prod_cust_field = HTTParty.put("#{@api_url}product_customization_fields/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <customization_field>
            <id>#{id}</id>
            <id_product>#{product_customization_field[:id_product]}</id_product>
            <type>#{product_customization_field[:type]}</type>
            <required>#{product_customization_field[:required]}</required>
            <is_module>#{product_customization_field[:is_module]}</is_module>
            <is_deleted>#{product_customization_field[:is_deleted]}</is_deleted>
            <name>
              <language id=\"1\">#{product_customization_field[:name]}</language>
              <language id=\"2\">#{product_customization_field[:name1]}</language>
            </name>
          </customization_field>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

    })
    puts prod_cust_field.body,prod_cust_field.code
    end

    def self.delete_product_customization_field(id)
      prod_cust_field = HTTParty.delete("#{@api_url}product_customization_fields/#{id}",
      {
        basic_auth: @auth
      })
      puts prod_cust_field.body,prod_cust_field.code
    end

    def self.get_product_customization_field(id)
      prod_cust_field = HTTParty.get("#{@api_url}product_customization_fields/#{id}",
      {
        basic_auth: @auth
      })
      puts prod_cust_field.body,prod_cust_field.code
    end

    ##### PRODUCT FEATURE VALUES #######################################################################################################################################

    def self.post_product_feature_values(product_feature_values)
        prod_feat_val = HTTParty.post("#{@api_url}product_feature_values/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <product_feature_value>
              <id></id>
              <id_feature>#{product_feature_values[:id_feature]}</id_feature>
              <custom>#{product_feature_values[:custom]}</custom>
              <value>
                <language id=\"1\">#{product_feature_values[:value]}</language>
                <language id=\"2\">#{product_feature_values[:value1]}</language>
              </value>
            </product_feature_value>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts prod_feat_val.body,prod_feat_val.code
    end

    def self.update_product_feature_values(id,product_feature_values)
      prod_feat_val = HTTParty.put("#{@api_url}product_feature_values/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <product_feature_value>
            <id>#{id}</id>
            <id_feature>#{product_feature_values[:id_feature]}</id_feature>
            <custom>#{product_feature_values[:custom]}</custom>
            <value>
              <language id=\"1\">#{product_feature_values[:value]}</language>
              <language id=\"2\">#{product_feature_values[:value1]}</language>
            </value>
          </product_feature_value>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

      })
      puts prod_feat_val.body,prod_feat_val.code
    end

    def self.delete_product_feature_values(id)
      prod_feat_val = HTTParty.delete("#{@api_url}product_feature_values/#{id}",
      {
        basic_auth: @auth
      })
      puts prod_feat_val.body,prod_feat_val.code
    end

    def self.get_product_feature_values(id)
      prod_feat_val = HTTParty.get("#{@api_url}product_feature_values/#{id}",
      {
        basic_auth: @auth
      })
      puts prod_feat_val.body,prod_feat_val.code
    end

    ##### PRODUCT FEATURES #############################################################################################################################################

    def self.post_product_features(product_features)
        prod_feat = HTTParty.post("#{@api_url}product_features/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <product_feature>
              <id></id>
              <position>#{product_features[:position]}</position>
              <name>
                <language id=\"1\">#{product_features[:name]}</language>
                <language id=\"2\">#{product_features[:name1]}</language>
              </name>
            </product_feature>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts prod_feat.body,prod_feat.code
    end

    def self.update_product_features(id,product_features)
      prod_feat = HTTParty.put("#{@api_url}product_features/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <product_feature>
            <id>#{id}</id>
            <position>#{product_features[:position]}</position>
            <name>
              <language id=\"1\">#{product_features[:name]}</language>
              <language id=\"2\">#{product_features[:name1]}</language>
            </name>
          </product_feature>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }

    })
    puts prod_feat.body,prod_feat.code
    end

    def self.delete_product_features(id)
      prod_feat = HTTParty.delete("#{@api_url}product_features/#{id}",
      {
        basic_auth: @auth
      })
      puts prod_feat.body,prod_feat.code
    end

    def self.get_product_features(id)
      prod_feat = HTTParty.get("#{@api_url}product_features/#{id}",
      {
        basic_auth: @auth
      })
      puts prod_feat.body,prod_feat.code
    end

    ##### PRODUCT OPTIONS VALUES ########################################################################################################################################

    def self.post_product_options_values(product_option_value)
        prod_opt_val = HTTParty.post("#{@api_url}product_option_values",
        {
            body: 
            "<prestashop>
                <product_option_value>
                <id></id>
                    <id_attribute_group>#{product_option_value[:id_attribute_group]}</id_attribute_group>
                    <color>#{product_option_value[:color]}</color>
                    <position>#{product_option_value[:position]}</position>
                    <name>
                    <language id=\"1\">#{product_option_value[:name]}</language>
                    <language id=\"2\">#{product_option_value[:name1]}</language>
                    </name>
                </product_option_value>
            </prestashop>",
            basic_auth: @auth,
            header: {
                "Content-Type" => 'text/xml',
                "charset" => 'utf-8'
            }

        })
        puts prod_opt_val.body,prod_opt_val.code
    end

    def self.update_product_options_values(id,product_option_value)
      prod_opt_val = HTTParty.put("#{@api_url}product_option_values/#{id}",
      {
          body: 
          "<prestashop>
              <product_option_value>
              <id>#{id}</id>
                  <id_attribute_group>#{product_option_value[:id_attribute_group]}</id_attribute_group>
                  <color>#{product_option_value[:color]}</color>
                  <position>#{product_option_value[:position]}</position>
                  <name>
                  <language id=\"1\">#{product_option_value[:name]}</language>
                  <language id=\"2\">#{product_option_value[:name1]}</language>
                  </name>
              </product_option_value>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }

      })
      puts prod_opt_val.body,prod_opt_val.code
    end

    def self.delete_product_options_values(id)
      prod_opt_val = HTTParty.delete("#{@api_url}product_option_values/#{id}",
      {
          basic_auth: @auth
      })
      puts prod_opt_val.body,prod_opt_val.code
    end

    def self.get_product_options_values(id)
      prod_opt_val = HTTParty.get("#{@api_url}product_option_values/#{id}",
      {
          basic_auth: @auth
      })
      puts prod_opt_val.body,prod_opt_val.code
    end

    ##### PRODUCT SUPPLIERS #############################################################################################################################################

    def self.post_product_suppliers(product_suppliers)
        prod_sup = HTTParty.post("#{@api_url}product_suppliers/",
        {
            body: 
                "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
                <product_suppliers>
                <id></id>
                <id_product>#{product_suppliers[:id_product]}</id_product>
                <id_product_attribute>#{product_suppliers[:id_product_attribute]}</id_product_attribute>
                <id_supplier>#{product_suppliers[:id_supplier]}</id_supplier>
                <id_currency>#{product_suppliers[:id_currency]}</id_currency>
                <product_supplier_reference>#{product_suppliers[:product_supplier_reference]}</product_supplier_reference>
                <product_supplier_price_te>#{product_suppliers[:product_supplier_price_te]}</product_supplier_price_te>
                </product_suppliers>
            </prestashop>",
            basic_auth: @auth,
            header: {
                "Content-Type" => 'text/xml',
                "charset" => 'utf-8'
            }
        })
        puts prod_sup.body,prod_sup.code
    end

    def self.update_product_suppliers(id,product_suppliers)
      prod_sup = HTTParty.put("#{@api_url}product_suppliers/#{id}",
      {
          body: 
              "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
              <product_suppliers>
              <id>#{id}</id>
              <id_product>#{product_suppliers[:id_product]}</id_product>
              <id_product_attribute>#{product_suppliers[:id_product_attribute]}</id_product_attribute>
              <id_supplier>#{product_suppliers[:id_supplier]}</id_supplier>
              <id_currency>#{product_suppliers[:id_currency]}</id_currency>
              <product_supplier_reference>#{product_suppliers[:product_supplier_reference]}</product_supplier_reference>
              <product_supplier_price_te>#{product_suppliers[:product_supplier_price_te]}</product_supplier_price_te>
              </product_suppliers>
          </prestashop>",
          basic_auth: @auth,
          header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
          }
      })
      puts prod_sup.body,prod_sup.code
    end

    def self.delete_product_suppliers(id)
      prod_sup = HTTParty.delete("#{@api_url}product_suppliers/#{id}",
      {
          basic_auth: @auth
      })
      puts prod_sup.body,prod_sup.code
    end

    def self.get_product_suppliers(id)
      prod_sup = HTTParty.get("#{@api_url}product_suppliers/#{id}",
      {
          basic_auth: @auth
      })
      puts prod_sup.body,prod_sup.code
    end

    ##### PRODUCTS OPTIONS ###########################################################################################################################################

    def self.post_product_options(product_options)
      prod_opt = HTTParty.post("#{@api_url}product_options/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <product_option>
            <id></id>
            <is_color_group>#{product_options[:is_color_group]}</is_color_group>
            <group_type>#{product_options[:group_type]}</group_type>
            <position>#{product_options[:position]}</position>
            <name>
              <language id=\"1\">#{product_options[:name]}</language>
              <language id=\"2\">#{product_options[:name1]}</language>
            </name>
            <public_name>
              <language id=\"1\">#{product_options[:public_name]}</language>
              <language id=\"2\">#{product_options[:public_name1]}</language>
            </public_name>
            <associations>
              <product_option_values>
                <product_option_value>
                  <id>#{product_options[:product_option_value]}</id>
                </product_option_value>
              </product_option_values>
            </associations>
          </product_option>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }
    })
    puts prod_opt.body,prod_opt.code
    end

    def self.update_product_options(id,product_options)
      prod_opt = HTTParty.put("#{@api_url}product_options/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <product_option>
            <id>#{id}</id>
            <is_color_group>#{product_options[:is_color_group]}</is_color_group>
            <group_type>#{product_options[:group_type]}</group_type>
            <position>#{product_options[:position]}</position>
            <name>
              <language id=\"1\">#{product_options[:name]}</language>
              <language id=\"2\">#{product_options[:name1]}</language>
            </name>
            <public_name>
              <language id=\"1\">#{product_options[:public_name]}</language>
              <language id=\"2\">#{product_options[:public_name1]}</language>
            </public_name>
            <associations>
              <product_option_values>
                <product_option_value>
                  <id>#{product_options[:product_option_value]}</id>
                </product_option_value>
              </product_option_values>
            </associations>
          </product_option>
        </prestashop>",
        basic_auth: @auth,
        header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
        }
    })
    puts prod_opt.body,prod_opt.code
    end

    def self.delete_product_options(id)
      prod_opt = HTTParty.delete("#{@api_url}product_options/#{id}",
      {
        basic_auth: @auth
    })
    puts prod_opt.body,prod_opt.code
    end

    def self.get_product_options(id)
      prod_opt = HTTParty.get("#{@api_url}product_options/#{id}",
      {
        basic_auth: @auth
    })
    puts prod_opt.body,prod_opt.code
    end

    ##### PRODUCT #################################################################################################################################################

    def self.post_product(product)
        prod = HTTParty.post("#{@api_url}products/",
        {
            body:
            "<prestashop xmlns:ns0=\"http://www.w3.org/1999/xlink\">
                 <product>
                    <id></id>
                    <id_manufacturer>#{product[:id_manufacturer]}</id_manufacturer>
                    <id_supplier>#{product[:id_supplier]}</id_supplier>
                    <id_category_default>#{product[:id_category_default]}</id_category_default>
                    <new>#{product[:new]}</new>
                    <cache_default_attribute>#{product[:cache_default_attribute]}</cache_default_attribute>
                    <id_default_image notFilterable=\"true\">#{product[:id_default_image]}</id_default_image>
                    <id_default_combination notFilterable=\"true\">#{product[:id_default_combination]}</id_default_combination>
                    <id_tax_rules_group>#{product[:id_tax_rules_group]}</id_tax_rules_group>
                    <type notFilterable=\"true\">#{product[:type]}</type>
                    <id_shop_default>#{product[:id_shop_default]}</id_shop_default>
                    <reference>#{product[:reference]}</reference>
                    <supplier_reference>#{product[:supplier_reference]}</supplier_reference>
                    <location>#{product[:location]}</location>
                    <width>#{product[:width]}</width>
                    <height>#{product[:height]}</height>
                    <depth>#{product[:depth]}</depth>
                    <weight>#{product[:weight]}</weight>
                    <quantity_discount>#{product[:quantity_discount]}</quantity_discount>
                    <ean13>#{product[:ean13]}</ean13>
                    <isbn>#{product[:isbn]}</isbn>
                    <upc>#{product[:upc]}</upc>
                    <mpn>#{product[:mpn]}</mpn>
                    <cache_is_pack>#{product[:cache_is_pack]}</cache_is_pack>
                    <cache_has_attachments>#{product[:cache_has_attachments]}</cache_has_attachments>
                    <is_virtual>#{product[:is_virtual]}</is_virtual>
                    <state>#{product[:state]}</state>
                    <additional_delivery_times>#{product[:additional_delivery_times]}</additional_delivery_times>
                    <delivery_in_stock>
                        <language id=\"1\">#{product[:delivery_in_stock]}</language>
                    </delivery_in_stock>
                    <delivery_out_stock>
                        <language id=\"1\">#{product[:delivery_out_stock]}</language>
                    </delivery_out_stock>
                    <product_type>#{product[:product_type]}</product_type>
                    <on_sale>#{product[:on_sale]}</on_sale>
                    <online_only>#{product[:online_only]}</online_only>
                    <ecotax>#{product[:ecotax]}</ecotax>
                    <minimal_quantity>#{product[:minimal_quantity]}</minimal_quantity>
                    <low_stock_threshold>#{product[:low_stock_threshold]}</low_stock_threshold>
                    <low_stock_alert>#{product[:low_stock_alert]}</low_stock_alert>
                    <price>#{product[:price]}</price>
                    <wholesale_price>#{product[:wholesale_price]}</wholesale_price>
                    <unity>#{product[:unity]}</unity>
                    <unit_price_ratio>#{product[:unit_price_ratio]}</unit_price_ratio>
                    <additional_shipping_cost>#{product[:additional_shipping_cost]}</additional_shipping_cost>
                    <customizable>#{product[:customizable]}</customizable>
                    <text_fields>#{product[:text_fields]}</text_fields>
                    <uploadable_files>#{product[:uploadable_files]}</uploadable_files>
                    <active>#{product[:active]}</active>
                    <redirect_type>#{product[:redirect_type]}</redirect_type>
                    <id_type_redirected>#{product[:id_type_redirected]}</id_type_redirected>
                    <available_for_order>#{product[:available_for_order]}</available_for_order>
                    <available_date>#{product[:available_date]}</available_date>
                    <show_condition>#{product[:show_condition]}</show_condition>
                    <condition>#{product[:condition]}</condition>
                    <show_price>#{product[:show_price]}</show_price>
                    <indexed>#{product[:indexed]}</indexed>
                    <visibility>#{product[:visibility]}</visibility>
                    <advanced_stock_management>#{product[:advanced_stock_management]}</advanced_stock_management>
                    <date_add>#{product[:date_add]}</date_add>
                    <date_upd>#{product[:date_upd]}</date_upd>
                    <pack_stock_type>#{product[:pack_stock_type]}</pack_stock_type>
                    <meta_description>
                        <language id=\"1\">#{product[:meta_description]}</language>
                    </meta_description>
                    <meta_keywords>
                        <language id=\"1\">#{product[:meta_keywords]}</language>
                    </meta_keywords>
                    <meta_title>
                        <language id=\"1\">#{product[:meta_title]}</language>
                    </meta_title>
                    <link_rewrite>
                        <language id=\"1\">#{product[:link_rewrite]}</language>
                    </link_rewrite>
                    <name>
                        <language id=\"1\">#{product[:name]}</language>
                    </name>
                    <description>
                        <language id=\"1\">#{product[:desciption]}</language>
                    </description>
                    <description_short>
                        <language id=\"1\">#{product[:description_short]}</language>
                    </description_short>
                    <available_now>
                        <language id=\"1\">#{product[:available_now]}</language>
                    </available_now>
                    <available_later>
                         <language id=\"1\">#{product[:available_later]}</language>
                    </available_later>
                    <associations>
                        <categories nodeType=\"category\" api=\"categories\">
                          <category>
                            <id>#{product[:category_id]}</id>
                          </category>
                        </categories>
                        <images nodeType=\"image\" api=\"images\">
                          <image>
                            <id> #{product[:image_id]}</id>
                          </image>
                        </images>
                        <combinations nodeType=\"combination\" api=\"combinations\">
                          <combination>
                            <id>#{product[:combination_id]}</id>
                           </combination>
                        </combinations>
                        <product_option_values nodeType=\"product_option_value\" api=\"product_option_values\">
                          <product_option_value>
                            <id>#{product[:product_option_value_id]}</id>
                          </product_option_value>
                        </product_option_values>
                        <product_features nodeType=\"product_feature\" api=\"product_features\">
                          <product_feature>
                            <id>#{product[:product_features_id]}</id>
                            <id_feature_value>#{product[:product_feature_values_id]}</id_feature_value>
                          </product_feature>
                        </product_features>
                        <tags nodeType=\"tag\" api=\"tags\">
                          <tag>
                            <id>#{product[:tag_id]}</id>
                          </tag>
                        </tags>
                        <stock_availables nodeType=\"stock_available\" api=\"stock_availables\">
                          <stock_available>
                            <id>#{product[:stock_available_id]}</id>
                            <id_product_attribute>#{product[:stock_available_id_product_attribute]}</id_product_attribute>
                          </stock_available>
                        </stock_availables>
                        <attachments nodeType=\"attachment\" api=\"attachments\">
                          <attachment>
                            <id>#{product[:attachment_id]}</id>
                          </attachment>
                        </attachments>
                        <accessories nodeType=\"product\" api=\"products\">
                          <product>
                            <id>#{product[:product_accessories_id]}</id>
                          </product>
                        </accessories>
                        <product_bundle nodeType=\"product\" api=\"products\">
                          <product>
                            <id>#{product[:product_bundle_id]}</id>
                            <id_product_attribute>#{product[:product_attribute_id]}</id_product_attribute>
                            <quantity>#{product[:quantity]}</quantity>
                          </product>
                        </product_bundle>
                    </associations>
                </product>
             </prestashop>",
                basic_auth: @auth,
                header: {
                    "Content-Type" => 'text/xml',
                    "charset" => 'utf-8'
                }
        })
        puts prod.body, prod.code
    end

    def self.update_product(id,product)
        prod = HTTParty.put("#{@api_url}products/#{id}",
        {
          body:"<prestashop xmlns:ns0=\"http://www.w3.org/1999/xlink\">
          <product>
             <id>#{id}</id>
             <id_manufacturer>#{product[:id_manufacturer]}</id_manufacturer>
             <id_supplier>#{product[:id_supplier]}</id_supplier>
             <id_category_default>#{product[:id_category_default]}</id_category_default>
             <new>#{product[:new]}</new>
             <cache_default_attribute>#{product[:cache_default_attribute]}</cache_default_attribute>
             <id_default_image notFilterable=\"true\">#{product[:id_default_image]}</id_default_image>
             <id_default_combination notFilterable=\"true\">#{product[:id_default_combination]}</id_default_combination>
             <id_tax_rules_group>#{product[:id_tax_rules_group]}</id_tax_rules_group>
             <type notFilterable=\"true\">#{product[:type]}</type>
             <id_shop_default>#{product[:id_shop_default]}</id_shop_default>
             <reference>#{product[:reference]}</reference>
             <supplier_reference>#{product[:supplier_reference]}</supplier_reference>
             <location>#{product[:location]}</location>
             <width>#{product[:width]}</width>
             <height>#{product[:height]}</height>
             <depth>#{product[:depth]}</depth>
             <weight>#{product[:weight]}</weight>
             <quantity_discount>#{product[:quantity_discount]}</quantity_discount>
             <ean13>#{product[:ean13]}</ean13>
             <isbn>#{product[:isbn]}</isbn>
             <upc>#{product[:upc]}</upc>
             <mpn>#{product[:mpn]}</mpn>
             <cache_is_pack>#{product[:cache_is_pack]}</cache_is_pack>
             <cache_has_attachments>#{product[:cache_has_attachments]}</cache_has_attachments>
             <is_virtual>#{product[:is_virtual]}</is_virtual>
             <state>#{product[:state]}</state>
             <additional_delivery_times>#{product[:additional_delivery_times]}</additional_delivery_times>
             <delivery_in_stock>
                 <language id=\"1\">#{product[:delivery_in_stock]}</language>
             </delivery_in_stock>
             <delivery_out_stock>
                 <language id=\"1\">#{product[:delivery_out_stock]}</language>
             </delivery_out_stock>
             <product_type>#{product[:product_type]}</product_type>
             <on_sale>#{product[:on_sale]}</on_sale>
             <online_only>#{product[:online_only]}</online_only>
             <ecotax>#{product[:ecotax]}</ecotax>
             <minimal_quantity>#{product[:minimal_quantity]}</minimal_quantity>
             <low_stock_threshold>#{product[:low_stock_threshold]}</low_stock_threshold>
             <low_stock_alert>#{product[:low_stock_alert]}</low_stock_alert>
             <price>#{product[:price]}</price>
             <wholesale_price>#{product[:wholesale_price]}</wholesale_price>
             <unity>#{product[:unity]}</unity>
             <unit_price_ratio>#{product[:unit_price_ratio]}</unit_price_ratio>
             <additional_shipping_cost>#{product[:additional_shipping_cost]}</additional_shipping_cost>
             <customizable>#{product[:customizable]}</customizable>
             <text_fields>#{product[:text_fields]}</text_fields>
             <uploadable_files>#{product[:uploadable_files]}</uploadable_files>
             <active>#{product[:active]}</active>
             <redirect_type>#{product[:redirect_type]}</redirect_type>
             <id_type_redirected>#{product[:id_type_redirected]}</id_type_redirected>
             <available_for_order>#{product[:available_for_order]}</available_for_order>
             <available_date>#{product[:available_date]}</available_date>
             <show_condition>#{product[:show_condition]}</show_condition>
             <condition>#{product[:condition]}</condition>
             <show_price>#{product[:show_price]}</show_price>
             <indexed>#{product[:indexed]}</indexed>
             <visibility>#{product[:visibility]}</visibility>
             <advanced_stock_management>#{product[:advanced_stock_management]}</advanced_stock_management>
             <date_add>#{product[:date_add]}</date_add>
             <date_upd>#{product[:date_upd]}</date_upd>
             <pack_stock_type>#{product[:pack_stock_type]}</pack_stock_type>
             <meta_description>
                 <language id=\"1\">#{product[:meta_description]}</language>
             </meta_description>
             <meta_keywords>
                 <language id=\"1\">#{product[:meta_keywords]}</language>
             </meta_keywords>
             <meta_title>
                 <language id=\"1\">#{product[:meta_title]}</language>
             </meta_title>
             <link_rewrite>
                 <language id=\"1\">#{product[:link_rewrite]}</language>
             </link_rewrite>
             <name>
                 <language id=\"1\">#{product[:name]}</language>
             </name>
             <description>
                 <language id=\"1\">#{product[:desciption]}</language>
             </description>
             <description_short>
                 <language id=\"1\">#{product[:description_short]}</language>
             </description_short>
             <available_now>
                 <language id=\"1\">#{product[:available_now]}</language>
             </available_now>
             <available_later>
                  <language id=\"1\">#{product[:available_later]}</language>
             </available_later>
             <associations>
                 <categories nodeType=\"category\" api=\"categories\">
                   <category>
                     <id>#{product[:category_id]}</id>
                   </category>
                 </categories>
                 <images nodeType=\"image\" api=\"images\">
                   <image>
                     <id> #{product[:image_id]}</id>
                   </image>
                 </images>
                 <combinations nodeType=\"combination\" api=\"combinations\">
                   <combination>
                     <id>#{product[:combination_id]}</id>
                    </combination>
                 </combinations>
                 <product_option_values nodeType=\"product_option_value\" api=\"product_option_values\">
                   <product_option_value>
                     <id>#{product[:product_option_value_id]}</id>
                   </product_option_value>
                 </product_option_values>
                 <product_features nodeType=\"product_feature\" api=\"product_features\">
                   <product_feature>
                     <id>#{product[:product_features_id]}</id>
                     <id_feature_value>#{product[:product_feature_values_id]}</id_feature_value>
                   </product_feature>
                 </product_features>
                 <tags nodeType=\"tag\" api=\"tags\">
                   <tag>
                     <id>#{product[:tag_id]}</id>
                   </tag>
                 </tags>
                 <stock_availables nodeType=\"stock_available\" api=\"stock_availables\">
                   <stock_available>
                     <id>#{product[:stock_available_id]}</id>
                     <id_product_attribute>#{product[:stock_available_id_product_attribute]}</id_product_attribute>
                   </stock_available>
                 </stock_availables>
                 <attachments nodeType=\"attachment\" api=\"attachments\">
                   <attachment>
                     <id>#{product[:attachment_id]}</id>
                   </attachment>
                 </attachments>
                 <accessories nodeType=\"product\" api=\"products\">
                   <product>
                     <id>#{product[:product_accessories_id]}</id>
                   </product>
                 </accessories>
                 <product_bundle nodeType=\"product\" api=\"products\">
                   <product>
                     <id>#{product[:product_bundle_id]}</id>
                     <id_product_attribute>#{product[:product_attribute_id]}</id_product_attribute>
                     <quantity>#{product[:quantity]}</quantity>
                   </product>
                 </product_bundle>
             </associations>
         </product>
      </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
        })
        puts prod.body, prod.code
      end

      def self.delete_product(id)
          prod = HTTParty.delete("#{@api_url}products/#{id}",
            basic_auth: @auth
          )
          puts prod.body, prod.code
      end

      def self.get_product(id)
        prod = HTTParty.get("#{@api_url}products/#{id}", basic_auth: @auth )
        puts prod.body, prod.code
    end

    ################################################################################################################################################################

    def self.change_image_api()
      img = HTTParty.post("#{@api_url}images/",
      {
        body:
        "<prestashop>
          <image_types>
            <general xlink:href=\"http://localhost:8080/api/images/general\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
            <products xlink:href=\"http://localhost:8080/api/images/products\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
            <categories xlink:href=\"http://localhost:8080/api/images/categories\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
            <manufacturers xlink:href=\"http://localhost:8080/api/images/manufacturers\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
            <suppliers xlink:href=\"http://localhost:8080/api/images/suppliers\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
            <stores xlink:href=\"http://localhost:8080/api/images/stores\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
            <customizations xlink:href=\"http://localhost:8080/api/images/customizations\" get=\"true\" put=\"true\" post=\"true\" delete=\"true\" head=\"true\" upload_allowed_mimetypes=\"image/gif, image/jpg, image/jpeg, image/pjpeg, image/png, image/x-png\"/>
          </image_types>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts img.body,img.code
    end

     def self.post_product_image(product_id)
      img = HTTParty.post("#{@api_url}images/",
      {
      body: {:id_product => product_id,:image_format => 'jpg',:existing_path => "https://www.opengift.pl/plik/f2e4e066fad5cfe8cfd6a4ae622144ac121ad5c2/kaczka-pvc-zolty-full.jpg"},
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/html',
        "charset" => 'utf-8'
      }
      })
      puts img.body,img.code
     end

end







######################################################### TESTING METHODS ##############################################################################







#display address
#print Presta.getaddresses(1)

#add, edit, delete, get language
#Presta.post_language($language)
#Presta.update_language(2,$language)
#Presta.delete_language(2)
#Presta.get_language(1)


#add, edit, delete, get customer
#Presta.post_customer($customer1)
#Presta.update_customer(4,$customer1)
#Presta.delete_customer(4)
#Presta.get_customer(2)

#add, edit, delete, get cart
#Presta.post_carts($cart)
#Presta.update_carts(14,$cart)
#Presta.delete_carts(14)
#Presta.get_carts(14)

#TO CREATE ORDER FIRSTLY U HAVE TO CREATE NON ORDERED CART (JUST BY POSTING CART)
#add, edit, delete, get order
#Presta.post_order($order)
#Presta.update_order(11,$order)
#Presta.delete_order(11)
#Presta.get_order(11)

#add, edit, delete, get order_states
#Presta.post_order_states($order_states)
#Presta.update_order_states(21,$order_states)
#Presta.delete_order_states(21)
#Presta.get_order_states(21)

#add, edit, delete, get order_slip
#Presta.post_order_slip($order_slip)
#Presta.update_order_slip(1,$order_slip)
#Presta.get_order_slip(1)
#Presta.delete_order_slip(1)

#add, edit, delete, get order_payment
#Presta.post_order_payment($order_payment)
#Presta.update_order_payment(7,$order_payment)
#Presta.get_order_payment(7)
#Presta.delete_order_payment(7)

#add, edit, delete, get order_invoice
#Presta.post_order_invoice($order_invoice)
#Presta.update_order_invoice(3,$order_invoice)
#Presta.get_order_invoice(3)
#Presta.delete_order_invoice(3)

#add, edit, delete, get order_history
#Presta.post_order_histories($order_history)
#Presta.update_order_histories(18,$order_history)
#Presta.get_order_histories(18)
#Presta.delete_order_histories(18)

#add, edit, delete, get order_details
# Presta.post_order_details($order_detail)
# Presta.update_order_details(14,$order_detail)
# Presta.get_order_details(14)
# Presta.delete_order_details(14)

#add, edit, delete, get order_cart_rules
# Presta.post_order_cart_rules($order_cart_rule)
# Presta.update_order_cart_rules(1,$order_cart_rule)
# Presta.get_order_cart_rules(1)
# Presta.delete_order_cart_rules(1)

#add, edit, delete, get order_cart_carriers
# Presta.post_order_carriers($order_carrier)
# Presta.update_order_carriers(12,$order_carrier)
# Presta.get_order_carriers(12)
# Presta.delete_order_carriers(12)


#add, edit, delete, get product
#Presta.post_product($product)
# Presta.update_product(24,$product)
# Presta.get_product(24)
# Presta.delete_product(24)


#add, edit, delete, get tags
#Presta.post_tags($tag)
#Presta.get_tags(1)
#Presta.update_tags(1,$tag)
#Presta.delete_tags(1)


#add, edit, delete, get manufacturers
# Presta.post_manufacturers($manufacturers)
# Presta.update_manufacturers(3,$manufacturers)
# Presta.get_manufacturers(3)
# Presta.delete_manufacturers(3)


#DOESNT WORK POST METHOD IS NOT ALLOWED FOR STOCK_AVAILABLES
#add, edit, delete, get stock availables
#Presta.post_stock_availables($stock_availables)
#Presta.update_stock_availables($stock_availables)
#Presta.get_stock_availables($stock_availables)
#Presta.delete_stock_availables($stock_availables)

#NOT CHECKED 
#add, edit, delete, get attachments
#Presta.post_attachments($attachments)
#Presta.update_attachments($attachments)
#Presta.get_attachments($attachments)
#Presta.delete_attachments($attachments)

#add, edit, delete, get categories
#Presta.post_categories($categories)
#Presta.update_categories(10,$categories)   #ERROR 400
# Presta.get_categories(10)
# Presta.delete_categories(10)


#add, edit, delete, get combination
#Presta.post_combination($combination)
# Presta.update_combinations(43,$combination)
# Presta.get_combinations(43)
# Presta.delete_combinations(43)

#add, edit, delete, get product customization fields
# Presta.post_product_customization_field($product_customization_fields)
# Presta.update_product_customization_field(2,$product_customization_fields)
# Presta.get_product_customization_field(2)
# Presta.delete_product_customization_field(2)

#add, edit, delete, get product feature values
# Presta.post_product_feature_values($product_feature_values)
# Presta.update_product_feature_values(11,$product_feature_values)
# Presta.get_product_feature_values(11)
# Presta.delete_product_feature_values(11)

#add, edit, delete, get product features
#Presta.post_product_features($product_features)
# Presta.update_product_features(3,$product_features)
# Presta.get_product_features(3)
# Presta.delete_product_features(3)

#add, edit, delete, get product option values
# Presta.post_product_options_values($product_option_values)
# Presta.update_product_options_values(26,$product_option_values)
# Presta.get_product_options_values(26)
# Presta.delete_product_options_values(26)

#add, edit, delete, get product option
# Presta.post_product_options($product_option)
# Presta.update_product_options(5,$product_option)
# Presta.get_product_options(5)
# Presta.delete_product_options(5)

#add, edit, delete, get product supplier
# Presta.post_product_suppliers($product_supplier)
# Presta.update_product_suppliers(71,$product_supplier)
# Presta.get_product_suppliers(71)
Presta.delete_product_suppliers(71)

 







#Presta.change_image_api()

#Presta.post_product_image(22)