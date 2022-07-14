require 'open-uri'
require 'httparty'
require 'prestashop'
require 'pp'
require 'json'
require 'uri'
require_relative 'dane_presta.rb'
require_relative 'creating_hashes.rb'

class Presta
    
    include HTTParty
    include PrestaDane
    include Create

    @auth = {username: "V7UY5X46SB82BMDDZ4VFRY8HU5GI2VW9", password: ""}

    def initialize
        @api_url = "http://localhost:8080/api/"
        
    end
    def self.getaddresses(id)
        address = HTTParty.get("#{@api_url}addresses/#{id}", basic_auth: @auth )
        puts address.body,address.code
    end

    def self.post_attachments(attachments)
        attach = HTTParty.post("http://localhost:8080/api/attachments/",
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

    def self.get_customer(id)
        cust = HTTParty.get("#{@api_url}customers/#{id}",
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

    def self.delete_customer(id)
        cust = HTTParty.delete("#{@api_url}customers/#{id}",
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
        puts cust.code
    end

   def self.post_order_payment(order_payment)
        payment = HTTParty.post("#{@api_url}order_payments/",
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
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <cart>
          <id></id>
          <id_address_delivery>#{carts[:id_address_delivery]}</id_address_delivery>
          <id_address_invoice>#{carts[:id_address_invoice]}</id_address_invoice>
          <id_currency>#{carts[:id_currency]}</id_currency>
          <id_customer>#{carts[:id_customer]}</id_customer>
          <id_guest>#{carts[:id_guest]}</id_guest>
          <id_lang>#{carts[:id_lang]}</id_lang>
          <id_shop_group>#{carts[:id_shop_group]}</id_shop_group>
          <id_shop>#{carts[:id_shop]}</id_shop>
          <id_carrier>#{carts[:id_carrier]}</id_carrier>
          <recyclable>#{carts[:recyclable]}</recyclable>
          <gift>#{carts[:gif]}</gift>
          <gift_message>#{carts[:gift_message]}</gift_message>
          <mobile_theme>#{carts[:mobile_theme]}</mobile_theme>
          <delivery_option>#{carts[:delivery_option]}</delivery_option>
          <secure_key>#{carts[:secure_key]}</secure_key>
          <allow_seperated_package>#{carts[:allow_seperated_package]}</allow_seperated_package>
          <date_add>#{carts[:date_add]}</date_add>
          <date_upd>#{carts[:date_upd]}</date_upd>
          <associations>
            <cart_rows>
              <cart_row>
                <id_product>#{carts[:id_product]}</id_product>
                <id_product_attribute>#{carts[:id_product_attribute]}</id_product_attribute>
                <id_address_delivery>#{carts[:id_address_delivery]}</id_address_delivery>
                <id_customization>#{carts[:id_customization]}</id_customization>
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
            basic_auth: @auth,
            header: {
                'Content-Type' => 'application/x-www-form-urlencoded',
                "charset"=>'utf-8'
            }
        })
        puts carts.body,carts.code

    end

    def self.post_categories(categories)
        comb = HTTParty.post("http://localhost:8080/api/categories/",
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
      puts comb.body,comb.code
    end

    def self.post_combination(combinations)
        comb = HTTParty.post("http://localhost:8080/api/combinations/",
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

    def self.post_manufacturers(manufacturers)
        attach = HTTParty.post("http://localhost:8080/api/manufacturers/",
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


    def self.post_tags(tag)
        tag = HTTParty.post("http://localhost:8080/api/tags/",
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

    def self.post_product_customization_field(product_customization_field)
        prod_cust_field = HTTParty.post("http://localhost:8080/api/product_customization_fields/",
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

    def self.post_product_feature_values(product_feature_values)
        prod_feat_val = HTTParty.post("http://localhost:8080/api/product_feature_values/",
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

    def self.post_product_features(product_features)
        prod_feat = HTTParty.post("http://localhost:8080/api/product_features/",
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

    def self.post_product_options_values(product_option_value)
        prod_opt_val = HTTParty.post("http://localhost:8080/api/product_option_values",
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

    def self.post_product_suppliers(product_suppliers)
        prod_sup = HTTParty.post("http://localhost:8080/api/product_suppliers/",
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

    def self.post_product_options(product_options)
        prod_opt = HTTParty.post("http://localhost:8080/api/product_options/",
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


    def self.post_order(order,product)
        ord  = HTTParty.post("http://localhost:8080/api/orders/",
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
                        <product_id href=\"http://localhost:8080/api/products/\">#{product[:product_id]}</product_id>
                        <product_attribute_id>#{product[:product_attribute_id]}</product_attribute_id>
                        <product_quantity>#{product[:product_quantity]}</product_quantity>
                        <product_name>#{product[:product_name]}</product_name>
                        <product_reference>#{product[:product_reference]}</product_reference>
                        <product_ean13>#{product[:product_ean13]}</product_ean13>
                        <product_isbn>#{product[:product_isbn]}</product_isbn>
                        <product_upc>#{product[:product_upc]}</product_upc>
                        <product_price>#{product[:product_price]}</product_price>
                        <id_customization href=\"http://localhost:8080/api/customizations/\">#{product[:id_customization]}</id_customization>
                        <unit_price_tax_incl>#{product[:unit_price_tax_incl]}</unit_price_tax_incl>
                        <unit_price_tax_excl>#{product[:unit_price_tax_excl]}</unit_price_tax_excl>
                    </#{:order_row}>
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
            puts ord.body, ord.code,ord.response
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

   
    
   
    def self.get_product(id)
        aaa =  HTTParty.get("http://localhost:8080/api/products/#{id}", basic_auth: @auth )
        #puts aaa.body
    end

    def self.post_product(product)
        prod = HTTParty.post("http://localhost:8080/api/products/",
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

                        </categories>
                        <images nodeType=\"image\" api=\"images\">

                        </images>
                        <combinations nodeType=\"combination\" api=\"combinations\">

                        </combinations>
                        <product_option_values nodeType=\"product_option_value\" api=\"product_option_values\">

                        </product_option_values>
                        <product_features nodeType=\"product_feature\" api=\"product_features\">

                        </product_features>
                        <tags nodeType=\"tag\" api=\"tags\">

                        </tags>
                        <stock_availables nodeType=\"stock_available\" api=\"stock_availables\">

                        </stock_availables>
                        <attachments nodeType=\"attachment\" api=\"attachments\">

                        </attachments>
                        <accessories nodeType=\"product\" api=\"products\">

                        </accessories>
                        <product_bundle nodeType=\"product\" api=\"products\">

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
        puts prod.body, prod.code,prod.response
      end
   

end







######################################################### TESTING METHODS ##############################################################################







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





#puts Presta.get_product(1)

Presta.post_product($product)


#Presta.post_stock_availables($stock_availables)

#Presta.post_manufacturers($manufacturers)

#Presta.post_attachments($attachments)

#Presta.post_categories($categories)

#Presta.post_tags($tag)

#Presta.post_combination($combination)

#Presta.post_product_customization_field($product_customization_fields)

#Presta.post_product_feature_values($product_feature_values)

#Presta.post_product_features($product_features)

#Presta.post_product_options_values($product_option_values)

#Presta.post_product_options($product_option)

#Presta.post_product_suppliers($product_supplier)




 





