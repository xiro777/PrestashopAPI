######################################################################################################################################################################
#  
#   PRESTASHOP API 
#  
#   DEVELOPED BY: KACPER MORAWSKI
#
#   GITHUB: https://github.com/xiro777
#
#   LAST UPDATE: 20.07.2022
#
#   DESCRIPTION: File contains class with request sent to Prestashop API 
#
#   Version: v.0.2
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

    @api_key = 'F4J6WC94WBJVGSAIH62D2DG8QIVTC93C'
    @auth = {username: "F4J6WC94WBJVGSAIH62D2DG8QIVTC93C", password: ""}
    @api_url = "http://localhost:8080/api/" 




    ##### ADDRESSES  ####################################################################################################################################################
    #def self.post_address(address)
    def self.post_address(
      id_customer:,
      id_manufacturer:0,
      id_supplier:0,
      id_warehouse:0,
      id_country:,
      id_state:0,
      aliass:,
      company:'', 
      lastname:,
      firstname:,
      vat_number:0,
      address1:,
      address2:'',
      postcode:'',
      city:,
      other:'',
      phone:'',
      phone_mobile:'',
      dni:'',
      deleted:'',
      date_add:'',
      date_upd:''          
      )
      add = HTTParty.post("#{@api_url}addresses/",
      {
          body:
          "<prestashop>
            <address>
              <id></id>
              <id_customer>#{id_customer}</id_customer>
              <id_manufacturer>#{id_manufacturer}</id_manufacturer>
              <id_supplier>#{id_supplier}</id_supplier>
              <id_warehouse>#{id_warehouse}</id_warehouse>
              <id_country>#{id_country}</id_country>
              <id_state>#{id_state}</id_state>
              <alias>#{aliass}</alias>
              <company>#{company}</company>
              <lastname>#{lastname}</lastname>
              <firstname>#{firstname}</firstname>
              <vat_number>#{vat_number}</vat_number>
              <address1>#{address1}</address1>
              <address2>#{address2}</address2>
              <postcode>#{postcode}</postcode>
              <city>#{city}</city>
              <other>#{other}</other>
              <phone>#{phone}</phone>
              <phone_mobile>#{phone_mobile}</phone_mobile>
              <dni>#{dni}</dni>
              <deleted>#{deleted}</deleted>
              <date_add>#{date_add}</date_add>
              <date_upd>#{date_upd}</date_upd>
            </address>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts add.body, add.code
    end

    def self.update_address(
      id:,
      id_customer:,
      id_manufacturer:0,
      id_supplier:0,
      id_warehouse:0,
      id_country:,
      id_state:0,
      aliass:,
      company:'', 
      lastname:,
      firstname:,
      vat_number:0,
      address1:,
      address2:'',
      postcode:'',
      city:,
      other:'',
      phone:'',
      phone_mobile:'',
      dni:'',
      deleted:'',
      date_add:'',
      date_upd:''  )
      add = HTTParty.put("#{@api_url}addresses/#{id}",
      {
          body:
          "<prestashop>
          <address>
            <id>#{id}</id>
            <id_customer>#{id_customer}</id_customer>
            <id_manufacturer>#{id_manufacturer}</id_manufacturer>
            <id_supplier>#{id_supplier}</id_supplier>
            <id_warehouse>#{id_warehouse}</id_warehouse>
            <id_country>#{id_country}</id_country>
            <id_state>#{id_state}</id_state>
            <alias>#{aliass}</alias>
            <company>#{company}</company>
            <lastname>#{lastname}</lastname>
            <firstname>#{firstname}</firstname>
            <vat_number>#{vat_number}</vat_number>
            <address1>#{address1}</address1>
            <address2>#{address2}</address2>
            <postcode>#{postcode}</postcode>
            <city>#{city}</city>
            <other>#{other}</other>
            <phone>#{phone}</phone>
            <phone_mobile>#{phone_mobile}</phone_mobile>
            <dni>#{dni}</dni>
            <deleted>#{deleted}</deleted>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
          </address>
        </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts add.body, add.code
    end

    def self.getaddresses(id)
        address = HTTParty.get("#{@api_url}addresses/#{id}", basic_auth: @auth )
        puts address.body,address.code
    end

    def self.delete_address(id)
      add = HTTParty.delete("#{@api_url}addresses/#{id}",
      {
          basic_auth: @auth
      })
      puts add.body, add.code
    end


    ##### ATACHMENTS ###############################################################################################################################################

    def self.post_attachments(
      file:,
      file_name:"",
      file_size:0,
      mine:,
      name:,
      description:"",
      product_id:
    )
        attach = HTTParty.post("#{@api_url}attachments/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <attachment>
              <id></id>
              <file>#{file}</file>
              <file_name>#{file_name}</file_name>
              <file_size>#{file_size}</file_size>
              <mime>#{mime}</mime>
              <name>
                <language id=\"1\">#{name}</language>
              </name>
              <description>
                <language id=\"1\">#{desciption}</language>
              </description>
              <associations>
                <products>
                  <product>
                    <id>#{product_id}</id>
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

    def self.update_attachments(
      id:,
      file:,
      file_name:"",
      file_size:0,
      mine:,
      name:,
      description:"",
      product_id:
    )
      attach = HTTParty.put("#{@api_url}attachments/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <attachment>
            <id>#{id}</id>
            <file>#{file}</file>
            <file_name>#{file_name}</file_name>
            <file_size>#{file_size}</file_size>
            <mime>#{mime}</mime>
            <name>
              <language id=\"1\">#{name}</language>
              <language id=\"2\">#{name1}</language>
            </name>
            <description>
              <language id=\"1\">#{desciption}</language>
              <language id=\"2\">#{desciption1}</language>
            </description>
            <associations>
              <products>
                <product>
                  <id>#{product_id}</id>
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

    ##### CARRIERS ####################################################################################################################################################

    def self.post_carriers(carrier)
      carr = HTTParty.post("#{@api_url}carriers/",
      {
          body:
          "<prestashop>
            <carrier>
              <id></id>
              <deleted>#{carrier[:deleted]}</deleted>
              <is_module>#{carrier[:is_module]}</is_module>
              <id_tax_rules_group>#{carrier[:id_tax_rules_group]}</id_tax_rules_group>
              <id_reference>#{carrier[:id_reference]}</id_reference>
              <name>#{carrier[:name]}</name>
              <active>#{carrier[:active]}</active>
              <is_free>#{carrier[:is_free]}</is_free>
              <url>#{carrier[:url]}</url>
              <shipping_handling>#{carrier[:shipping_handling]}</shipping_handling>
              <shipping_external>#{carrier[:shipping_external]}</shipping_external>
              <range_behavior>#{carrier[:range_behavior]}</range_behavior>
              <shipping_method>#{carrier[:shipping_method]}</shipping_method>
              <max_width>#{carrier[:max_width]}</max_width>
              <max_height>#{carrier[:max_height]}</max_height>
              <max_depth>#{carrier[:max_depth]}</max_depth>
              <max_weight>#{carrier[:max_weight]}</max_weight>
              <grade>#{carrier[:grade]}</grade>
              <external_module_name>#{carrier[:external_module_name]}</external_module_name>
              <need_range>#{carrier[:need_range]}</need_range>
              <position>#{carrier[:position]}</position>
              <delay>
               <language id=\"1\">#{carrier[:delay]}</language>
              </delay>
            </carrier>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }     
      })
      puts carr.body,carr.code
    end

    def self.update_carriers(id,carrier)
      carr = HTTParty.put("#{@api_url}carriers/#{id}",
      {
          body:
          "<prestashop>
            <carrier>
              <id>#{id}</id>
              <deleted>#{carrier[:deleted]}</deleted>
              <is_module>#{carrier[:is_module]}</is_module>
              <id_tax_rules_group>#{carrier[:id_tax_rules_group]}</id_tax_rules_group>
              <id_reference>#{carrier[:id_reference]}</id_reference>
              <name>#{carrier[:name]}</name>
              <active>#{carrier[:active]}</active>
              <is_free>#{carrier[:is_free]}</is_free>
              <url>#{carrier[:url]}</url>
              <shipping_handling>#{carrier[:shipping_handling]}</shipping_handling>
              <shipping_external>#{carrier[:shipping_external]}</shipping_external>
              <range_behavior>#{carrier[:range_behavior]}</range_behavior>
              <shipping_method>#{carrier[:shipping_method]}</shipping_method>
              <max_width>#{carrier[:max_width]}</max_width>
              <max_height>#{carrier[:max_height]}</max_height>
              <max_depth>#{carrier[:max_depth]}</max_depth>
              <max_weight>#{carrier[:max_weight]}</max_weight>
              <grade>#{carrier[:grade]}</grade>
              <external_module_name>#{carrier[:external_module_name]}</external_module_name>
              <need_range>#{carrier[:need_range]}</need_range>
              <position>#{carrier[:position]}</position>
              <delay>
               <language id=\"1\">#{carrier[:delay]}</language>
              </delay>
            </carrier>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }     
      })
      puts carr.body,carr.code
    end

    def self.get_carriers(id)
      carr = HTTParty.get("#{@api_url}carriers/#{id}",
      {
          basic_auth: @auth
      })
      puts carr.body,carr.code
    end

    def self.delete_carriers(id)
      carr = HTTParty.delete("#{@api_url}carriers/#{id}",
      {
          basic_auth: @auth 
      })
      puts carr.body,carr.code
    end

    ##### CART RULES ###################################################################################################################################################

    def self.post_cart_rules(cart_rule)
      cart = HTTParty.post("#{@api_url}cart_rules/",
      {
          body:
          "<prestashop>
            <cart_rule>
              <id></id>
              <id_customer>#{cart_rule[:id_customer]}</id_customer>
              <date_from>#{cart_rule[:date_from]}</date_from>
              <date_to>#{cart_rule[:date_to]}</date_to>
              <description>#{cart_rule[:description]}</description>
              <quantity>#{cart_rule[:quantity]}</quantity>
              <quantity_per_user>#{cart_rule[:quantity_per_user]}</quantity_per_user>
              <priority>#{cart_rule[:priority]}</priority>
              <partial_use>#{cart_rule[:partial_use]}</partial_use>
              <code>#{cart_rule[:code]}</code>
              <minimum_amount>#{cart_rule[:minimum_amount]}</minimum_amount>
              <minimum_amount_tax>#{cart_rule[:minimum_amount_tax]}</minimum_amount_tax>
              <minimum_amount_currency>#{cart_rule[:minimum_amount_currency]}</minimum_amount_currency>
              <minimum_amount_shipping>#{cart_rule[:minimum_amount_shipping]}</minimum_amount_shipping>
              <country_restriction>#{cart_rule[:country_restriction]}</country_restriction>
              <carrier_restriction>#{cart_rule[:carrier_restriction]}</carrier_restriction>
              <group_restriction>#{cart_rule[:group_restriction]}</group_restriction>
              <cart_rule_restriction>#{cart_rule[:cart_rule_restriction]}</cart_rule_restriction>
              <product_restriction>#{cart_rule[:product_restriction]}</product_restriction>
              <shop_restriction>#{cart_rule[:shop_restriction]}</shop_restriction>
              <free_shipping>#{cart_rule[:free_shipping]}</free_shipping>
              <reduction_percent>#{cart_rule[:reduction_percent]}</reduction_percent>
              <reduction_amount>#{cart_rule[:reduction_amount]}</reduction_amount>
              <reduction_tax>#{cart_rule[:reduction_tax]}</reduction_tax>
              <reduction_currency>#{cart_rule[:reduction_currency]}</reduction_currency>
              <reduction_product>#{cart_rule[:reduction_product]}</reduction_product>
              <reduction_exclude_special>#{cart_rule[:reduction_exclude_special]}</reduction_exclude_special>
              <gift_product>#{cart_rule[:gift_product]}</gift_product>
              <gift_product_attribute>#{cart_rule[:gift_product_attribute]}</gift_product_attribute>
              <highlight>#{cart_rule[:highlight]}</highlight>
              <active>#{cart_rule[:active]}</active>
              <date_add>#{cart_rule[:date_add]}</date_add>
              <date_upd>#{cart_rule[:date_upd]}</date_upd>
              <name>
                <language id=\"1\">#{cart_rule[:name]}</language>
              </name>
            </cart_rule>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }     
      })
      puts cart.body,cart.code
    end

    def self.update_cart_rules(id,cart_rule)
      cart = HTTParty.put("#{@api_url}cart_rules/#{id}",
      {
          body:
          "<prestashop>
            <cart_rule>
              <id>#{id}</id>
              <id_customer>#{cart_rule[:id_customer]}</id_customer>
              <date_from>#{cart_rule[:date_from]}</date_from>
              <date_to>#{cart_rule[:date_to]}</date_to>
              <description>#{cart_rule[:description]}</description>
              <quantity>#{cart_rule[:quantity]}</quantity>
              <quantity_per_user>#{cart_rule[:quantity_per_user]}</quantity_per_user>
              <priority>#{cart_rule[:priority]}</priority>
              <partial_use>#{cart_rule[:partial_use]}</partial_use>
              <code>#{cart_rule[:code]}</code>
              <minimum_amount>#{cart_rule[:minimum_amount]}</minimum_amount>
              <minimum_amount_tax>#{cart_rule[:minimum_amount_tax]}</minimum_amount_tax>
              <minimum_amount_currency>#{cart_rule[:minimum_amount_currency]}</minimum_amount_currency>
              <minimum_amount_shipping>#{cart_rule[:minimum_amount_shipping]}</minimum_amount_shipping>
              <country_restriction>#{cart_rule[:country_restriction]}</country_restriction>
              <carrier_restriction>#{cart_rule[:carrier_restriction]}</carrier_restriction>
              <group_restriction>#{cart_rule[:group_restriction]}</group_restriction>
              <cart_rule_restriction>#{cart_rule[:cart_rule_restriction]}</cart_rule_restriction>
              <product_restriction>#{cart_rule[:product_restriction]}</product_restriction>
              <shop_restriction>#{cart_rule[:shop_restriction]}</shop_restriction>
              <free_shipping>#{cart_rule[:free_shipping]}</free_shipping>
              <reduction_percent>#{cart_rule[:reduction_percent]}</reduction_percent>
              <reduction_amount>#{cart_rule[:reduction_amount]}</reduction_amount>
              <reduction_tax>#{cart_rule[:reduction_tax]}</reduction_tax>
              <reduction_currency>#{cart_rule[:reduction_currency]}</reduction_currency>
              <reduction_product>#{cart_rule[:reduction_product]}</reduction_product>
              <reduction_exclude_special>#{cart_rule[:reduction_exclude_special]}</reduction_exclude_special>
              <gift_product>#{cart_rule[:gift_product]}</gift_product>
              <gift_product_attribute>#{cart_rule[:gift_product_attribute]}</gift_product_attribute>
              <highlight>#{cart_rule[:highlight]}</highlight>
              <active>#{cart_rule[:active]}</active>
              <date_add>#{cart_rule[:date_add]}</date_add>
              <date_upd>#{cart_rule[:date_upd]}</date_upd>
              <name>
                <language id=\"1\">#{cart_rule[:name]}</language>
              </name>
            </cart_rule>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }     
      })
      puts cart.body,cart.code
    end

    def self.get_cart_rules(id)
      cart = HTTParty.get("#{@api_url}cart_rules/#{id}",
      {
          basic_auth: @auth  
      })
      puts cart.body,cart.code
    end

    def self.delete_cart_rules(id)
      cart = HTTParty.delete("#{@api_url}cart_rules/#{id}",
      {
          basic_auth: @auth  
      })
      puts cart.body,cart.code
    end

    ##### CARTS ##########################################################################################################################################################

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
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
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
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
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

  ##### CONFIGURATIONS #############################################################################################################################################
   
  def self.post_configuration(configuration)
    conf = HTTParty.post("#{@api_url}configurations/",
        {
            body: 
            "<prestashop>
              <configuration>
                <id></id>
                <value>#{configuration[:value]}</value>
                <name>#{configuration[:name]}</name>
                <id_shop_group>#{configuration[:id_shop_group]}</id_shop_group>
                <id_shop>#{configuration[:id_shop]}</id_shop>
                <date_add>#{configuration[:date_add]}</date_add>
                <date_upd>#{configuration[:date_upd]}</date_upd>
              </configuration>
            </prestashop>",
            basic_auth: @auth,
            header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
            }
        }
    )
    puts conf.body, conf.code 
  end

  def self.update_configuration(id,configuration)
    conf = HTTParty.put("#{@api_url}configurations/#{id}",
        {
            body: 
            "<prestashop>
              <configuration>
                <id>#{id}</id>
                <value>#{configuration[:value]}</value>
                <name>#{configuration[:name]}</name>
                <id_shop_group>#{configuration[:id_shop_group]}</id_shop_group>
                <id_shop>#{configuration[:id_shop]}</id_shop>
                <date_add>#{configuration[:date_add]}</date_add>
                <date_upd>#{configuration[:date_upd]}</date_upd>
              </configuration>
            </prestashop>",
            basic_auth: @auth,
            header: {
              "Content-Type" => 'text/xml',
              "charset" => 'utf-8'
            }
        }
    )
    puts conf.body, conf.code 
  end

  def self.get_configuration(id)
    conf = HTTParty.get("#{@api_url}configurations/#{id}",
        {
            basic_auth: @auth,
        }
    )
    puts conf.body, conf.code 
  end

  def self.delete_configuration(id)
    conf = HTTParty.delete("#{@api_url}configurations/#{id}",
        {
            basic_auth: @auth,
        }
    )
    puts conf.body, conf.code 
  end


  ##### CONTACTS ###################################################################################################################################################

    def self.post_contact(contact)
      con = HTTParty.post("#{@api_url}contacts/",
      {
          body:
          "<prestashop>
            <contact>
              <id></id>
              <email>#{contact[:email]}</email>
              <customer_service>#{contact[:customer_service]}</customer_service>
              <name>
              <language id=\"1\">#{contact[:name]}</language>
              </name>
              <description>
              <language id=\"1\">#{contact[:description]}</language>
              </description>
            </contact>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts con.body, con.code
    end

    def self.update_contact(id,contact)
      con = HTTParty.put("#{@api_url}contacts/#{id}",
      {
          body:
          "<prestashop>
            <contact>
              <id>#{id}</id>
              <email>#{contact[:email]}</email>
              <customer_service>#{contact[:customer_service]}</customer_service>
              <name>
              <language id=\"1\">#{contact[:name]}</language>
              </name>
              <description>
              <language id=\"1\">#{contact[:description]}</language>
              </description>
            </contact>
          </prestashop>",
          basic_auth: @auth,
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
      })
      puts con.body, con.code
    end

    def self.get_contact(id)
      con = HTTParty.get("#{@api_url}contacts/#{id}",
      {
          basic_auth: @auth
      })
      puts con.body, con.code
    end

    def self.delete_contact(id)
      con = HTTParty.delete("#{@api_url}contacts/#{id}",
      {
          basic_auth: @auth
      })
      puts con.body, con.code
    end

    ##### CONTENT MANAGEMENT SYSTEM ######################################################################################################################################################

    def self.post_content_management_system(content_management_system)
      sup = HTTParty.post("#{@api_url}content_management_system/",
      {
        body:
        "<prestashop>
          <content>
            <id></id>
            <id_cms_category>#{content_management_system[:id_cms_category]}</id_cms_category>
            <position>#{content_management_system[:position]}</position>
            <indexation>#{content_management_system[:indexation]}</indexation>
            <active>#{content_management_system[:active]}</active>
            <meta_description>
              <language id=\"1\">#{content_management_system[:meta_description]}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{content_management_system[:meta_keywords]}</language>
            </meta_keywords>
            <meta_title>
              <language id=\"1\">#{content_management_system[:meta_title]}</language>
            </meta_title>
            <head_seo_title>
              <language id=\"1\">#{content_management_system[:head_seo_title]}</language>
            </head_seo_title>
            <link_rewrite>
              <language id=\"1\">#{content_management_system[:link_rewrite]}</language>
            </link_rewrite>
            <content>
              <language id=\"1\">#{content_management_system[:content]}</language>
            </content>
          </content>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.update_content_management_system(id,content_management_system)
      sup = HTTParty.put("#{@api_url}content_management_system/#{id}",
      {
        body:
        "<prestashop>
          <content>
            <id>#{id}</id>
            <id_cms_category>#{content_management_system[:id_cms_category]}</id_cms_category>
            <position>#{content_management_system[:position]}</position>
            <indexation>#{content_management_system[:indexation]}</indexation>
            <active>#{content_management_system[:active]}</active>
            <meta_description>
              <language id=\"1\">#{content_management_system[:meta_description]}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{content_management_system[:meta_keywords]}</language>
            </meta_keywords>
            <meta_title>
              <language id=\"1\">#{content_management_system[:meta_title]}</language>
            </meta_title>
            <head_seo_title>
              <language id=\"1\">#{content_management_system[:head_seo_title]}</language>
            </head_seo_title>
            <link_rewrite>
              <language id=\"1\">#{content_management_system[:link_rewrite]}</language>
            </link_rewrite>
            <content>
              <language id=\"1\">#{content_management_system[:content]}</language>
            </content>
          </content>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.get_content_management_system(id)
      sup = HTTParty.get("#{@api_url}content_management_system/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_content_management_system(id)
      sup = HTTParty.delete("#{@api_url}content_management_system/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

     ##### COUNTRIES ######################################################################################################################################################################

     def self.post_country(country)
      sup = HTTParty.post("#{@api_url}countries/",
      {
        body:
        "<prestashop>
          <country>
          <id></id>
          <id_zone>#{country[:id_zone]}</id_zone>
          <id_currency>#{country[:id_currency]}</id_currency>
          <call_prefix>#{country[:call_prefix]}</call_prefix>
          <iso_code>#{country[:iso_code]}</iso_code>
          <active>#{country[:active]}</active>
          <contains_states>#{country[:contains_states]}</contains_states>
          <need_identification_number>#{country[:need_identification_number]}</need_identification_number>
          <need_zip_code>#{country[:need_zip_code]}</need_zip_code>
          <zip_code_format>#{country[:zip_code_format]}</zip_code_format>
          <display_tax_label>#{country[:display_tax_label]}</display_tax_label>
          <name>
          <language id=\"1\">#{country[:name]}</language>
          </name>
          </country>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.update_country(id,country)
      sup = HTTParty.put("#{@api_url}countries/#{id}",
      {
        body:
        "<prestashop>
          <country>
          <id>#{id}</id>
          <id_zone>#{country[:id_zone]}</id_zone>
          <id_currency>#{country[:id_currency]}</id_currency>
          <call_prefix>#{country[:call_prefix]}</call_prefix>
          <iso_code>#{country[:iso_code]}</iso_code>
          <active>#{country[:active]}</active>
          <contains_states>#{country[:contains_states]}</contains_states>
          <need_identification_number>#{country[:need_identification_number]}</need_identification_number>
          <need_zip_code>#{country[:need_zip_code]}</need_zip_code>
          <zip_code_format>#{country[:zip_code_format]}</zip_code_format>
          <display_tax_label>#{country[:display_tax_label]}</display_tax_label>
          <name>
          <language id=\"1\">#{country[:name]}</language>
          </name>
          </country>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.get_country(id)
      sup = HTTParty.get("#{@api_url}countries/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_country(id)
      sup = HTTParty.delete("#{@api_url}countries/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    ##### CURRENCIES ######################################################################################################################################################################

    def self.post_currency(currency)
      sup = HTTParty.post("#{@api_url}currencies/",
      {
        body:
        "<prestashop>
          <currency>
            <id></id>
            <names>
              <language id=\"1\">#{currency[:names]}</language>
            </names>
            <name></name>
            <symbol>
              <language id=\"1\">#{currency[:symbol]}</language>
            </symbol>
            <iso_code>#{currency[:iso_code]}</iso_code>
            <numeric_iso_code>#{currency[:numeric_iso_code]}</numeric_iso_code>
            <precision>#{currency[:precision]}</precision>
            <conversion_rate>#{currency[:conversion_rate]}</conversion_rate>
            <deleted>#{currency[:deleted]}</deleted>
            <active>#{currency[:active]}</active>
            <unofficial>#{currency[:unofficial]}</unofficial>
            <modified>#{currency[:modified]}</modified>
            <pattern>
              <language id=\"1\">#{currency[:pattern]}</language>
            </pattern>
          </currency>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.update_currency(id,currency)
      sup = HTTParty.put("#{@api_url}currencies/#{id}",
      {
        body:
        "<prestashop>
          <currency>
            <id>#{id}</id>
            <names>
              <language id=\"1\">#{currency[:names]}</language>
            </names>
            <name></name>
            <symbol>
              <language id=\"1\">#{currency[:symbol]}</language>
            </symbol>
            <iso_code>#{currency[:iso_code]}</iso_code>
            <numeric_iso_code>#{currency[:numeric_iso_code]}</numeric_iso_code>
            <precision>#{currency[:precision]}</precision>
            <conversion_rate>#{currency[:conversion_rate]}</conversion_rate>
            <deleted>#{currency[:deleted]}</deleted>
            <active>#{currency[:active]}</active>
            <unofficial>#{currency[:unofficial]}</unofficial>
            <modified>#{currency[:modified]}</modified>
            <pattern>
              <language id=\"1\">#{currency[:pattern]}</language>
            </pattern>
          </currency>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.get_currency(id)
      sup = HTTParty.get("#{@api_url}currencies/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_currency(id)
      sup = HTTParty.delete("#{@api_url}currencies/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end


    ##### CUSTOMER MESSAGE ################################################################################################################################################################

    def self.post_customer_message(customer_message)
      sup = HTTParty.post("#{@api_url}customer_messsages/",
      {
        body:
        "<prestashop>
          <customer_message>
            <id></id>
            <id_employee>#{customer_message[:id_employee]}</id_employee>
            <id_customer_thread>#{customer_message[:id_customer_thread]}</id_customer_thread>
            <ip_address>#{customer_message[:ip_address]}</ip_address>
            <message>#{customer_message[:message]}</message>
            <file_name>#{customer_message[:file_name]}</file_name>
            <user_agent>#{customer_message[:user_agent]}</user_agent>
            <private>#{customer_message[:private]}</private>
            <date_add>#{customer_message[:date_add]}</date_add>
            <date_upd>#{customer_message[:date_upd]}</date_upd>
            <read>#{customer_message[:read]}</read>
          </customer_message>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.update_customer_message(id,customer_message)
      sup = HTTParty.put("#{@api_url}customer_messsages/#{id}",
      {
        body:
        "<prestashop>
          <customer_message>
            <id>#{id}</id>
            <id_employee>#{customer_message[:id_employee]}</id_employee>
            <id_customer_thread>#{customer_message[:id_customer_thread]}</id_customer_thread>
            <ip_address>#{customer_message[:ip_address]}</ip_address>
            <message>#{customer_message[:message]}</message>
            <file_name>#{customer_message[:file_name]}</file_name>
            <user_agent>#{customer_message[:user_agent]}</user_agent>
            <private>#{customer_message[:private]}</private>
            <date_add>#{customer_message[:date_add]}</date_add>
            <date_upd>#{customer_message[:date_upd]}</date_upd>
            <read>#{customer_message[:read]}</read>
          </customer_message>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.get_customer_message(id)
      sup = HTTParty.get("#{@api_url}customer_messsages/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_customer_message(id)
      sup = HTTParty.delete("#{@api_url}customer_messsages/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

##### CUSTOMER THREADS ################################################################################################################################################################

    def self.post_customer_thread(customer_thread)
      sup = HTTParty.post("#{@api_url}customer_threads/",
      {
        body:
        "<prestashop>
          <customer_thread>
            <id></id>
            <id_lang>#{customer_thread[:id_lang]}</id_lang>
            <id_shop>#{customer_thread[:id_shop]}</id_shop>
            <id_customer><#{customer_thread[:id_customer]}/id_customer>
            <id_order>#{customer_thread[:id_order]}</id_order>
            <id_product>#{customer_thread[:id_product]}</id_product>
            <id_contact>#{customer_thread[:id_contact]}</id_contact>
            <email>#{customer_thread[:email]}</email>
            <token>#{customer_thread[:token]}</token>
            <status>#{customer_thread[:status]}</status>
            <date_add>#{customer_thread[:date_add]}</date_add>
            <date_upd>#{customer_thread[:date_upd]}</date_upd>
            <associations>
              <customer_messages>
                <customer_message>
                  <id>#{customer_thread[:customer_message_id]}</id>
                </customer_message>
              </customer_messages>
            </associations>
          </customer_thread>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.update_customer_thread(id,customer_thread)
      sup = HTTParty.put("#{@api_url}customer_threads/#{id}",
      {
        body:
        "<prestashop>
          <customer_thread>
            <id>#{id}</id>
            <id_lang>#{customer_thread[:id_lang]}</id_lang>
            <id_shop>#{customer_thread[:id_shop]}</id_shop>
            <id_customer><#{customer_thread[:id_customer]}/id_customer>
            <id_order>#{customer_thread[:id_order]}</id_order>
            <id_product>#{customer_thread[:id_product]}</id_product>
            <id_contact>#{customer_thread[:id_contact]}</id_contact>
            <email>#{customer_thread[:email]}</email>
            <token>#{customer_thread[:token]}</token>
            <status>#{customer_thread[:status]}</status>
            <date_add>#{customer_thread[:date_add]}</date_add>
            <date_upd>#{customer_thread[:date_upd]}</date_upd>
            <associations>
              <customer_messages>
                <customer_message>
                  <id>#{customer_thread[:customer_message_id]}</id>
                </customer_message>
              </customer_messages>
            </associations>
          </customer_thread>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.get_customer_thread(id)
      sup = HTTParty.get("#{@api_url}customer_threads/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
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
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
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
          header: {
            "Content-Type" => 'text/xml',
            "charset" => 'utf-8'
          }
          
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


  ##### CUSTOMIZATIONS ##################################################################################################################################################################

  def self.post_customization(customization)
    sup = HTTParty.post("#{@api_url}customizations/",
    {
      body:
      "<prestashop>
        <customization>
        <id></id>
        <id_address_delivery>#{customization[:id_address_delivery]}</id_address_delivery>
        <id_cart>#{customization[:id_cart]}</id_cart>
        <id_product>#{customization[:id_product]}</id_product>
        <id_product_attribute>#{customization[:id_product_attribute]}</id_product_attribute>
        <quantity>#{customization[:quantity]}</quantity>
        <quantity_refunded>#{customization[:quantity_refunded]}</quantity_refunded>
        <quantity_returned><#{customization[:quantity_returned]}/quantity_returned>
        <in_cart>#{customization[:in_cart]}</in_cart>
          <associations>
            <customized_data_text_fields>
              <customized_data_text_field>
                <id_customization_field>#{customization[:customized_data_text_field_id_customization_field]}</id_customization_field>
                <value>#{customization[:customized_data_text_field_value]}</value>
              </customized_data_text_field>
            </customized_data_text_fields>
            <customized_data_images>
              <customized_data_image>
                <id_customization_field>#{customization[:customized_data_image_id_customization_field]}</id_customization_field>
                <value>#{customization[:customized_data_image_value]}</value>
              </customized_data_image>
            </customized_data_images>
          </associations>
        </customization>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_customization(id,customization)
    sup = HTTParty.put("#{@api_url}customizations/#{id}",
    {
      body:
      "<prestashop>
        <customization>
        <id>#{id}</id>
        <id_address_delivery>#{customization[:id_address_delivery]}</id_address_delivery>
        <id_cart>#{customization[:id_cart]}</id_cart>
        <id_product>#{customization[:id_product]}</id_product>
        <id_product_attribute>#{customization[:id_product_attribute]}</id_product_attribute>
        <quantity>#{customization[:quantity]}</quantity>
        <quantity_refunded>#{customization[:quantity_refunded]}</quantity_refunded>
        <quantity_returned><#{customization[:quantity_returned]}/quantity_returned>
        <in_cart>#{customization[:in_cart]}</in_cart>
          <associations>
            <customized_data_text_fields>
              <customized_data_text_field>
                <id_customization_field>#{customization[:customized_data_text_field_id_customization_field]}</id_customization_field>
                <value>#{customization[:customized_data_text_field_value]}</value>
              </customized_data_text_field>
            </customized_data_text_fields>
            <customized_data_images>
              <customized_data_image>
                <id_customization_field>#{customization[:customized_data_image_id_customization_field]}</id_customization_field>
                <value>#{customization[:customized_data_image_value]}</value>
              </customized_data_image>
            </customized_data_images>
          </associations>
        </customization>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_customization(id)
    sup = HTTParty.get("#{@api_url}customizations/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_customization(id)
    sup = HTTParty.delete("#{@api_url}customizations/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### DELIVERIES ######################################################################################################################################################################
   
  def self.post_deliveries(delivery)
    sup = HTTParty.post("#{@api_url}deliveries/",
    {
      body:
      "<prestashop>
        <delivery>
          <id></id>
          <id_carrier>#{delivery[:id_carrier]}</id_carrier>
          <id_range_price>#{delivery[:id_range_price]}</id_range_price>
          <id_range_weight>#{delivery[:id_range_weight]}</id_range_weight>
          <id_zone>#{delivery[:id_zone]}</id_zone>
          <id_shop>#{delivery[:id_shop]}</id_shop>
          <id_shop_group>#{delivery[:id_shop_group]}</id_shop_group>
          <price>#{delivery[:price]}</price>
        </delivery>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_deliveries(id,delivery)
    sup = HTTParty.put("#{@api_url}deliveries/#{id}",
    {
      body:
      "<prestashop>
        <delivery>
          <id>#{id}</id>
          <id_carrier>#{delivery[:id_carrier]}</id_carrier>
          <id_range_price>#{delivery[:id_range_price]}</id_range_price>
          <id_range_weight>#{delivery[:id_range_weight]}</id_range_weight>
          <id_zone>#{delivery[:id_zone]}</id_zone>
          <id_shop>#{delivery[:id_shop]}</id_shop>
          <id_shop_group>#{delivery[:id_shop_group]}</id_shop_group>
          <price>#{delivery[:price]}</price>
        </delivery>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_deliveries(id)
    sup = HTTParty.put("#{@api_url}deliveries/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_deliveries(id)
    sup = HTTParty.delete("#{@api_url}deliveries/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### EMPLOYEE ##############################################################################################################################################

  def self.post_employee(employee)
    emp = HTTParty.post("#{@api_url}employees/",
    {
      body: 
      "<prestashop>
        <employee>
          <id></id>
          <id_lang>#{employee[:id_lang]}</id_lang>
          <last_passwd_gen>#{employee[:last_passwd_gen]}</last_passwd_gen>
          <stats_date_from>#{employee[:stats_date_from]}</stats_date_from>
          <stats_date_to>#{employee[:stats_date_to]}</stats_date_to>
          <stats_compare_from>#{employee[:stats_compare_from]}</stats_compare_from>
          <stats_compare_to>#{employee[:stats_compare_to]}</stats_compare_to>
          <passwd>#{employee[:passwd]}</passwd>
          <lastname>#{employee[:lastname]}</lastname>
          <firstname>#{employee[:firstname]}</firstname>
          <email>#{employee[:email]}</email>
          <active>#{employee[:active]}</active>
          <id_profile>#{employee[:id_profile]}</id_profile>
          <bo_color>#{employee[:bo_color]}</bo_color>
          <default_tab>#{employee[:default_tab]}</default_tab>
          <bo_theme>#{employee[:bo_theme]}</bo_theme>
          <bo_css>#{employee[:bo_css]}</bo_css>
          <bo_width>#{employee[:bo_width]}</bo_width>
          <bo_menu>#{employee[:bo_menu]}</bo_menu>
          <stats_compare_option>#{employee[:stats_compare_option]}</stats_compare_option>
          <preselect_date_range>#{employee[:preselect_date_range]}</preselect_date_range>
          <id_last_order>#{employee[:id_last_order]}</id_last_order>
          <id_last_customer_message>#{employee[:id_last_customer_message]}</id_last_customer_message>
          <id_last_customer>#{employee[:id_last_customer]}</id_last_customer>
          <reset_password_token>#{employee[:reset_password_token]}</reset_password_token>
          <reset_password_validity>#{employee[:reset_password_validity]}</reset_password_validity>
          <has_enabled_gravatar>#{employee[:has_enabled_gravatar]}</has_enabled_gravatar>
        </employee>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }         
    }) 
    puts emp.body, emp.code
  end 

  def self.update_employee(id,employee)
    emp = HTTParty.put("#{@api_url}employees/#{id}",
    {
      body: 
      "<prestashop>
        <employee>
          <id>#{id}</id>
          <id_lang>#{employee[:id_lang]}</id_lang>
          <last_passwd_gen>#{employee[:last_passwd_gen]}</last_passwd_gen>
          <stats_date_from>#{employee[:stats_date_from]}</stats_date_from>
          <stats_date_to>#{employee[:stats_date_to]}</stats_date_to>
          <stats_compare_from>#{employee[:stats_compare_from]}</stats_compare_from>
          <stats_compare_to>#{employee[:stats_compare_to]}</stats_compare_to>
          <passwd>#{employee[:passwd]}</passwd>
          <lastname>#{employee[:lastname]}</lastname>
          <firstname>#{employee[:firstname]}</firstname>
          <email>#{employee[:email]}</email>
          <active>#{employee[:active]}</active>
          <id_profile>#{employee[:id_profile]}</id_profile>
          <bo_color>#{employee[:bo_color]}</bo_color>
          <default_tab>#{employee[:default_tab]}</default_tab>
          <bo_theme>#{employee[:bo_theme]}</bo_theme>
          <bo_css>#{employee[:bo_css]}</bo_css>
          <bo_width>#{employee[:bo_width]}</bo_width>
          <bo_menu>#{employee[:bo_menu]}</bo_menu>
          <stats_compare_option>#{employee[:stats_compare_option]}</stats_compare_option>
          <preselect_date_range>#{employee[:preselect_date_range]}</preselect_date_range>
          <id_last_order>#{employee[:id_last_order]}</id_last_order>
          <id_last_customer_message>#{employee[:id_last_customer_message]}</id_last_customer_message>
          <id_last_customer>#{employee[:id_last_customer]}</id_last_customer>
          <reset_password_token>#{employee[:reset_password_token]}</reset_password_token>
          <reset_password_validity>#{employee[:reset_password_validity]}</reset_password_validity>
          <has_enabled_gravatar>#{employee[:has_enabled_gravatar]}</has_enabled_gravatar>
        </employee>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }         
    }) 
    puts emp.body, emp.code
  end 

  def self.get_employee(id)
    emp = HTTParty.get("#{@api_url}employees/#{id}",
    {
      basic_auth: @auth       
    }) 
    puts emp.body, emp.code
  end 

  def self.delete_employee(id)
    emp = HTTParty.delete("#{@api_url}employees/#{id}",
    {
      basic_auth: @auth       
    }) 
    puts emp.body, emp.code
  end 


  ##### GROUPS ##########################################################################################################################################################################

  def self.post_groups(group)
    sup = HTTParty.post("#{@api_url}groups/",
    {
      body:
      "<prestashop>
        <group>
          <id></id>
          <reduction>#{group[:reduction]}</reduction>
          <price_display_method>#{group[:price_display_method]}</price_display_method>
          <show_prices>#{group[:show_prices]}</show_prices>
          <date_add>#{group[:date_add]}</date_add>
          <date_upd>#{group[:date_upd]}</date_upd>
          <name>
            <language id=\"1\">#{group[:name]}</language>
          </name>
        </group>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_groups(id,group)
    sup = HTTParty.put("#{@api_url}groups/#{id}",
    {
      body:
      "<prestashop>
        <group>
          <id>#{id}</id>
          <reduction>#{group[:reduction]}</reduction>
          <price_display_method>#{group[:price_display_method]}</price_display_method>
          <show_prices>#{group[:show_prices]}</show_prices>
          <date_add>#{group[:date_add]}</date_add>
          <date_upd>#{group[:date_upd]}</date_upd>
          <name>
            <language id=\"1\">#{group[:name]}</language>
          </name>
        </group>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_groups(id)
    sup = HTTParty.get("#{@api_url}groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_groups(id)
    sup = HTTParty.delete("#{@api_url}groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### GUESTS #########################################################################################################################################################################

  def self.post_guests(guest)
    sup = HTTParty.post("#{@api_url}guests/",
    {
      body:
      "<prestashop>
        <guest>
          <id></id>
          <id_customer>#{guest[:id_customer]}</id_customer>
          <id_operating_system>#{guest[:id_operating_system]}</id_operating_system>
          <id_web_browser>#{guest[:id_web_browser]}</id_web_browser>
          <javascript>#{guest[:javascript]}</javascript>
          <screen_resolution_x>#{guest[:screen_resolution_x]}</screen_resolution_x>
          <screen_resolution_y>#{guest[:screen_resolution_y]}</screen_resolution_y>
          <screen_color>#{guest[:screen_color]}</screen_color>
          <sun_java>#{guest[:sun_java]}</sun_java>
          <adobe_flash>#{guest[:adobe_flash]}</adobe_flash>
          <adobe_director>#{guest[:adobe_director]}</adobe_director>
          <apple_quicktime>#{guest[:apple_quicktime]}</apple_quicktime>
          <real_player>#{guest[:real_player]}</real_player>
          <windows_media>#{guest[:windows_media]}</windows_media>
          <accept_language>#{guest[:accept_language]}</accept_language>
          <mobile_theme>#{guest[:mobile_theme]}</mobile_theme>
        </guest>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_guests(id,guest)
    sup = HTTParty.put("#{@api_url}guests/#{id}",
    {
      body:
      "<prestashop>
        <guest>
          <id>#{id}</id>
          <id_customer>#{guest[:id_customer]}</id_customer>
          <id_operating_system>#{guest[:id_operating_system]}</id_operating_system>
          <id_web_browser>#{guest[:id_web_browser]}</id_web_browser>
          <javascript>#{guest[:javascript]}</javascript>
          <screen_resolution_x>#{guest[:screen_resolution_x]}</screen_resolution_x>
          <screen_resolution_y>#{guest[:screen_resolution_y]}</screen_resolution_y>
          <screen_color>#{guest[:screen_color]}</screen_color>
          <sun_java>#{guest[:sun_java]}</sun_java>
          <adobe_flash>#{guest[:adobe_flash]}</adobe_flash>
          <adobe_director>#{guest[:adobe_director]}</adobe_director>
          <apple_quicktime>#{guest[:apple_quicktime]}</apple_quicktime>
          <real_player>#{guest[:real_player]}</real_player>
          <windows_media>#{guest[:windows_media]}</windows_media>
          <accept_language>#{guest[:accept_language]}</accept_language>
          <mobile_theme>#{guest[:mobile_theme]}</mobile_theme>
        </guest>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_guests(id)
    sup = HTTParty.get("#{@api_url}guests/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_guests(id)
    sup = HTTParty.delete("#{@api_url}guests/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
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
                header: {
                  "Content-Type" => 'text/xml',
                  "charset" => 'utf-8'
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
              header: {
                "Content-Type" => 'text/xml',
                "charset" => 'utf-8'
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

    
   ##### MESSAGES #######################################################################################################################################################################

   def self.post_messages(message)
    sup = HTTParty.post("#{@api_url}messages/",
    {
      body:
      "<prestashop>
        <message>
          <id></id>
          <id_cart>#{message[:id_cart]}</id_cart>
          <id_order>#{message[:id_order]}</id_order>
          <id_customer>#{message[:id_customer]}</id_customer>
          <id_employee>#{message[:id_employee]}</id_employee>
          <message>#{message[:message]}</message>
          <private>#{message[:private]}</private>
          <date_add>#{message[:date_add]}</date_add>
        </message>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_messages(id,message)
    sup = HTTParty.put("#{@api_url}messages/#{id}",
    {
      body:
      "<prestashop>
        <message>
          <id>#{id}</id>
          <id_cart>#{message[:id_cart]}</id_cart>
          <id_order>#{message[:id_order]}</id_order>
          <id_customer>#{message[:id_customer]}</id_customer>
          <id_employee>#{message[:id_employee]}</id_employee>
          <message>#{message[:message]}</message>
          <private>#{message[:private]}</private>
          <date_add>#{message[:date_add]}</date_add>
        </message>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_messages(id)
    sup = HTTParty.get("#{@api_url}messages/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_messages(id)
    sup = HTTParty.delete("#{@api_url}messages/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
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

    ##### PRICE RANGES ####################################################################################################################################################################

    def self.post_price_ranges(price_range)
      sup = HTTParty.post("#{@api_url}price_ranges/",
      {
        body:
        "<prestashop>
          <price_range>
            <id></id>
            <id_carrier>#{price_range[:id_carrier]}</id_carrier>
            <delimiter1>#{price_range[:delimiter1]}</delimiter1>
            <delimiter2>#{price_range[:delimiter2]}</delimiter2>
          </price_range>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.update_price_ranges(id,price_range)
      sup = HTTParty.put("#{@api_url}price_ranges/#{id}",
      {
        body:
        "<prestashop>
          <price_range>
            <id>#{id}</id>
            <id_carrier>#{price_range[:id_carrier]}</id_carrier>
            <delimiter1>#{price_range[:delimiter1]}</delimiter1>
            <delimiter2>#{price_range[:delimiter2]}</delimiter2>
          </price_range>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts sup.body,sup.code
    end

    def self.get_price_ranges(id)
      sup = HTTParty.get("#{@api_url}price_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_price_ranges(id)
      sup = HTTParty.delete("#{@api_url}price_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
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

  # def self.post_product(product)
  def self.post_product()
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

  ##### SHOP GROUPS #####################################################################################################################################################################

  def self.post_shop_groups(shop_group)
    sup = HTTParty.post("#{@api_url}shop_groups/",
    {
      body:
      "<prestashop>
        <shop_group>
          <id></id>
          <name>#{shop_group[:name]}</name>
          <color>#{shop_group[:color]}</color>
          <share_customer>#{shop_group[:share_customer]}</share_customer>
          <share_order>#{shop_group[:share_order]}</share_order>
          <share_stock>#{shop_group[:share_stock]}</share_stock>
          <active>#{shop_group[:active]}</active>
          <deleted>#{shop_group[:deleted]}</deleted>
        </shop_group>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_shop_groups(id,shop_group)
    sup = HTTParty.put("#{@api_url}shop_groups/#{id}",
    {
      body:
      "<prestashop>
        <shop_group>
          <id>#{id}</id>
          <name>#{shop_group[:name]}</name>
          <color>#{shop_group[:color]}</color>
          <share_customer>#{shop_group[:share_customer]}</share_customer>
          <share_order>#{shop_group[:share_order]}</share_order>
          <share_stock>#{shop_group[:share_stock]}</share_stock>
          <active>#{shop_group[:active]}</active>
          <deleted>#{shop_group[:deleted]}</deleted>
        </shop_group>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_shop_groups(id)
    sup = HTTParty.get("#{@api_url}shop_groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_shop_groups(id)
    sup = HTTParty.delete("#{@api_url}shop_groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### SHOP URLS ######################################################################################################################################################################

  def self.post_shop_urls(shop_url)
    sup = HTTParty.post("#{@api_url}shop_urls/",
    {
      body:
      "<prestashop>
        <shop_url>
          <id></id>
          <id_shop>#{shop_url[:id_shop]}</id_shop>
          <active>#{shop_url[:active]}</active>
          <main>#{shop_url[:main]}</main>
          <domain>#{shop_url[:domain]}</domain>
          <domain_ssl>#{shop_url[:domain_ssl]}</domain_ssl>
          <physical_uri>#{shop_url[:physical_uri]}</physical_uri>
          <virtual_uri>#{shop_url[:virtual_uri]}</virtual_uri>
        </shop_url>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_shop_urls(id,shop_url)
    sup = HTTParty.put("#{@api_url}shop_urls/#{id}",
    {
      body:
      "<prestashop>
        <shop_url>
          <id>#{id}</id>
          <id_shop>#{shop_url[:id_shop]}</id_shop>
          <active>#{shop_url[:active]}</active>
          <main>#{shop_url[:main]}</main>
          <domain>#{shop_url[:domain]}</domain>
          <domain_ssl>#{shop_url[:domain_ssl]}</domain_ssl>
          <physical_uri>#{shop_url[:physical_uri]}</physical_uri>
          <virtual_uri>#{shop_url[:virtual_uri]}</virtual_uri>
        </shop_url>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_shop_urls(id)
    sup = HTTParty.get("#{@api_url}shop_urls/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_shop_urls(id)
    sup = HTTParty.delete("#{@api_url}shop_urls/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SHOPS ##########################################################################################################################################################################

  def self.post_shops(shop)
    sup = HTTParty.post("#{@api_url}shops/",
    {
      body:
      "<prestashop>
        <shop>
        <id></id>
        <id_shop_group>#{shop[:id_shop_group]}</id_shop_group>
        <id_category>#{shop[:id_category]}</id_category>
        <active>#{shop[:active]}</active>
        <deleted>#{shop[:deleted]}</deleted>
        <name>#{shop[:name]}</name>
        <color>#{shop[:color]}</color>
        <theme_name>#{shop[:theme_name]}</theme_name>
        </shop>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_shops(id,shop)
    sup = HTTParty.put("#{@api_url}shops/#{id}",
    {
      body:
      "<prestashop>
        <shop>
        <id>#{id}</id>
        <id_shop_group>#{shop[:id_shop_group]}</id_shop_group>
        <id_category>#{shop[:id_category]}</id_category>
        <active>#{shop[:active]}</active>
        <deleted>#{shop[:deleted]}</deleted>
        <name>#{shop[:name]}</name>
        <color>#{shop[:color]}</color>
        <theme_name>#{shop[:theme_name]}</theme_name>
        </shop>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_shops(id)
    sup = HTTParty.get("#{@api_url}shops/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_shops(id)
    sup = HTTParty.delete("#{@api_url}shops/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### SPECIFIC PRICE RULES ###########################################################################################################################################################

  def self.post_specific_price_rules(specific_price_rule)
    sup = HTTParty.post("#{@api_url}specific_price_rules/",
    {
      body:
      "<prestashop>
        <specific_price_rule>
          <id></id>
          <id_shop>#{specific_price_rule[:id_shop]}</id_shop>
          <id_country>#{specific_price_rule[:id_country]}</id_country>
          <id_currency>#{specific_price_rule[:id_currency]}</id_currency>
          <id_group>#{specific_price_rule[:id_group]}</id_group>
          <name>#{specific_price_rule[:name]}</name>
          <from_quantity>#{specific_price_rule[:from_quantity]}</from_quantity>
          <price>#{specific_price_rule[:price]}</price>
          <reduction>#{specific_price_rule[:reduction]}</reduction>
          <reduction_tax>#{specific_price_rule[:reduction_tax]}</reduction_tax>
          <reduction_type>#{specific_price_rule[:reduction_type]}</reduction_type>
          <from>#{specific_price_rule[:from]}</from>
          <to>#{specific_price_rule[:to]}</to>
        </specific_price_rule>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_specific_price_rules(id,specific_price_rule)
    sup = HTTParty.put("#{@api_url}specific_price_rules/#{id}",
    {
      body:
      "<prestashop>
        <specific_price_rule>
          <id>#{id}</id>
          <id_shop>#{specific_price_rule[:id_shop]}</id_shop>
          <id_country>#{specific_price_rule[:id_country]}</id_country>
          <id_currency>#{specific_price_rule[:id_currency]}</id_currency>
          <id_group>#{specific_price_rule[:id_group]}</id_group>
          <name>#{specific_price_rule[:name]}</name>
          <from_quantity>#{specific_price_rule[:from_quantity]}</from_quantity>
          <price>#{specific_price_rule[:price]}</price>
          <reduction>#{specific_price_rule[:reduction]}</reduction>
          <reduction_tax>#{specific_price_rule[:reduction_tax]}</reduction_tax>
          <reduction_type>#{specific_price_rule[:reduction_type]}</reduction_type>
          <from>#{specific_price_rule[:from]}</from>
          <to>#{specific_price_rule[:to]}</to>
        </specific_price_rule>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_specific_price_rules(id)
    sup = HTTParty.get("#{@api_url}specific_price_rules/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_specific_price_rules(id)
    sup = HTTParty.delete("#{@api_url}specific_price_rules/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SPECIFIC PRICES ################################################################################################################################################################

  def self.post_specific_prices(specific_price)
    sup = HTTParty.post("#{@api_url}specific_prices/",
    {
      body:
      "<prestashop>
        <specific_price>
          <id></id>
          <id_shop_group>#{specific_price[:id_shop_group]}</id_shop_group>
          <id_shop>#{specific_price[:id_shop]}</id_shop>
          <id_cart>#{specific_price[:id_cart]}</id_cart>
          <id_product>#{specific_price[:id_product]}</id_product>
          <id_product_attribute>#{specific_price[:id_product_attribute]}</id_product_attribute>
          <id_currency>#{specific_price[:id_currency]}</id_currency>
          <id_country>#{specific_price[:id_country]}</id_country>
          <id_group>#{specific_price[:id_group]}</id_group>
          <id_customer>#{specific_price[:id_customer]}</id_customer>
          <id_specific_price_rule>#{specific_price[:id_specific_price_rule]}</id_specific_price_rule>
          <price>#{specific_price[:price]}</price>
          <from_quantity>#{specific_price[:from_quantity]}</from_quantity>
          <reductionreduction]}</reduction>
          <reduction_tax>#{specific_price[:reduction_tax]}</reduction_tax>
          <reduction_type>#{specific_price[:reduction_type]}</reduction_type>
          <from>#{specific_price[:from]}</from>
          <to>#{specific_price[:to]}</to>
        </specific_price>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_specific_prices(id,specific_price)
    sup = HTTParty.put("#{@api_url}specific_prices/#{id}",
    {
      body:
      "<prestashop>
        <specific_price>
          <id>#{id}</id>
          <id_shop_group>#{specific_price[:id_shop_group]}</id_shop_group>
          <id_shop>#{specific_price[:id_shop]}</id_shop>
          <id_cart>#{specific_price[:id_cart]}</id_cart>
          <id_product>#{specific_price[:id_product]}</id_product>
          <id_product_attribute>#{specific_price[:id_product_attribute]}</id_product_attribute>
          <id_currency>#{specific_price[:id_currency]}</id_currency>
          <id_country>#{specific_price[:id_country]}</id_country>
          <id_group>#{specific_price[:id_group]}</id_group>
          <id_customer>#{specific_price[:id_customer]}</id_customer>
          <id_specific_price_rule>#{specific_price[:id_specific_price_rule]}</id_specific_price_rule>
          <price>#{specific_price[:price]}</price>
          <from_quantity>#{specific_price[:from_quantity]}</from_quantity>
          <reductionreduction]}</reduction>
          <reduction_tax>#{specific_price[:reduction_tax]}</reduction_tax>
          <reduction_type>#{specific_price[:reduction_type]}</reduction_type>
          <from>#{specific_price[:from]}</from>
          <to>#{specific_price[:to]}</to>
        </specific_price>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_specific_prices(id)
    sup = HTTParty.get("#{@api_url}specific_prices/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_specific_prices(id)
    sup = HTTParty.delete("#{@api_url}specific_prices/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

   ##### STATES #########################################################################################################################################################################

   def self.post_states(state)
    sup = HTTParty.post("#{@api_url}states/",
    {
      body:
      "<prestashop>
        <state>
          <id></id>
          <id_zone>#{state[:id_zone]}</id_zone>
          <id_country>#{state[:id_country]}</id_country>
          <iso_code>#{state[:iso_code]}</iso_code>
          <name>#{state[:name]}</name>
          <active>#{state[:active]}</active>
        </state>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_states(id,state)
    sup = HTTParty.put("#{@api_url}states/#{id}",
    {
      body:
      "<prestashop>
        <state>
          <id>#{id}</id>
          <id_zone>#{state[:id_zone]}</id_zone>
          <id_country>#{state[:id_country]}</id_country>
          <iso_code>#{state[:iso_code]}</iso_code>
          <name>#{state[:name]}</name>
          <active>#{state[:active]}</active>
        </state>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_states(id)
    sup = HTTParty.get("#{@api_url}states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_states(id)
    sup = HTTParty.delete("#{@api_url}states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

   ##### STOCK AVAILABLES #############################################################################################################################################################

   def self.post_stock_availables(stock_available)
    sup = HTTParty.post("#{@api_url}stock_movements/",
    {
      body:
      "<prestashop>
        <stock_available>
          <id></id>
          <id_product>#{stock_available[:id_product]}</id_product>
          <id_product_attribute>#{stock_available[:id_product_attribute]}</id_product_attribute>
          <id_shop>#{stock_available[:id_shop]}</id_shop>
          <id_shop_group>#{stock_available[:id_shop_group]}</id_shop_group>
          <quantity>#{stock_available[:quantity]}</quantity>
          <depends_on_stock>#{stock_available[:depends_on_stock]}</depends_on_stock>
          <out_of_stock>#{stock_available[:out_of_stock]}</out_of_stock>
          <location>#{stock_available[:location]}</location>
        </stock_available>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_stock_availables(id,stock_available)
    sup = HTTParty.put("#{@api_url}stock_movements/#{id}",
    {
      body:
      "<prestashop>
        <stock_available>
          <id>#{id}</id>
          <id_product>#{stock_available[:id_product]}</id_product>
          <id_product_attribute>#{stock_available[:id_product_attribute]}</id_product_attribute>
          <id_shop>#{stock_available[:id_shop]}</id_shop>
          <id_shop_group>#{stock_available[:id_shop_group]}</id_shop_group>
          <quantity>#{stock_available[:quantity]}</quantity>
          <depends_on_stock>#{stock_available[:depends_on_stock]}</depends_on_stock>
          <out_of_stock>#{stock_available[:out_of_stock]}</out_of_stock>
          <location>#{stock_available[:location]}</location>
        </stock_available>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_stock_availables(id)
    sup = HTTParty.get("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stock_availables(id)
    sup = HTTParty.delete("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### STOCK MOVEMENT REASONS #########################################################################################################################################################

  def self.post_stock_movement_reasons(stock_movement_reason)
    sup = HTTParty.post("#{@api_url}stock_movement_reasons/",
    {
      body:
      "<prestashop>
        <stock_movement_reason>
          <id></id>
          <sign>#{stock_movement_reason[:sign]}</sign>
          <deleted>#{stock_movement_reason[:deleted]}</deleted>
          <date_add>#{stock_movement_reason[:date_add]}</date_add>
          <date_upd>#{stock_movement_reason[:date_upd]}</date_upd>
          <name>
           <language id=\"1\">#{stock_movement_reason[:name]}</language>
          </name>
        </stock_movement_reason>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_stock_movement_reasons(id,stock_movement_reason)
    sup = HTTParty.put("#{@api_url}stock_movement_reasons/#{id}",
    {
      body:
      "<prestashop>
        <stock_movement_reason>
          <id>#{id}</id>
          <sign>#{stock_movement_reason[:sign]}</sign>
          <deleted>#{stock_movement_reason[:deleted]}</deleted>
          <date_add>#{stock_movement_reason[:date_add]}</date_add>
          <date_upd>#{stock_movement_reason[:date_upd]}</date_upd>
          <name>
           <language id=\"1\">#{stock_movement_reason[:name]}</language>
          </name>
        </stock_movement_reason>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_stock_movement_reasons(id)
    sup = HTTParty.get("#{@api_url}stock_movement_reasons/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stock_movement_reasons(id)
    sup = HTTParty.delete("#{@api_url}stock_movement_reasons/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### STOCK MOVEMENTS ###############################################################################################################################################################

  def self.post_stock_movements(stock_movement)
    sup = HTTParty.post("#{@api_url}stock_movements/",
    {
      body:
      "<prestashop>
        <stock_mvt>
        <id></id>
        <id_product>#{stock_movement[:id_product]}</id_product>
        <id_product_attribute>#{stock_movement[:id_product_attribute]}</id_product_attribute>
        <id_warehouse>#{stock_movement[:id_warehouse]}</id_warehouse>
        <id_currency>#{stock_movement[:id_currency]}</id_currency>
        <management_type>#{stock_movement[:management_type]}</management_type>
        <id_employee>#{stock_movement[:id_employee]}</id_employee>
        <id_stock>#{stock_movement[:id_stock]}</id_stock>
        <id_stock_mvt_reason>#{stock_movement[:id_stock_mvt_reason]}</id_stock_mvt_reason>
        <id_order>#{stock_movement[:id_order]}</id_order>
        <id_supply_order>#{stock_movement[:id_supply_order]}</id_supply_order>
        <product_name>
          <language id=\"1\">#{stock_movement[:product_name_id]}</language>
        </product_name>
        <ean13>#{stock_movement[:ean13]}</ean13>
        <upc>#{stock_movement[:upc]}</upc>
        <reference>#{stock_movement[:reference]}</reference>
        <mpn>#{stock_movement[:mpn]}</mpn>
        <physical_quantity>#{stock_movement[:physical_quantity]}</physical_quantity>
        <sign>#{stock_movement[:sign]}</sign>
        <last_wa>#{stock_movement[:last_wa]}</last_wa>
        <current_wa>#{stock_movement[:current_wa]}</current_wa>
        <price_te>#{stock_movement[:price_te]}</price_te>
        <date_add>#{stock_movement[:date_add]}</date_add>
        </stock_mvt>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_stock_movements(id,stock_movement)
    sup = HTTParty.put("#{@api_url}stock_movements/#{id}",
    {
      body:
      "<prestashop>
        <stock_mvt>
        <id>#{id}</id>
        <id_product>#{stock_movement[:id_product]}</id_product>
        <id_product_attribute>#{stock_movement[:id_product_attribute]}</id_product_attribute>
        <id_warehouse>#{stock_movement[:id_warehouse]}</id_warehouse>
        <id_currency>#{stock_movement[:id_currency]}</id_currency>
        <management_type>#{stock_movement[:management_type]}</management_type>
        <id_employee>#{stock_movement[:id_employee]}</id_employee>
        <id_stock>#{stock_movement[:id_stock]}</id_stock>
        <id_stock_mvt_reason>#{stock_movement[:id_stock_mvt_reason]}</id_stock_mvt_reason>
        <id_order>#{stock_movement[:id_order]}</id_order>
        <id_supply_order>#{stock_movement[:id_supply_order]}</id_supply_order>
        <product_name>
          <language id=\"1\">#{stock_movement[:product_name_id]}</language>
        </product_name>
        <ean13>#{stock_movement[:ean13]}</ean13>
        <upc>#{stock_movement[:upc]}</upc>
        <reference>#{stock_movement[:reference]}</reference>
        <mpn>#{stock_movement[:mpn]}</mpn>
        <physical_quantity>#{stock_movement[:physical_quantity]}</physical_quantity>
        <sign>#{stock_movement[:sign]}</sign>
        <last_wa>#{stock_movement[:last_wa]}</last_wa>       
        <current_wa>#{stock_movement[:current_wa]}</current_wa>
        <price_te>#{stock_movement[:price_te]}</price_te>
        <date_add>#{stock_movement[:date_add]}</date_add>
        </stock_mvt>
      </prestashop>",
      basic_auth: @auth,
      header: 
      {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_stock_movements(id)
    sup = HTTParty.get("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stock_movements(id)
    sup = HTTParty.delete("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### STOCKS ########################################################################################################################################################################

  def self.post_stocks(stock)
    sup = HTTParty.post("#{@api_url}stocks/",
    {
      body:
      "<prestashop>
        <stock>
        <id></id>
        <id_warehouse>#{stock[:id_warehouse]}</id_warehouse>
        <id_product>#{stock[:id_product]}<</id_product>
        <id_product_attribute>#{stock[:id_product_attribute]}<</id_product_attribute>
        <reference>#{stock[:reference]}<</reference>
        <ean13>#{stock[:ean13]}<</ean13>
        <isbn>#{stock[:isbn]}<</isbn>
        <upc>#{stock[:upc]}<</upc>
        <mpn>#{stock[:mpn]}<</mpn>
        <physical_quantity>#{stock[:physical_quantity]}<</physical_quantity>
        <usable_quantity>#{stock[:usable_quantity]}<</usable_quantity>
        <price_te>#{stock[:price_te]}<</price_te>
        </stock>
      </prestashop>",
      basic_auth: @auth,
      header: 
      {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_stocks(id,stock)
    sup = HTTParty.post("#{@api_url}stocks/#{id}",
    {
      body:
      "<prestashop>
        <stock>
        <id>#{id}</id>
        <id_warehouse>#{stock[:id_warehouse]}</id_warehouse>
        <id_product>#{stock[:id_product]}<</id_product>
        <id_product_attribute>#{stock[:id_product_attribute]}<</id_product_attribute>
        <reference>#{stock[:reference]}<</reference>
        <ean13>#{stock[:ean13]}<</ean13>
        <isbn>#{stock[:isbn]}<</isbn>
        <upc>#{stock[:upc]}<</upc>
        <mpn>#{stock[:mpn]}<</mpn>
        <physical_quantity>#{stock[:physical_quantity]}<</physical_quantity>
        <usable_quantity>#{stock[:usable_quantity]}<</usable_quantity>
        <price_te>#{stock[:price_te]}<</price_te>
        </stock>
      </prestashop>",
      basic_auth: @auth,
      header: 
      {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_stocks(id)
    sup = HTTParty.get("#{@api_url}stocks/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stocks(id)
    sup = HTTParty.delete("#{@api_url}stocks/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### STORES ########################################################################################################################################################################

  def self.post_stores(store)
    sup = HTTParty.post("#{@api_url}stores/",
    {
      body:
      "<prestashop>
      <store>
      <id></id>
      <id_country>#{store[:id_country]}</id_country>
      <id_state>#{store[:id_state]}</id_state>
      <hours>
        <language id=\"1\">#{store[:hours]}</language>
      </hours>
      <postcode>#{store[:postcode]}</postcode>
      <city>#{store[:city]}</city>
      <latitude>#{store[:latitude]}</latitude>
      <longitude>#{store[:longitude]}</longitude>
      <phone>#{store[:phone]}</phone>
      <fax>#{store[:fax]}</fax>
      <email>#{store[:email]}</email>
      <active>#{store[:active]}</active>
      <date_add>#{store[:date_add]}</date_add>
      <date_upd>#{store[:date_upd]}</date_upd>
      <name>
      <language id=\"1\">#{store[:name]}</language>
      </name>
      <address1>
      <language id=\"1\">#{store[:address1]}</language>
      </address1>
      <address2>
      <language id=\"1\">#{store[:address2]}</language>
      </address2>
      <note>
      <language id=\"1\">#{store[:note]}</language>
      </note>
      </store>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_stores(id,store)
    sup = HTTParty.put("#{@api_url}stores/#{id}",
    {
      body:
      "<prestashop>
      <store>
      <id>#{id}</id>
      <id_country>#{store[:id_country]}</id_country>
      <id_state>#{store[:id_state]}</id_state>
      <hours>
        <language id=\"1\">#{store[:hours]}</language>
      </hours>
      <postcode>#{store[:postcode]}</postcode>
      <city>#{store[:city]}</city>
      <latitude>#{store[:latitude]}</latitude>
      <longitude>#{store[:longitude]}</longitude>
      <phone>#{store[:phone]}</phone>
      <fax>#{store[:fax]}</fax>
      <email>#{store[:email]}</email>
      <active>#{store[:active]}</active>
      <date_add>#{store[:date_add]}</date_add>
      <date_upd>#{store[:date_upd]}</date_upd>
      <name>
      <language id=\"1\">#{store[:name]}</language>
      </name>
      <address1>
      <language id=\"1\">#{store[:address1]}</language>
      </address1>
      <address2>
      <language id=\"1\">#{store[:address2]}</language>
      </address2>
      <note>
      <language id=\"1\">#{store[:note]}</language>
      </note>
      </store>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_stores(id)
    sup = HTTParty.get("#{@api_url}stores/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stores(id)
    sup = HTTParty.delete("#{@api_url}stores/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLIERS ######################################################################################################################################################################

  def self.post_supplier(supplier)
    sup = HTTParty.post("#{@api_url}suppliers/",
    {
      body:
      "<prestashop>
        <supplier>
          <id></id>
          <link_rewrite>#{supplier[:link_rewrite]}</link_rewrite>
          <name>#{supplier[:name]}</name>
          <active>#{supplier[:active]}</active>
          <date_add>#{supplier[:date_add]}</date_add>
          <date_upd>#{supplier[:date_upd]}</date_upd>
          <description>
          <language id=\"1\">#{supplier[:description]}</language>
          </description>
          <meta_title>
          <language id=\"1\">#{supplier[:meta_title]}</language>
          </meta_title>
          <meta_description>
          <language id=\"1\">#{supplier[:meta_description]}</language>
          </meta_description>
          <meta_keywords>
          <language id=\"1\">#{supplier[:meta_keywords]}</language>
          </meta_keywords>
        </supplier>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_supplier(id,supplier)
    sup = HTTParty.put("#{@api_url}suppliers/#{id}",
    {
      body:
      "<prestashop>
        <supplier>
          <id>#{id}</id>
          <link_rewrite>#{supplier[:link_rewrite]}</link_rewrite>
          <name>#{supplier[:name]}</name>
          <active>#{supplier[:active]}</active>
          <date_add>#{supplier[:date_add]}</date_add>
          <date_upd>#{supplier[:date_upd]}</date_upd>
          <description>
          <language id=\"1\">#{supplier[:description]}</language>
          </description>
          <meta_title>
          <language id=\"1\">#{supplier[:meta_title]}</language>
          </meta_title>
          <meta_description>
          <language id=\"1\">#{supplier[:meta_description]}</language>
          </meta_description>
          <meta_keywords>
          <language id=\"1\">#{supplier[:meta_keywords]}</language>
          </meta_keywords>
        </supplier>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_supplier(id)
    sup = HTTParty.get("#{@api_url}suppliers/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supplier(id)
    sup = HTTParty.delete("#{@api_url}suppliers/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER DETAILS ###########################################################################################################################################################

  def self.post_supply_order_detail(supply_order_detail)
    sup = HTTParty.post("#{@api_url}supply_order_details/",
    {
      body:
      "<prestashop>
        <supply_order_detail>
          <id></id>
          <id_supply_order>#{supply_order_detail[:id_supply_order]}</id_supply_order>
          <id_product>#{supply_order_detail[:id_product]}</id_product>
          <id_product_attribute>#{supply_order_detail[:id_product_attribute]}</id_product_attribute>
          <reference>#{supply_order_detail[:reference]}</reference>
          <supplier_reference>#{supply_order_detail[:supplier_reference]}</supplier_reference>
          <name>#{supply_order_detail[:name]}</name>
          <ean13>#{supply_order_detail[:ean13]}</ean13>
          <isbn>#{supply_order_detail[:isbn]}</isbn>
          <upc>#{supply_order_detail[:upc]}</upc>
          <mpn>#{supply_order_detail[:mpn]}</mpn>
          <exchange_rate>#{supply_order_detail[:exchange_rate]}</exchange_rate>
          <unit_price_te>#{supply_order_detail[:unit_price_te]}</unit_price_te>
          <quantity_expected>#{supply_order_detail[:quantity_expected]}</quantity_expected>
          <quantity_received>#{supply_order_detail[:quantity_received]}</quantity_received>
          <price_te>#{supply_order_detail[:price_te]}</price_te>
          <discount_rate>#{supply_order_detail[:discount_rate]}</discount_rate>
          <discount_value_te>#{supply_order_detail[:discount_value_te]}</discount_value_te>
          <price_with_discount_te>#{supply_order_detail[:price_with_discount_te]}</price_with_discount_te>
          <tax_rate>#{supply_order_detail[:tax_rate]}</tax_rate>
          <tax_value>#{supply_order_detail[:tax_value]}</tax_value>
          <price_ti>#{supply_order_detail[:price_ti]}</price_ti>
          <tax_value_with_order_discount>#{supply_order_detail[:tax_value_with_order_discount]}</tax_value_with_order_discount>
          <price_with_order_discount_te>#{supply_order_detail[:price_with_order_discount_te]}</price_with_order_discount_te>
        </supply_order_detail>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_supply_order_detail(id,supply_order_detail)
    sup = HTTParty.put("#{@api_url}supply_order_details/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_detail>
          <id>#{id}</id>
          <id_supply_order>#{supply_order_detail[:id_supply_order]}</id_supply_order>
          <id_product>#{supply_order_detail[:id_product]}</id_product>
          <id_product_attribute>#{supply_order_detail[:id_product_attribute]}</id_product_attribute>
          <reference>#{supply_order_detail[:reference]}</reference>
          <supplier_reference>#{supply_order_detail[:supplier_reference]}</supplier_reference>
          <name>#{supply_order_detail[:name]}</name>
          <ean13>#{supply_order_detail[:ean13]}</ean13>
          <isbn>#{supply_order_detail[:isbn]}</isbn>
          <upc>#{supply_order_detail[:upc]}</upc>
          <mpn>#{supply_order_detail[:mpn]}</mpn>
          <exchange_rate>#{supply_order_detail[:exchange_rate]}</exchange_rate>
          <unit_price_te>#{supply_order_detail[:unit_price_te]}</unit_price_te>
          <quantity_expected>#{supply_order_detail[:quantity_expected]}</quantity_expected>
          <quantity_received>#{supply_order_detail[:quantity_received]}</quantity_received>
          <price_te>#{supply_order_detail[:price_te]}</price_te>
          <discount_rate>#{supply_order_detail[:discount_rate]}</discount_rate>
          <discount_value_te>#{supply_order_detail[:discount_value_te]}</discount_value_te>
          <price_with_discount_te>#{supply_order_detail[:price_with_discount_te]}</price_with_discount_te>
          <tax_rate>#{supply_order_detail[:tax_rate]}</tax_rate>
          <tax_value>#{supply_order_detail[:tax_value]}</tax_value>
          <price_ti>#{supply_order_detail[:price_ti]}</price_ti>
          <tax_value_with_order_discount>#{supply_order_detail[:tax_value_with_order_discount]}</tax_value_with_order_discount>
          <price_with_order_discount_te>#{supply_order_detail[:price_with_order_discount_te]}</price_with_order_discount_te>
        </supply_order_detail>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_supply_order_detail(id)
    sup = HTTParty.get("#{@api_url}supply_order_details/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_detail(id)
    sup = HTTParty.delete("#{@api_url}supply_order_details/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER HISOTIRES #########################################################################################################################################################

  def self.post_supply_order_history(supply_order_history)
    sup = HTTParty.post("#{@api_url}supply_order_histories/",
    {
      body:
      "<prestashop>
        <supply_order_history>
          <id></id>
          <id_supply_order>#{supply_order_history[:id_supply_order]}</id_supply_order>
          <id_employee>#{supply_order_history[:id_employee]}</id_employee>
          <id_state>#{supply_order_history[:id_state]}</id_state>
          <employee_firstname>#{supply_order_history[:employee_firstname]}</employee_firstname>
          <employee_lastname>#{supply_order_history[:employee_lastname]}</employee_lastname>
          <date_add>#{supply_order_history[:date_add]}</date_add>
        </supply_order_history>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_supply_order_history(id,supply_order_history)
    sup = HTTParty.put("#{@api_url}supply_order_histories/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_history>
          <id>#{id}</id>
          <id_supply_order>#{supply_order_history[:id_supply_order]}</id_supply_order>
          <id_employee>#{supply_order_history[:id_employee]}</id_employee>
          <id_state>#{supply_order_history[:id_state]}</id_state>
          <employee_firstname>#{supply_order_history[:employee_firstname]}</employee_firstname>
          <employee_lastname>#{supply_order_history[:employee_lastname]}</employee_lastname>
          <date_add>#{supply_order_history[:date_add]}</date_add>
        </supply_order_history>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_supply_order_history(id)
    sup = HTTParty.get("#{@api_url}supply_order_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_history(id)
    sup = HTTParty.delete("#{@api_url}supply_order_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER RECEIPT HISOTRIES #################################################################################################################################################

  def self.post_supply_order_receipt_history(supply_order_receipt_history)
    sup = HTTParty.post("#{@api_url}supply_order_receipt_histories/",
    {
      body:
      "<prestashop>
        <supply_order_receipt_history>
          <id></id>
          <id_supply_order_detail>#{supply_order_receipt_history[:id_supply_order_detail]}</id_supply_order_detail>
          <id_employee>#{supply_order_receipt_history[:id_employee]}</id_employee>
          <id_supply_order_state>#{supply_order_receipt_history[:id_supply_order_state]}</id_supply_order_state>
          <employee_firstname>#{supply_order_receipt_history[:employee_firstname]}</employee_firstname>
          <employee_lastname>#{supply_order_receipt_history[:employee_lastname]}</employee_lastname>
          <quantity>#{supply_order_receipt_history[:quantity]}</quantity>
          <date_add>#{supply_order_receipt_history[:date_add]}</date_add>
        </supply_order_receipt_history>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_supply_order_receipt_history(id,supply_order_receipt_history)
    sup = HTTParty.put("#{@api_url}supply_order_receipt_histories/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_receipt_history>
          <id>#{id}</id>
          <id_supply_order_detail>#{supply_order_receipt_history[:id_supply_order_detail]}</id_supply_order_detail>
          <id_employee>#{supply_order_receipt_history[:id_employee]}</id_employee>
          <id_supply_order_state>#{supply_order_receipt_history[:id_supply_order_state]}</id_supply_order_state>
          <employee_firstname>#{supply_order_receipt_history[:employee_firstname]}</employee_firstname>
          <employee_lastname>#{supply_order_receipt_history[:employee_lastname]}</employee_lastname>
          <quantity>#{supply_order_receipt_history[:quantity]}</quantity>
          <date_add>#{supply_order_receipt_history[:date_add]}</date_add>
        </supply_order_receipt_history>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_supply_order_receipt_history(id)
    sup = HTTParty.get("#{@api_url}supply_order_receipt_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_receipt_history(id)
    sup = HTTParty.delete("#{@api_url}supply_order_receipt_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER STATES ############################################################################################################################################################

  def self.post_supply_order_states(supply_order_state)
    sup = HTTParty.post("#{@api_url}supply_order_states/",
    {
      body:
      "<prestashop>
        <supply_order_state>
          <id></id>
          <delivery_note>#{supply_order_state[:delivery_note]}</delivery_note>
          <editable>#{supply_order_state[:editable]}</editable>
          <receipt_state>#{supply_order_state[:receipt_state]}</receipt_state>
          <pending_receipt>#{supply_order_state[:pending_receipt]}</pending_receipt>
          <enclosed>#{supply_order_state[:enclosed]}</enclosed>
          <color>#{supply_order_state[:color]}</color>
          <name>
          <language id=\"1\">#{supply_order_state[:name]}</language>
          </name>
        </supply_order_state>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_supply_order_states(id, supply_order_state)
    sup = HTTParty.put("#{@api_url}supply_order_states/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_state>
          <id>#{id}</id>
          <delivery_note>#{supply_order_state[:delivery_note]}</delivery_note>
          <editable>#{supply_order_state[:editable]}</editable>
          <receipt_state>#{supply_order_state[:receipt_state]}</receipt_state>
          <pending_receipt>#{supply_order_state[:pending_receipt]}</pending_receipt>
          <enclosed>#{supply_order_state[:enclosed]}</enclosed>
          <color>#{supply_order_state[:color]}</color>
          <name>
          <language id=\"1\">#{supply_order_state[:name]}</language>
          </name>
        </supply_order_state>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_supply_order_states(id)
    sup = HTTParty.get("#{@api_url}supply_order_states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_states(id)
    sup = HTTParty.delete("#{@api_url}supply_order_states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER ###################################################################################################################################################################
   
  def self.post_supply_orders(supply_orders)
    sup = HTTParty.post("#{@api_url}supply_orders/",
    {
      body:
      "<prestashop>
        <supply_order>
        <id></id>
        <id_supplier>#{supply_orders[:id_supplier]}</id_supplier>
        <id_lang>#{supply_orders[:id_lang]}</id_lang>
        <id_warehouse>#{supply_orders[:id_warehouse]}</id_warehouse>
        <id_supply_order_state>#{supply_orders[:id_supply_order_state]}</id_supply_order_state>
        <id_currency>#{supply_orders[:id_currency]}</id_currency>
        <supplier_name>#{supply_orders[:supplier_name]}</supplier_name>
        <reference>#{supply_orders[:reference]}</reference>
        <date_delivery_expected>#{supply_orders[:date_delivery_expected]}</date_delivery_expected>
        <total_te>#{supply_orders[:total_te]}</total_te>
        <total_with_discount_te>#{supply_orders[:total_with_discount_te]}</total_with_discount_te>
        <total_ti>#{supply_orders[:total_ti]}</total_ti>
        <total_tax>#{supply_orders[:total_tax]}</total_tax>
        <discount_rate>#{supply_orders[:discount_rate]}</discount_rate>
        <discount_value_te>#{supply_orders[:discount_value_te]}</discount_value_te>
        <is_template>#{supply_orders[:is_template]}</is_template>
        <date_add>#{supply_orders[:date_add]}</date_add>
        <date_upd>#{supply_orders[:date_upd]}</date_upd>
        <associations>
          <supply_order_details>
            <supply_order_detail>
              <id>#{supply_orders[:supply_order_detail_id]}</id>
              <id_product>#{supply_orders[:supply_order_detail_id_product]}</id_product>
              <id_product_attribute>#{supply_orders[:supply_order_detail_id_product_attribute]}</id_product_attribute>
              <supplier_reference>#{supply_orders[:supply_order_detail_supplier_reference]}</supplier_reference>
              <product_name>#{supply_orders[:supply_order_detail_product_name]}</product_name>
            </supply_order_detail>
          </supply_order_details>
          </associations>
        </supply_order>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.update_supply_orders(id,supply_orders)
    sup = HTTParty.put("#{@api_url}supply_orders/#{id}",
    {
      body:
      "<prestashop>
        <supply_order>
        <id>#{id}</id>
        <id_supplier>#{supply_orders[:id_supplier]}</id_supplier>
        <id_lang>#{supply_orders[:id_lang]}</id_lang>
        <id_warehouse>#{supply_orders[:id_warehouse]}</id_warehouse>
        <id_supply_order_state>#{supply_orders[:id_supply_order_state]}</id_supply_order_state>
        <id_currency>#{supply_orders[:id_currency]}</id_currency>
        <supplier_name>#{supply_orders[:supplier_name]}</supplier_name>
        <reference>#{supply_orders[:reference]}</reference>
        <date_delivery_expected>#{supply_orders[:date_delivery_expected]}</date_delivery_expected>
        <total_te>#{supply_orders[:total_te]}</total_te>
        <total_with_discount_te>#{supply_orders[:total_with_discount_te]}</total_with_discount_te>
        <total_ti>#{supply_orders[:total_ti]}</total_ti>
        <total_tax>#{supply_orders[:total_tax]}</total_tax>
        <discount_rate>#{supply_orders[:discount_rate]}</discount_rate>
        <discount_value_te>#{supply_orders[:discount_value_te]}</discount_value_te>
        <is_template>#{supply_orders[:is_template]}</is_template>
        <date_add>#{supply_orders[:date_add]}</date_add>
        <date_upd>#{supply_orders[:date_upd]}</date_upd>
        <associations>
          <supply_order_details>
            <supply_order_detail>
              <id>#{supply_orders[:supply_order_detail_id]}</id>
              <id_product>#{supply_orders[:supply_order_detail_id_product]}</id_product>
              <id_product_attribute>#{supply_orders[:supply_order_detail_id_product_attribute]}</id_product_attribute>
              <supplier_reference>#{supply_orders[:supply_order_detail_supplier_reference]}</supplier_reference>
              <product_name>#{supply_orders[:supply_order_detail_product_name]}</product_name>
            </supply_order_detail>
          </supply_order_details>
          </associations>
        </supply_order>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
    })
    puts sup.body,sup.code
  end

  def self.get_supply_orders(id)
    sup = HTTParty.get("#{@api_url}supply_orders/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_orders(id)
    sup = HTTParty.delete("#{@api_url}supply_orders/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
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

    
    ##### TAX RULE GROUPS ############################################################################################################################################

    def self.post_tax_rule_group(tax_rule_group)
      t = HTTParty.post("#{@api_url}tax_rule_groups/",
      {
        body:
        "<prestashop>
          <tax_rule_group>
            <id></id>
            <name>#{tax_rule_group[:name]}</name>
            <active>#{tax_rule_group[:active]}</active>
            <deleted>#{tax_rule_group[:deleted]}</deleted>
            <date_add>#{tax_rule_group[:date_add]}</date_add>
            <date_upd>#{tax_rule_group[:date_upd]}</date_upd>
          </tax_rule_group>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end



    def self.update_tax_rule_group(id,tax_rule_group)
      t = HTTParty.put("#{@api_url}tax_rule_groups/#{id}",
      {
        body:
        "<prestashop>
          <tax_rule_group>
            <id>#{id}</id>
            <name>#{tax_rule_group[:name]}</name>
            <active>#{tax_rule_group[:active]}</active>
            <deleted>#{tax_rule_group[:deleted]}</deleted>
            <date_add>#{tax_rule_group[:date_add]}</date_add>
            <date_upd>#{tax_rule_group[:date_upd]}</date_upd>
          </tax_rule_group>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.get_tax_rule_group(id)
      t = HTTParty.get("#{@api_url}tax_rule_groups/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_tax_rule_group(id)
      t = HTTParty.delete("#{@api_url}tax_rule_groups/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end



    ##### TAX RULES ##################################################################################################################################################

    def self.post_tax_rule(tax_rule)
      t = HTTParty.post("#{@api_url}tax_rules/",
      {
        body:
        "<prestashop>
          <tax_rule>
            <id></id>
            <id_tax_rules_group>#{tax_rule[:id_tax_rules_group]}</id_tax_rules_group>
            <id_state>#{tax_rule[:id_state]}</id_state>
            <id_country>#{tax_rule[:id_country]}</id_country>
            <zipcode_from>#{tax_rule[:zipcode_from]}</zipcode_from>
            <zipcode_to>#{tax_rule[:zipcode_to]}</zipcode_to>
            <id_tax>#{tax_rule[:id_tax]}</id_tax>
            <behavior>#{tax_rule[:behavior]}</behavior>
            <description>#{tax_rule[:description]}</description>
          </tax_rule>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.update_tax_rule(id,tax_rule)
      t = HTTParty.put("#{@api_url}tax_rules/#{id}",
      {
        body:
        "<prestashop>
          <tax_rule>
            <id>#{id}</id>
            <id_tax_rules_group>#{tax_rule[:id_tax_rules_group]}</id_tax_rules_group>
            <id_state>#{tax_rule[:id_state]}</id_state>
            <id_country>#{tax_rule[:id_country]}</id_country>
            <zipcode_from>#{tax_rule[:zipcode_from]}</zipcode_from>
            <zipcode_to>#{tax_rule[:zipcode_to]}</zipcode_to>
            <id_tax>#{tax_rule[:id_tax]}</id_tax>
            <behavior>#{tax_rule[:behavior]}</behavior>
            <description>#{tax_rule[:description]}</description>
          </tax_rule>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.get_tax_rule(id)
      t = HTTParty.get("#{@api_url}tax_rules/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_tax_rule(id)
      t = HTTParty.delete("#{@api_url}tax_rules/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    ##### TAXES ######################################################################################################################################################

    def self.post_tax(tax)
      t = HTTParty.post("#{@api_url}taxes/",
      {
        body:
        "<prestashop>
          <tax>
            <id></id>
            <rate>#{tax[:rate]}</rate>
            <active>#{tax[:active]}</active>
            <deleted>#{tax[:deleted]}</deleted>
            <name>
            <language id=\"1\">#{tax[:name]}</language>
            </name>
          </tax>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.update_tax(id,tax)
      t = HTTParty.put("#{@api_url}taxes/#{id}",
      {
        body:
        "<prestashop>
          <tax>
            <id>#{id}</id>
            <rate>#{tax[:rate]}</rate>
            <active>#{tax[:active]}</active>
            <deleted>#{tax[:deleted]}</deleted>
            <name>
            <language id=\"1\">#{tax[:name]}</language>
            </name>
          </tax>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.get_tax(id)
      t = HTTParty.get("#{@api_url}taxes/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_tax(id)
      t = HTTParty.delete("#{@api_url}taxes/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    ##### TRANSLATED CONFIGURATION ####################################################################################################################################################

    def self.post_translated_configurations(translated_configurations)
      t = HTTParty.post("#{@api_url}translated_configurations/",
      {
        body:
        "<prestashop>
          <translated_configuration>
            <id></id>
            <value>
            <language id=\"1\">#{translated_configurations[:value]}</language>
            </value>
            <date_add>#{translated_configurations[:date_add]}</date_add>
            <date_upd>#{translated_configurations[:date_upd]}</date_upd>
            <name>#{translated_configurations[:name]}</name>
            <id_shop_group>#{translated_configurations[:id_shop_group]}</id_shop_group>
            <id_shop>#{translated_configurations[:id_shop]}</id_shop>
          </translated_configuration>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.update_translated_configurations(id,translated_configurations)
      t = HTTParty.put("#{@api_url}translated_configurations/#{id}",
      {
        body:
        "<prestashop>
          <translated_configuration>
            <id>#{id}</id>
            <value>
            <language id=\"1\">#{translated_configurations[:value]}</language>
            </value>
            <date_add>#{translated_configurations[:date_add]}</date_add>
            <date_upd>#{translated_configurations[:date_upd]}</date_upd>
            <name>#{translated_configurations[:name]}</name>
            <id_shop_group>#{translated_configurations[:id_shop_group]}</id_shop_group>
            <id_shop>#{translated_configurations[:id_shop]}</id_shop>
          </translated_configuration>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts t.body,t.code
    end

    def self.get_translated_configurations(id)
      t = HTTParty.get("#{@api_url}translated_configurations/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_translated_configurations(id)
      t = HTTParty.delete("#{@api_url}translated_configurations/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end
 
     ##### WAREHOUSE PRODUCT LOCATION ####################################################################################################################################################

     def self.post_warehouse_product_locations(warehouse_product_location)
      war = HTTParty.post("#{@api_url}warehouse_product_locations/",
      {
        body:
        "<prestashop>
          <warehouse_product_location>
            <id></id>
            <id_product>#{warehouse_product_location[:id_product]}</id_product>
            <id_product_attribute>#{warehouse_product_location[:id_product_attribute]}</id_product_attribute>
            <id_warehouse>#{warehouse_product_location[:id_warehouse]}</id_warehouse>
            <location>#{warehouse_product_location[:location]}</location>
          </warehouse_product_location>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts war.body,war.code
    end

    def self.update_warehouse_product_locations(id,warehouse_product_location)
      war = HTTParty.put("#{@api_url}warehouse_product_locations/#{id}",
      {
        body:
        "<prestashop>
          <warehouse_product_location>
            <id>#{id}</id>
            <id_product>#{warehouse_product_location[:id_product]}</id_product>
            <id_product_attribute>#{warehouse_product_location[:id_product_attribute]}</id_product_attribute>
            <id_warehouse>#{warehouse_product_location[:id_warehouse]}</id_warehouse>
            <location>#{warehouse_product_location[:location]}</location>
          </warehouse_product_location>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts war.body,war.code
    end

    def self.get_warehouse_product_locations(id)
      war = HTTParty.get("#{@api_url}warehouse_product_locations/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

    def self.delete_warehouse_product_locations(id)
      war = HTTParty.delete("#{@api_url}warehouse_product_locations/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

    ##### WAREHOUSES ####################################################################################################################################################################

    def self.post_warehouse(warehouse)
      war = HTTParty.post("#{@api_url}warehouses/",
      {
        body:
        "<prestashop>
          <warehouse>
            <id></id>
            <id_address>#{warehouse[:id_address]}</id_address>
            <id_employee>#{warehouse[:id_employee]}</id_employee>
            <id_currency>#{warehouse[:id_currency]}</id_currency>
            <deleted>#{warehouse[:deleted]}</deleted>
            <reference>#{warehouse[:reference]}</reference>
            <name>#{warehouse[:name]}</name>
            <management_type>#{warehouse[:management_type]}</management_type>
            <associations>
              <stocks>
                <stock>
                  <id>#{warehouse[:stock_id]}</id>
                </stock>
              </stocks>
              <carriers>
                <carrier>
                  <id>#{warehouse[:carrier_id]}</id>
                </carrier>
              </carriers>
              <shops>
                <shop>
                  <id>#{warehouse[:shop_id]}</id>
                  <name>#{warehouse[:shop_name]}</name>
                </shop>
              </shops>
            </associations>
          </warehouse>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts war.body,war.code
    end

    def self.update_warehouse(id,warehouse)
      war = HTTParty.put("#{@api_url}warehouses/#{id}",
      {
        body:
        "<prestashop>
          <warehouse>
            <id>#{id}</id>
            <id_address>#{warehouse[:id_address]}</id_address>
            <id_employee>#{warehouse[:id_employee]}</id_employee>
            <id_currency>#{warehouse[:id_currency]}</id_currency>
            <deleted>#{warehouse[:deleted]}</deleted>
            <reference>#{warehouse[:reference]}</reference>
            <name>#{warehouse[:name]}</name>
            <management_type>#{warehouse[:management_type]}</management_type>
            <associations>
              <stocks>
                <stock>
                  <id>#{warehouse[:stock_id]}</id>
                </stock>
              </stocks>
              <carriers>
                <carrier>
                  <id>#{warehouse[:carrier_id]}</id>
                </carrier>
              </carriers>
              <shops>
                <shop>
                  <id>#{warehouse[:shop_id]}</id>
                  <name>#{warehouse[:shop_name]}</name>
                </shop>
              </shops>
            </associations>
          </warehouse>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts war.body,war.code
    end

    def self.get_warehouse(id)
      war = HTTParty.get("#{@api_url}warehouses/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

    def self.delete_warehouse(id)
      war = HTTParty.delete("#{@api_url}warehouses/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

   
    ##### WEIGHT RANGES #################################################################################################################################################################

    def self.post_weight_range(weight_range)
      w = HTTParty.post("#{@api_url}weight_ranges/",
      {
        body:
        "<prestashop>
          <weight_range>
            <id></id>
            <id_carrier>#{weight_range[:id_carrier]}</id_carrier>
            <delimiter1>#{weight_range[:delimiter1]}</delimiter1>
            <delimiter2>#{weight_range[:delimiter2]}</delimiter2>
          </weight_range>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts w.body,w.code
    end

    def self.update_weight_range(id,weight_range)
      w = HTTParty.put("#{@api_url}weight_ranges/#{id}",
      {
        body:
        "<prestashop>
          <weight_range>
            <id>#{id}</id>
            <id_carrier>#{weight_range[:id_carrier]}</id_carrier>
            <delimiter1>#{weight_range[:delimiter1]}</delimiter1>
            <delimiter2>#{weight_range[:delimiter2]}</delimiter2>
          </weight_range>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts w.body,w.code
    end

    def self.get_weight_range(id)
      w = HTTParty.get("#{@api_url}weight_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts w.body,w.code
    end

    def self.delete_weight_range(id)
      w = HTTParty.delete("#{@api_url}weight_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts w.body,w.code
    end

    ##### ZONES #########################################################################################################################################################################
    
    def self.post_zone(zone)
      z = HTTParty.post("#{@api_url}zones/",
      {
        body:
        "<prestashop>
          <zone>
            <id></id>
            <name>#{zone[:name]}</name>
            <active>#{zone[:active]}</active>
          </zone>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts z.body,z.code
    end

    def self.update_zone(id,zone)
      z = HTTParty.put("#{@api_url}zones/#{id}",
      {
        body:
        "<prestashop>
          <zone>
            <id>#{id}</id>
            <name>#{zone[:name]}</name>
            <active>#{zone[:active]}</active>
          </zone>
        </prestashop>",
        basic_auth: @auth,
        header: {
          "Content-Type" => 'text/xml',
          "charset" => 'utf-8'
        }
      })
      puts z.body,z.code
    end

    def self.get_zone(id,zone)
      z = HTTParty.get("#{@api_url}zones/#{id}",
      {
        basic_auth: @auth
      })
      puts z.body,z.code
    end

    def self.delete_zone(id,zone)
      z = HTTParty.delete("#{@api_url}zones/#{id}",
      {
        basic_auth: @auth
      })
      puts z.body,z.code
    end


    #####################################################################################################################################################################################

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
      img = HTTParty.post("#{@api_url}images/products",
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



#add, edit, delete, get addresses
# Presta.post_address($address)
#Presta.update_address(7,$address)
#Presta.getaddresses(7)
# Presta.delete_address(7)

#add, edit, delete, get contacts
# Presta.post_contact($contact)
# Presta.update_contact(3,$contact)
# Presta.get_contact(3)
# Presta.delete_contact(3)

#add, edit, delete, get configurations
# Presta.post_configuration($configuration)
# Presta.update_configuration(435,$configuration)
# Presta.get_configuration(435)
# Presta.delete_configuration(435)

#add, edit, delete, get carriers
# Presta.post_carriers($carrier)
# Presta.update_carriers(5,$carrier)
# Presta.get_carriers(5)
# Presta.delete_carriers(5)

#add, edit, delete, get cart rules
# Presta.post_cart_rules($cart_rule)
# Presta.update_cart_rules(1,$cart_rule)
# Presta.get_cart_rules(1)
# Presta.delete_cart_rules(1)


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

#add, edit, delete, get employees
#Presta.post_employee($employee)

#add, edit, delete, get cart
#Presta.post_carts($cart)
#Presta.update_carts(14,$cart)
#Presta.delete_carts(6)
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
# Presta.post_product($product)
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
#Presta.delete_product_suppliers(71)

 #add, edit, delete, get taxes
#  Presta.post_tax($tax)
# Presta.update_tax(53,$tax)
# Presta.get_tax(53)
# Presta.delete_tax(53)


 #add, edit, delete, get tax rules
# Presta.post_tax_rule($tax_rule)
# Presta.update_tax_rule(53,$tax_rule)
# Presta.get_tax_rule(53)
# Presta.delete_tax_rule(53)

 #add, edit, delete, get tax rule groups
#  Presta.post_tax_rule_group($tax_rule_group)
# Presta.update_tax_rule_group(53,$tax_rule_group)
# Presta.get_tax_rule_group(53)
# Presta.delete_tax_rule_group(53)


 #add, edit, delete, get translated configurations
#  Presta.post_translated_configurations($translated_configurations)
# Presta.update_translated_configurations(432,$translated_configurations)
# Presta.get_translated_configurations(432)
#Presta.delete_translated_configurations(433)

#Presta.post_stock_availables($stock_available)

Presta.post_address(**($address))


# Presta.change_image_api()

#Presta.post_product_image(22)