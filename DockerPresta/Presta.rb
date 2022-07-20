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

    def self.getaddresses(id:)
        address = HTTParty.get("#{@api_url}addresses/#{id}", basic_auth: @auth )
        puts address.body,address.code
    end

    def self.delete_address(id:)
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

    def self.delete_attachments(id:)
      attach = HTTParty.delete("#{@api_url}attachments/#{id}",
      {
          basic_auth: @auth
      })
      puts attach.body, attach.code
    end

    def self.get_attachments(id:)
      attach = HTTParty.get("#{@api_url}attachments/#{id}",
      {
          basic_auth: @auth
      })
      puts attach.body, attach.code
    end

    ##### CARRIERS ####################################################################################################################################################

    def self.post_carriers(
      deleted:0,
      is_module:0,
      id_tax_rules_group:0,
      id_reference:0,
      name:,
      active:,
      is_free:0,
      url:'',
      shipping_handling:0,
      shipping_external:0,
      range_behavior:0,
      shipping_method:0,
      max_width:0,
      max_height:0,
      max_depth:0,
      max_weight:0,
      grade:0,
      external_module_name:'',
      need_range:0,
      position:0,
      delay:
    )
      carr = HTTParty.post("#{@api_url}carriers/",
      {
          body:
          "<prestashop>
            <carrier>
              <id></id>
              <deleted>#{deleted}</deleted>
              <is_module>#{is_module}</is_module>
              <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
              <id_reference>#{id_reference}</id_reference>
              <name>#{name}</name>
              <active>#{active}</active>
              <is_free>#{is_free}</is_free>
              <url>#{url}</url>
              <shipping_handling>#{shipping_handling}</shipping_handling>
              <shipping_external>#{shipping_external}</shipping_external>
              <range_behavior>#{range_behavior}</range_behavior>
              <shipping_method>#{shipping_method}</shipping_method>
              <max_width>#{max_width}</max_width>
              <max_height>#{max_height}</max_height>
              <max_depth>#{max_depth}</max_depth>
              <max_weight>#{max_weight}</max_weight>
              <grade>#{grade}</grade>
              <external_module_name>#{external_module_name}</external_module_name>
              <need_range>#{need_range}</need_range>
              <position>#{position}</position>
              <delay>
               <language id=\"1\">#{delay}</language>
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

    def self.update_carriers(
      id:,
      deleted:0,
      is_module:0,
      id_tax_rules_group:0,
      id_reference:0,
      name:,
      active:,
      is_free:0,
      url:'',
      shipping_handling:0,
      shipping_external:0,
      range_behavior:0,
      shipping_method:0,
      max_width:0,
      max_height:0,
      max_depth:0,
      max_weight:0,
      grade:0,
      external_module_name:'',
      need_range:0,
      position:0,
      delay:
    )
      carr = HTTParty.put("#{@api_url}carriers/#{id}",
      {
          body:
          "<prestashop>
          <carrier>
            <id>#{id}</id>
            <deleted>#{deleted}</deleted>
            <is_module>#{is_module}</is_module>
            <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
            <id_reference>#{id_reference}</id_reference>
            <name>#{name}</name>
            <active>#{active}</active>
            <is_free>#{is_free}</is_free>
            <url>#{url}</url>
            <shipping_handling>#{shipping_handling}</shipping_handling>
            <shipping_external>#{shipping_external}</shipping_external>
            <range_behavior>#{range_behavior}</range_behavior>
            <shipping_method>#{shipping_method}</shipping_method>
            <max_width>#{max_width}</max_width>
            <max_height>#{max_height}</max_height>
            <max_depth>#{max_depth}</max_depth>
            <max_weight>#{max_weight}</max_weight>
            <grade>#{grade}</grade>
            <external_module_name>#{external_module_name}</external_module_name>
            <need_range>#{need_range}</need_range>
            <position>#{position}</position>
            <delay>
             <language id=\"1\">#{delay}</language>
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

    def self.get_carriers(id:)
      carr = HTTParty.get("#{@api_url}carriers/#{id}",
      {
          basic_auth: @auth
      })
      puts carr.body,carr.code
    end

    def self.delete_carriers(id:)
      carr = HTTParty.delete("#{@api_url}carriers/#{id}",
      {
          basic_auth: @auth 
      })
      puts carr.body,carr.code
    end

    ##### CART RULES ###################################################################################################################################################

    def self.post_cart_rules(
      id_customer:0,
      date_from:,
      date_to:,
      description:"",
      quantity:0,
      quantity_per_user:0,
      priority:0,
      partial_use:0,
      code:"",
      minimum_amount:0,
      minimum_amount_tax:0,
      minimum_amount_currency:0,
      minimum_amount_shipping:0,
      country_restriction:0,
      carrier_restriction:0,
      group_restriction:0,
      cart_rule_restriction:0,
      product_restriction:0,
      shop_restriction:0,
      free_shipping:0,
      reduction_percent:0,
      reduction_amount:0,
      reduction_tax:0,
      reduction_currency:0,
      reduction_product:0,
      reduction_exclude_special:0,
      gift_product:0,
      gift_product_attribute:0,
      highlight:0,
      active:0,
      date_add:"",
      date_upd:"",
      name:,
    )
      cart = HTTParty.post("#{@api_url}cart_rules/",
      {
          body:
          "<prestashop>
            <cart_rule>
              <id></id>
              <id_customer>#{id_customer}</id_customer>
              <date_from>#{date_from}</date_from>
              <date_to>#{date_to}</date_to>
              <description>#{description}</description>
              <quantity>#{quantity}</quantity>
              <quantity_per_user>#{quantity_per_user}</quantity_per_user>
              <priority>#{priority}</priority>
              <partial_use>#{partial_use}</partial_use>
              <code>#{code}</code>
              <minimum_amount>#{minimum_amount}</minimum_amount>
              <minimum_amount_tax>#{minimum_amount_tax}</minimum_amount_tax>
              <minimum_amount_currency>#{minimum_amount_currency}</minimum_amount_currency>
              <minimum_amount_shipping>#{minimum_amount_shipping}</minimum_amount_shipping>
              <country_restriction>#{country_restriction}</country_restriction>
              <carrier_restriction>#{carrier_restriction}</carrier_restriction>
              <group_restriction>#{group_restriction}</group_restriction>
              <cart_rule_restriction>#{cart_rule_restriction}</cart_rule_restriction>
              <product_restriction>#{product_restriction}</product_restriction>
              <shop_restriction>#{shop_restriction}</shop_restriction>
              <free_shipping>#{free_shipping}</free_shipping>
              <reduction_percent>#{reduction_percent}</reduction_percent>
              <reduction_amount>#{reduction_amount}</reduction_amount>
              <reduction_tax>#{reduction_tax}</reduction_tax>
              <reduction_currency>#{reduction_currency}</reduction_currency>
              <reduction_product>#{reduction_product}</reduction_product>
              <reduction_exclude_special>#{reduction_exclude_special}</reduction_exclude_special>
              <gift_product>#{gift_product}</gift_product>
              <gift_product_attribute>#{gift_product_attribute}</gift_product_attribute>
              <highlight>#{highlight}</highlight>
              <active>#{active}</active>
              <date_add>#{date_add}</date_add>
              <date_upd>#{date_upd}</date_upd>
              <name>
                <language id=\"1\">#{name}</language>
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

    def self.update_cart_rules(
      id:,
      id_customer:0,
      date_from:,
      date_to:,
      description:"",
      quantity:0,
      quantity_per_user:0,
      priority:0,
      partial_use:0,
      code:"",
      minimum_amount:0,
      minimum_amount_tax:0,
      minimum_amount_currency:0,
      minimum_amount_shipping:0,
      country_restriction:0,
      carrier_restriction:0,
      group_restriction:0,
      cart_rule_restriction:0,
      product_restriction:0,
      shop_restriction:0,
      free_shipping:0,
      reduction_percent:0,
      reduction_amount:0,
      reduction_tax:0,
      reduction_currency:0,
      reduction_product:0,
      reduction_exclude_special:0,
      gift_product:0,
      gift_product_attribute:0,
      highlight:0,
      active:0,
      date_add:"",
      date_upd:"",
      name:,
    )
      cart = HTTParty.put("#{@api_url}cart_rules/#{id}",
      {
          body:
          "<prestashop>
          <cart_rule>
            <id>#{id}</id>
            <id_customer>#{id_customer}</id_customer>
            <date_from>#{date_from}</date_from>
            <date_to>#{date_to}</date_to>
            <description>#{description}</description>
            <quantity>#{quantity}</quantity>
            <quantity_per_user>#{quantity_per_user}</quantity_per_user>
            <priority>#{priority}</priority>
            <partial_use>#{partial_use}</partial_use>
            <code>#{code}</code>
            <minimum_amount>#{minimum_amount}</minimum_amount>
            <minimum_amount_tax>#{minimum_amount_tax}</minimum_amount_tax>
            <minimum_amount_currency>#{minimum_amount_currency}</minimum_amount_currency>
            <minimum_amount_shipping>#{minimum_amount_shipping}</minimum_amount_shipping>
            <country_restriction>#{country_restriction}</country_restriction>
            <carrier_restriction>#{carrier_restriction}</carrier_restriction>
            <group_restriction>#{group_restriction}</group_restriction>
            <cart_rule_restriction>#{cart_rule_restriction}</cart_rule_restriction>
            <product_restriction>#{product_restriction}</product_restriction>
            <shop_restriction>#{shop_restriction}</shop_restriction>
            <free_shipping>#{free_shipping}</free_shipping>
            <reduction_percent>#{reduction_percent}</reduction_percent>
            <reduction_amount>#{reduction_amount}</reduction_amount>
            <reduction_tax>#{reduction_tax}</reduction_tax>
            <reduction_currency>#{reduction_currency}</reduction_currency>
            <reduction_product>#{reduction_product}</reduction_product>
            <reduction_exclude_special>#{reduction_exclude_special}</reduction_exclude_special>
            <gift_product>#{gift_product}</gift_product>
            <gift_product_attribute>#{gift_product_attribute}</gift_product_attribute>
            <highlight>#{highlight}</highlight>
            <active>#{active}</active>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <name>
              <language id=\"1\">#{name}</language>
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

    def self.get_cart_rules(id:)
      cart = HTTParty.get("#{@api_url}cart_rules/#{id}",
      {
          basic_auth: @auth  
      })
      puts cart.body,cart.code
    end

    def self.delete_cart_rules(id:)
      cart = HTTParty.delete("#{@api_url}cart_rules/#{id}",
      {
          basic_auth: @auth  
      })
      puts cart.body,cart.code
    end

    ##### CARTS ##########################################################################################################################################################

    def self.post_carts(
        id_address_delivery: 0,
        id_address_invoice: 0,
        id_currency:,
        id_customer: 0,
        id_guest: 0,
        id_lang:,
        id_shop_group: 1,
        id_shop: 1,
        id_carrier: 0,
        recyclable: 0,
        gift: 0,
        gift_message: "",
        mobile_theme: 0,
        delivery_option: "",
        secure_key: "",
        allow_seperated_package: 0,
        date_add: "",
        date_upd: "",
        id_product: 0,
        id_product_attribute: 0,
        id_address_delivery1: 0,
        id_customization: 0,
        quantity: 0
    )
      cart = HTTParty.post("#{@api_url}carts/",
      {
          body:
          "<prestashop>
            <cart>
              <id/>
              <id_address_delivery>#{id_address_delivery}</id_address_delivery>
              <id_address_invoice>#{id_address_invoice}</id_address_invoice>
              <id_currency>#{id_currency}</id_currency>
              <id_customer>#{id_customer}</id_customer>
              <id_guest>#{id_guest}</id_guest>
              <id_lang>#{id_lang}</id_lang>
              <id_carrier>#{id_carrier}</id_carrier>
              <recyclable>#{recyclable}</recyclable>
              <gift>#{gift}</gift>
              <gift_message>#{gift_message}</gift_message>
              <associations>
                <cart_rows>
                <cart_row>
              <id_product>#{id_product}</id_product>
              <id_product_attribute>#{id_product_attribute}</id_product_attribute>
              <quantity>#{quantity}</quantity>
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

    def self.update_carts(
        id:,
        id_address_delivery: 0,
        id_address_invoice: 0,
        id_currency:,
        id_customer: 0,
        id_guest: 0,
        id_lang:,
        id_shop_group: 1,
        id_shop: 1,
        id_carrier: 0,
        recyclable: 0,
        gift: 0,
        gift_message: "",
        mobile_theme: 0,
        delivery_option: "",
        secure_key: "",
        allow_seperated_package: 0,
        date_add: "",
        date_upd: "",
        id_product: 0,
        id_product_attribute: 0,
        id_address_delivery1: 0,
        id_customization: 0,
        quantity: 0
    )
      cart = HTTParty.put("#{@api_url}carts/#{id}",
      {
          body:
          "<prestashop>
          <cart>
            <id>#{id}<id/>
            <id_address_delivery>#{id_address_delivery}</id_address_delivery>
            <id_address_invoice>#{id_address_invoice}</id_address_invoice>
            <id_currency>#{id_currency}</id_currency>
            <id_customer>#{id_customer}</id_customer>
            <id_guest>#{id_guest}</id_guest>
            <id_lang>#{id_lang}</id_lang>
            <id_carrier>#{id_carrier}</id_carrier>
            <recyclable>#{recyclable}</recyclable>
            <gift>#{gift}</gift>
            <gift_message>#{gift_message}</gift_message>
            <associations>
              <cart_rows>
              <cart_row>
            <id_product>#{id_product}</id_product>
            <id_product_attribute>#{id_product_attribute}</id_product_attribute>
            <quantity>#{quantity}</quantity>
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

    def self.delete_carts(id:)
        carts = HTTParty.delete("#{@api_url}carts/#{id}",
        {
            basic_auth: @auth
        })
        puts carts.body,carts.code
    end

    def self.get_carts(id:)
      carts = HTTParty.get("#{@api_url}carts/#{id}",
      {
          basic_auth: @auth
      })
      puts carts.body,carts.code
    end


    ##### CATEGORIES ######################################################################################################################################################

    def self.post_categories(
        id_parent:0,
        active:,
        id_shop_default: 1,
        is_root_category: 0,
        position: 0,
        date_add: "",
        date_upd:"",
        name:,
        link_rewrite:,
        description:"",
        meta_title:"",
        meta_description:"",
        meta_keywords:"",
        id_category: 0,
        id_product:0
    )
      cat = HTTParty.post("#{@api_url}categories/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <category>
              <id></id>
              <id_parent>#{id_parent}</id_parent>
              <active>#{active}</active>
              <id_shop_default>#{id_shop_default}</id_shop_default>
              <is_root_category>#{is_root_category}</is_root_category>
              <position>#{position}</position>
              <date_add>#{date_add}</date_add>
              <date_upd>#{date_upd}</date_upd>
              <name>
                <language id=\"1\">#{name}</language>
              </name>
              <link_rewrite>
                <language id=\"1\">#{link_rewrite}</language>
              </link_rewrite>
              <description>
                <language id=\"1\">#{description}</language>
              </description>
              <meta_title>
                <language id=\"1\">#{meta_title}</language>
              </meta_title>
              <meta_description>
                <language id=\"1\">#{meta_description}</language>
              </meta_description>
              <meta_keywords>
                <language id=\"1\">#{meta_keywords}</language>
              </meta_keywords>
              <associations>
                <categories>
                  <category>
                    <id>#{id_category}</id>
                  </category>
                </categories>
                <products>
                  <product>
                    <id>#{id_product}</id>
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

    def self.update_categories(
      id:,
      id_parent:0,
      active:,
      id_shop_default: 1,
      is_root_category: 0,
      position: 0,
      date_add: "",
      date_upd:"",
      name:,
      link_rewrite:,
      description:"",
      meta_title:"",
      meta_description:"",
      meta_keywords:"",
      id_category: 0,
      id_product:0
    )
      cat = HTTParty.put("#{@api_url}categories/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <category>
            <id>#{id}</id>
            <id_parent>#{id_parent}</id_parent>
            <active>#{active}</active>
            <id_shop_default>#{id_shop_default}</id_shop_default>
            <is_root_category>#{is_root_category}</is_root_category>
            <position>#{position}</position>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <name>
              <language id=\"1\">#{name}</language>
            </name>
            <link_rewrite>
              <language id=\"1\">#{link_rewrite}</language>
            </link_rewrite>
            <description>
              <language id=\"1\">#{description}</language>
            </description>
            <meta_title>
              <language id=\"1\">#{meta_title}</language>
            </meta_title>
            <meta_description>
              <language id=\"1\">#{meta_description}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{meta_keywords}</language>
            </meta_keywords>
            <associations>
              <categories>
                <category>
                  <id>#{id_category}</id>
                </category>
              </categories>
              <products>
                <product>
                  <id>#{id_product}</id>
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

    def self.delete_categories(id:)
      cat = HTTParty.delete("#{@api_url}categories/#{id}",
      {
        basic_auth: @auth
      })
      puts cat.body,cat.code
    end

    def self.get_categories(id:)
      cat = HTTParty.get("#{@api_url}categories/#{id}",
      {
        basic_auth: @auth
      })
      puts cat.body,cat.code
    end



    ##### COMBINATIONS ###############################################################################################################################################

    def self.post_combinations(
      id_product:,
      location:"",
      ean13: "",
      isbn:"",
      upc:"",
      mpn:"",
      quantity:0,
      reference: "",
      supplier_reference: "",
      wholesale_price: 0,
      price: 0,
      ecotax: 0,
      weight: 0,
      unit_price_impact: 0.000000,
      minimal_quantity:,
      low_stock_threshold:0,
      low_stock_alert: 0,
      default_on:0,
      available_date: "",
      id_product_option_value: 0,
      id_image: 0
    )
      comb = HTTParty.post("#{@api_url}combinations/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <combination>
            <id></id>
            <id_product>#{id_product}</id_product>
            <location>#{location}</location>
            <ean13>#{ean13}</ean13>
            <isbn>#{isbn}</isbn>
            <upc>#{upc}</upc>
            <mpn>#{mpn}</mpn>
            <quantity>#{quantity}</quantity>
            <reference>#{reference}</reference>
            <supplier_reference>#{supplier_reference}</supplier_reference>
            <wholesale_price>#{wholesale_price}</wholesale_price>
            <price>#{price}</price>
            <ecotax>#{ecotax}</ecotax>
            <weight>#{weight}</weight>
            <unit_price_impact>#{unit_price_impact}</unit_price_impact>
            <minimal_quantity>#{minimal_quantity}</minimal_quantity>
            <low_stock_threshold>#{low_stock_threshold}</low_stock_threshold>
            <low_stock_alert>#{low_stock_alert}</low_stock_alert>
            <default_on>#{default_on}</default_on>
            <available_date>#{available_date}</available_date>
            <associations>
              <product_option_values>
                <product_option_value>
                  <id>#{id_product_option_value}</id>
                </product_option_value>
              </product_option_values>
              <images>
                <image>
                  <id>#{id_image}</id>
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

  def self.update_combinations(
      id:,
      id_product:,
      location:"",
      ean13: "",
      isbn:"",
      upc:"",
      mpn:"",
      quantity:0,
      reference: "",
      supplier_reference: "",
      wholesale_price: 0,
      price: 0,
      ecotax: 0,
      weight: 0,
      unit_price_impact: 0.000000,
      minimal_quantity:,
      low_stock_threshold:0,
      low_stock_alert: 0,
      default_on:0,
      available_date: "",
      id_product_option_value: 0,
      id_image: 0
  )
    comb = HTTParty.put("#{@api_url}combinations/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <combination>
          <id>#{id}</id>
          <id_product>#{id_product}</id_product>
          <location>#{location}</location>
          <ean13>#{ean13}</ean13>
          <isbn>#{isbn}</isbn>
          <upc>#{upc}</upc>
          <mpn>#{mpn}</mpn>
          <quantity>#{quantity}</quantity>
          <reference>#{reference}</reference>
          <supplier_reference>#{supplier_reference}</supplier_reference>
          <wholesale_price>#{wholesale_price}</wholesale_price>
          <price>#{price}</price>
          <ecotax>#{ecotax}</ecotax>
          <weight>#{weight}</weight>
          <unit_price_impact>#{unit_price_impact}</unit_price_impact>
          <minimal_quantity>#{minimal_quantity}</minimal_quantity>
          <low_stock_threshold>#{low_stock_threshold}</low_stock_threshold>
          <low_stock_alert>#{low_stock_alert}</low_stock_alert>
          <default_on>#{default_on}</default_on>
          <available_date>#{available_date}</available_date>
          <associations>
            <product_option_values>
              <product_option_value>
                <id>#{id_product_option_value}</id>
              </product_option_value>
            </product_option_values>
            <images>
              <image>
                <id>#{id_image}</id>
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

  def self.delete_combinations(id:)
    comb = HTTParty.delete("#{@api_url}combinations/#{id}",
    {
      basic_auth: @auth
    })
  puts comb.body,comb.code
  end

  def self.get_combinations(id:)
    comb = HTTParty.get("#{@api_url}combinations/#{id}",
    {
      basic_auth: @auth
    })
  puts comb.body,comb.code
  end

  ##### CONFIGURATIONS #############################################################################################################################################
   
  def self.post_configuration(
        value:0,
        name:,
        id_shop_group: 1,
        id_shop:1,
        date_add:"",
        date_upd:""
  )
    conf = HTTParty.post("#{@api_url}configurations/",
        {
            body: 
            "<prestashop>
              <configuration>
                <id></id>
                <value>#{value}</value>
                <name>#{name}</name>
                <id_shop_group>#{id_shop_group}</id_shop_group>
                <id_shop>#{id_shop}</id_shop>
                <date_add>#{date_add}</date_add>
                <date_upd>#{date_upd}</date_upd>
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

  def self.update_configuration(
    id:,
    value:0,
    name:,
    id_shop_group: 1,
    id_shop:1,
    date_add:"",
    date_upd:""
  )
    conf = HTTParty.put("#{@api_url}configurations/#{id}",
        {
            body: 
            "<prestashop>
            <configuration>
              <id>#{id}</id>
              <value>#{value}</value>
              <name>#{name}</name>
              <id_shop_group>#{id_shop_group}</id_shop_group>
              <id_shop>#{id_shop}</id_shop>
              <date_add>#{date_add}</date_add>
              <date_upd>#{date_upd}</date_upd>
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

  def self.get_configuration(id:)
    conf = HTTParty.get("#{@api_url}configurations/#{id}",
        {
            basic_auth: @auth,
        }
    )
    puts conf.body, conf.code 
  end

  def self.delete_configuration(id:)
    conf = HTTParty.delete("#{@api_url}configurations/#{id}",
        {
            basic_auth: @auth,
        }
    )
    puts conf.body, conf.code 
  end


  ##### CONTACTS ###################################################################################################################################################

    def self.post_contact(
      email:"",
      customer_service: 0,
      name:,
      desciption:""
    )
      con = HTTParty.post("#{@api_url}contacts/",
      {
          body:
          "<prestashop>
            <contact>
              <id></id>
              <email>#{email}</email>
              <customer_service>#{customer_service}</customer_service>
              <name>
              <language id=\"1\">#{name}</language>
              </name>
              <description>
              <language id=\"1\">#{description}</language>
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

    def self.update_contact(
      id:,
      email:"",
      customer_service: 0,
      name:,
      desciption:""
    )
      con = HTTParty.put("#{@api_url}contacts/#{id}",
      {
          body:
          "<prestashop>
            <contact>
              <id>#{id}</id>
              <email>#{email}</email>
              <customer_service>#{customer_service}</customer_service>
              <name>
              <language id=\"1\">#{name}</language>
              </name>
              <description>
              <language id=\"1\">#{description}</language>
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

    def self.get_contact(id:)
      con = HTTParty.get("#{@api_url}contacts/#{id}",
      {
          basic_auth: @auth
      })
      puts con.body, con.code
    end

    def self.delete_contact(id:)
      con = HTTParty.delete("#{@api_url}contacts/#{id}",
      {
          basic_auth: @auth
      })
      puts con.body, con.code
    end

    ##### CONTENT MANAGEMENT SYSTEM ######################################################################################################################################################

    def self.post_content_management_system(
      id_cms_category:0,
      position:0,
      indexation:0,
      active:0,
      meta_description:"",
      meta_keywords:"",
      meta_title:,
      head_seo_title:"",
      link_rewrite:,
      content:""
    )
      sup = HTTParty.post("#{@api_url}content_management_system/",
      {
        body:
        "<prestashop>
          <content>
            <id></id>
            <id_cms_category>#{id_cms_category}</id_cms_category>
            <position>#{position}</position>
            <indexation>#{indexation}</indexation>
            <active>#{active}</active>
            <meta_description>
              <language id=\"1\">#{meta_description}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{meta_keywords}</language>
            </meta_keywords>
            <meta_title>
              <language id=\"1\">#{meta_title}</language>
            </meta_title>
            <head_seo_title>
              <language id=\"1\">#{head_seo_title}</language>
            </head_seo_title>
            <link_rewrite>
              <language id=\"1\">#{link_rewrite}</language>
            </link_rewrite>
            <content>
              <language id=\"1\">#{content}</language>
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

    def self.update_content_management_system(
      id:,
      id_cms_category:0,
      position:0,
      indexation:0,
      active:0,
      meta_description:"",
      meta_keywords:"",
      meta_title:,
      head_seo_title:"",
      link_rewrite:,
      content:""
    )
      sup = HTTParty.put("#{@api_url}content_management_system/#{id}",
      {
        body:
        "<prestashop>
          <content>
            <id>#{id}</id>
            <id_cms_category>#{id_cms_category}</id_cms_category>
            <position>#{position}</position>
            <indexation>#{indexation}</indexation>
            <active>#{active}</active>
            <meta_description>
              <language id=\"1\">#{meta_description}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{meta_keywords}</language>
            </meta_keywords>
            <meta_title>
              <language id=\"1\">#{meta_title}</language>
            </meta_title>
            <head_seo_title>
              <language id=\"1\">#{head_seo_title}</language>
            </head_seo_title>
            <link_rewrite>
              <language id=\"1\">#{link_rewrite}</language>
            </link_rewrite>
            <content>
              <language id=\"1\">#{content}</language>
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

    def self.get_content_management_system(id:)
      sup = HTTParty.get("#{@api_url}content_management_system/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_content_management_system(id:)
      sup = HTTParty.delete("#{@api_url}content_management_system/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

     ##### COUNTRIES ######################################################################################################################################################################

     def self.post_country(
      id_zone:,
      id_currency:1,
      call_prefix:0,
      iso_code:,
      active:0,
      contains_states:,
      need_identification_number:,
      need_zip_code:0,
      zip_code_format:"",
      display_tax_label:,
      name:
     )
      sup = HTTParty.post("#{@api_url}countries/",
      {
        body:
        "<prestashop>
          <country>
          <id></id>
          <id_zone>#{id_zone}</id_zone>
          <id_currency>#{id_currency}</id_currency>
          <call_prefix>#{call_prefix}</call_prefix>
          <iso_code>#{iso_code}</iso_code>
          <active>#{active}</active>
          <contains_states>#{contains_states}</contains_states>
          <need_identification_number>#{need_identification_number}</need_identification_number>
          <need_zip_code>#{need_zip_code}</need_zip_code>
          <zip_code_format>#{zip_code_format}</zip_code_format>
          <display_tax_label>#{display_tax_label}</display_tax_label>
          <name>
          <language id=\"1\">#{name}</language>
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

    def self.update_country(
      id:,
      id_zone:,
      id_currency:1,
      call_prefix:0,
      iso_code:,
      active:0,
      contains_states:,
      need_identification_number:,
      need_zip_code:0,
      zip_code_format:"",
      display_tax_label:,
      name:
    )
      sup = HTTParty.put("#{@api_url}countries/#{id}",
      {
        body:
        "<prestashop>
          <country>
          <id>#{id}</id>
          <id_zone>#{id_zone}</id_zone>
          <id_currency>#{id_currency}</id_currency>
          <call_prefix>#{call_prefix}</call_prefix>
          <iso_code>#{iso_code}</iso_code>
          <active>#{active}</active>
          <contains_states>#{contains_states}</contains_states>
          <need_identification_number>#{need_identification_number}</need_identification_number>
          <need_zip_code>#{need_zip_code}</need_zip_code>
          <zip_code_format>#{zip_code_format}</zip_code_format>
          <display_tax_label>#{display_tax_label}</display_tax_label>
          <name>
          <language id=\"1\">#{name}</language>
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

    def self.get_country(id:)
      sup = HTTParty.get("#{@api_url}countries/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_country(id:)
      sup = HTTParty.delete("#{@api_url}countries/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    ##### CURRENCIES ######################################################################################################################################################################

    def self.post_currency(
      names:"",
      name:,  
      symbol:"",
      iso_code:,
      numeric_iso_code:0,
      precision:0,
      conversion_rate:,
      deleted:0,
      active:0,
      unofficial:0,
      modified:0,
      pattern:0
    )
      sup = HTTParty.post("#{@api_url}currencies/",
      {
        body:
        "<prestashop>
          <currency>
            <id></id>
            <names>
              <language id=\"1\">#{names}</language>
            </names>
            <name></name>
            <symbol>
              <language id=\"1\">#{symbol}</language>
            </symbol>
            <iso_code>#{iso_code}</iso_code>
            <numeric_iso_code>#{numeric_iso_code}</numeric_iso_code>
            <precision>#{precision}</precision>
            <conversion_rate>#{conversion_rate}</conversion_rate>
            <deleted>#{deleted}</deleted>
            <active>#{active}</active>
            <unofficial>#{unofficial}</unofficial>
            <modified>#{modified}</modified>
            <pattern>
              <language id=\"1\">#{pattern}</language>
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

    def self.update_currency(
      id:,
      names:"",
      name:,  
      symbol:"",
      iso_code:,
      numeric_iso_code:0,
      precision:0,
      conversion_rate:,
      deleted:0,
      active:0,
      unofficial:0,
      modified:0,
      pattern:0
    )
      sup = HTTParty.put("#{@api_url}currencies/#{id}",
      {
        body:
        "<prestashop>
          <currency>
            <id>#{id}</id>
            <names>
              <language id=\"1\">#{names}</language>
            </names>
            <name></name>
            <symbol>
              <language id=\"1\">#{symbol}</language>
            </symbol>
            <iso_code>#{iso_code}</iso_code>
            <numeric_iso_code>#{numeric_iso_code}</numeric_iso_code>
            <precision>#{precision}</precision>
            <conversion_rate>#{conversion_rate}</conversion_rate>
            <deleted>#{deleted}</deleted>
            <active>#{active}</active>
            <unofficial>#{unofficial}</unofficial>
            <modified>#{modified}</modified>
            <pattern>
              <language id=\"1\">#{pattern}</language>
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

    def self.get_currency(id:)
      sup = HTTParty.get("#{@api_url}currencies/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_currency(id:)
      sup = HTTParty.delete("#{@api_url}currencies/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end


    ##### CUSTOMER MESSAGE ################################################################################################################################################################

    def self.post_customer_message(
      id_employee:0,
      id_customer_thread:0,
      ip_address:0,
      message:,
      file_name:"",
      user_agent:"",
      private:0,
      date_add:"",
      date_upd:"",
      read:0

    )
      sup = HTTParty.post("#{@api_url}customer_messsages/",
      {
        body:
        "<prestashop>
          <customer_message>
            <id></id>
            <id_employee>#{id_employee}</id_employee>
            <id_customer_thread>#{id_customer_thread}</id_customer_thread>
            <ip_address>#{ip_address}</ip_address>
            <message>#{message}</message>
            <file_name>#{file_name}</file_name>
            <user_agent>#{user_agent}</user_agent>
            <private>#{private}</private>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <read>#{read}</read>
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

    def self.update_customer_message(
      id:,
      id_employee:0,
      id_customer_thread:0,
      ip_address:0,
      message:,
      file_name:"",
      user_agent:"",
      private:0,
      date_add:"",
      date_upd:"",
      read:0
    )
      sup = HTTParty.put("#{@api_url}customer_messsages/#{id}",
      {
        body:
        "<prestashop>
          <customer_message>
            <id>#{id}</id>
            <id_employee>#{id_employee}</id_employee>
            <id_customer_thread>#{id_customer_thread}</id_customer_thread>
            <ip_address>#{ip_address}</ip_address>
            <message>#{message}</message>
            <file_name>#{file_name}</file_name>
            <user_agent>#{user_agent}</user_agent>
            <private>#{private}</private>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <read>#{read}</read>
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

    def self.get_customer_message(id:)
      sup = HTTParty.get("#{@api_url}customer_messsages/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_customer_message(id:)
      sup = HTTParty.delete("#{@api_url}customer_messsages/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

##### CUSTOMER THREADS ################################################################################################################################################################

    def self.post_customer_thread(
      id_lang:,
      id_shop:1,
      id_customer:0,
      id_order:0,
      id_product:0,
      id_contact:,
      email:"",
      token:,
      status:"",
      date_add:"",
      date_upd:"",
      customer_message_id:0
    )
      sup = HTTParty.post("#{@api_url}customer_threads/",
      {
        body:
        "<prestashop>
          <customer_thread>
            <id></id>
            <id_lang>#{id_lang}</id_lang>
            <id_shop>#{id_shop}</id_shop>
            <id_customer><#{id_customer}/id_customer>
            <id_order>#{id_order}</id_order>
            <id_product>#{id_product}</id_product>
            <id_contact>#{id_contact}</id_contact>
            <email>#{email}</email>
            <token>#{token}</token>
            <status>#{status}</status>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <associations>
              <customer_messages>
                <customer_message>
                  <id>#{customer_message_id}</id>
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

    def self.update_customer_thread(
      id:,
      id_lang:,
      id_shop:1,
      id_customer:0,
      id_order:0,
      id_product:0,
      id_contact:,
      email:"",
      token:,
      status:"",
      date_add:"",
      date_upd:"",
      customer_message_id:0
    )
      sup = HTTParty.put("#{@api_url}customer_threads/#{id}",
      {
        body:
        "<prestashop>
          <customer_thread>
            <id>#{id}</id>
            <id_lang>#{id_lang}</id_lang>
            <id_shop>#{id_shop}</id_shop>
            <id_customer><#{id_customer}/id_customer>
            <id_order>#{id_order}</id_order>
            <id_product>#{id_product}</id_product>
            <id_contact>#{id_contact}</id_contact>
            <email>#{email}</email>
            <token>#{token}</token>
            <status>#{status}</status>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <associations>
              <customer_messages>
                <customer_message>
                  <id>#{customer_message_id}</id>
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

    def self.get_customer_thread(id:)
      sup = HTTParty.get("#{@api_url}customer_threads/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_customer_thread(id:)
      sup = HTTParty.delete("#{@api_url}customer_threads/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    ##### CUSTOMERS ##################################################################################################################################################

    def self.post_customer(
        id_default_group: 0,                                     
        id_lang: 1,                                     
        newsletter_date_add: "",                 
        ip_registration_newsletter: "",                                    
        last_passwd_gen: "",                 
        secure_key: "",    
        deleted: 0,                                     
        passwd:,                         
        lastname:,                            
        firstname:,                              
        email:,              
        id_gender: 0,                                     
        birthday: "",                          
        newsletter: 0,                                     
        optin: 0,                                     
        website:"",                                    
        company: "",                                    
        siret: "",                                    
        ape: "",                                    
        outstanding_allow_amount: "",                            
        show_public_prices: 0,                                     
        id_risk: 0,                                     
        max_payment_days: 0,                                     
        active: 0,                                     
        note: "",                                    
        is_guest: 0,                                     
        id_shop: 1,                                     
        id_shop_group: 1,                                     
        date_add: "",                 
        date_upd: "",                 
        reset_password_token: "",                                    
        reset_password_validity:"",                 
        id_group: 0 
    )
      customer = HTTParty.post("#{@api_url}customers/",{
          body:
          "<prestashop>
              <customer>
                  <id></id>
                  <id_default_group href=\"http://localhost:8080/api/groups/\">#{id_default_group}</id_default_group>
                  <id_lang href=\"http://localhost:8080/api/languages/\">#{id_lang}</id_lang>
                  <newsletter_date_add>#{ip_registration_newsletter}</newsletter_date_add>
                  <ip_registration_newsletter>#{ip_registration_newsletter}</ip_registration_newsletter>
                  <last_passwd_gen>#{last_passwd_gen}</last_passwd_gen>
                  <secure_key>#{secure_key}</secure_key>
                  <deleted>#{deleted}</deleted>
                  <passwd>#{passwd}</passwd>
                  <lastname>#{lastname}</lastname>
                  <firstname>#{firstname}</firstname>
                  <email>#{email}</email>
                  <id_gender>#{id_gender}</id_gender>
                  <birthday>#{birthday}</birthday>
                  <newsletter>#{newsletter}</newsletter>
                  <optin>#{optin}</optin>
                  <website>#{website}</website>
                  <company>#{company}</company>
                  <siret>#{siret}</siret>
                  <ape>#{ape}</ape>
                  <outstanding_allow_amount>#{outstanding_allow_amount}</outstanding_allow_amount>
                  <show_public_prices>#{show_public_prices}</show_public_prices>
                  <id_risk>#{id_risk}</id_risk>
                  <max_payment_days>#{max_payment_days}</max_payment_days>
                  <active>#{active}</active>
                  <note>#{note}</note>
                  <is_guest>#{is_guest}</is_guest>
                  <id_shop>#{id_shop}</id_shop>
                  <id_shop_group>#{id_shop_group}</id_shop_group>
                  <date_add>#{date_add}</date_add>
                  <date_upd>#{date_upd}</date_upd>
                  <reset_password_token>#{reset_password_token}</reset_password_token>
                  <reset_password_validity>#{reset_password_validity}</reset_password_validity>
                  <associations>
                      <groups nodeType=\"group\" api=\"groups\">
                      <group href=\"http://localhost:8080/api/groups/\">
                      <id>#{id}</id>
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

  def self.update_customer(
        id:,
        id_default_group: 0,                                     
        id_lang: 1,                                     
        newsletter_date_add: "",                 
        ip_registration_newsletter: "",                                    
        last_passwd_gen: "",                 
        secure_key: "",    
        deleted: 0,                                     
        passwd:,                         
        lastname:,                            
        firstname:,                              
        email:,              
        id_gender: 0,                                     
        birthday: "",                          
        newsletter: 0,                                     
        optin: 0,                                     
        website:"",                                    
        company: "",                                    
        siret: "",                                    
        ape: "",                                    
        outstanding_allow_amount: "",                            
        show_public_prices: 0,                                     
        id_risk: 0,                                     
        max_payment_days: 0,                                     
        active: 0,                                     
        note: "",                                    
        is_guest: 0,                                     
        id_shop: 1,                                     
        id_shop_group: 1,                                     
        date_add: "",                 
        date_upd: "",                 
        reset_password_token: "",                                    
        reset_password_validity:"",                 
        id_group: 0 
  )
      cust = HTTParty.put("#{@api_url}customers/#{id}",
      {
          body: 
          "<prestashop>
              <customer>
                  <id>#{id}</id>
                  <id_default_group href=\"http://localhost:8080/api/groups/\">#{id_default_group}</id_default_group>
                  <id_lang href=\"http://localhost:8080/api/languages/\">#{id_lang}</id_lang>
                  <newsletter_date_add>#{ip_registration_newsletter}</newsletter_date_add>
                  <ip_registration_newsletter>#{ip_registration_newsletter}</ip_registration_newsletter>
                  <last_passwd_gen>#{last_passwd_gen}</last_passwd_gen>
                  <secure_key>#{secure_key}</secure_key>
                  <deleted>#{deleted}</deleted>
                  <passwd>#{passwd}</passwd>
                  <lastname>#{lastname}</lastname>
                  <firstname>#{firstname}</firstname>
                  <email>#{email}</email>
                  <id_gender>#{id_gender}</id_gender>
                  <birthday>#{birthday}</birthday>
                  <newsletter>#{newsletter}</newsletter>
                  <optin>#{optin}</optin>
                  <website>#{website}</website>
                  <company>#{company}</company>
                  <siret>#{siret}</siret>
                  <ape>#{ape}</ape>
                  <outstanding_allow_amount>#{outstanding_allow_amount}</outstanding_allow_amount>
                  <show_public_prices>#{show_public_prices}</show_public_prices>
                  <id_risk>#{id_risk}</id_risk>
                  <max_payment_days>#{max_payment_days}</max_payment_days>
                  <active>#{active}</active>
                  <note>#{note}</note>
                  <is_guest>#{is_guest}</is_guest>
                  <id_shop>#{id_shop}</id_shop>
                  <id_shop_group>#{id_shop_group}</id_shop_group>
                  <date_add>#{date_add}</date_add>
                  <date_upd>#{date_upd}</date_upd>
                  <reset_password_token>#{reset_password_token}</reset_password_token>
                  <reset_password_validity>#{reset_password_validity}</reset_password_validity>
                  <associations>
                      <groups nodeType=\"group\" api=\"groups\">
                      <group href=\"http://localhost:8080/api/groups/\">
                      <id>#{id}</id>
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

  def self.delete_customer(id:)
    cust = HTTParty.delete("#{@api_url}customers/#{id}",
    {
        basic_auth: @auth       
    }) 
    puts cust.body, cust.code
  end  
  
  def self.get_customer(id:)
    cust = HTTParty.get("#{@api_url}customers/#{id}",
    {
      basic_auth: @auth              
    }) 
    puts cust.body, cust.code
  end 


  ##### CUSTOMIZATIONS ##################################################################################################################################################################

  def self.post_customization(
    id_address_delivery:,
    id_cart:,
    id_product:,
    id_product_attribute:,
    quantity:,
    quantity_refunded:,
    quantity_returned:,
    in_cart:,
    customized_data_text_field_id_customization_field:0,
    customized_data_text_field_value:"",
    customized_data_image_id_customization_field:0,
    customized_data_image_value:""
  )
    sup = HTTParty.post("#{@api_url}customizations/",
    {
      body:
      "<prestashop>
        <customization>
        <id></id>
        <id_address_delivery>#{id_address_delivery}</id_address_delivery>
        <id_cart>#{id_cart}</id_cart>
        <id_product>#{id_product}</id_product>
        <id_product_attribute>#{id_product_attribute}</id_product_attribute>
        <quantity>#{quantity}</quantity>
        <quantity_refunded>#{quantity_refunded}</quantity_refunded>
        <quantity_returned><#{quantity_returned}/quantity_returned>
        <in_cart>#{in_cart}</in_cart>
          <associations>
            <customized_data_text_fields>
              <customized_data_text_field>
                <id_customization_field>#{customized_data_text_field_id_customization_field}</id_customization_field>
                <value>#{customized_data_text_field_value}</value>
              </customized_data_text_field>
            </customized_data_text_fields>
            <customized_data_images>
              <customized_data_image>
                <id_customization_field>#{customized_data_image_id_customization_field}</id_customization_field>
                <value>#{customized_data_image_value}</value>
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

  def self.update_customization(
    id:,
    id_address_delivery:,
    id_cart:,
    id_product:,
    id_product_attribute:,
    quantity:,
    quantity_refunded:,
    quantity_returned:,
    in_cart:,
    customized_data_text_field_id_customization_field:0,
    customized_data_text_field_value:"",
    customized_data_image_id_customization_field:0,
    customized_data_image_value:""
  )
    sup = HTTParty.put("#{@api_url}customizations/#{id}",
    {
      body:
      "<prestashop>
        <customization>
        <id>#{id}</id>
        <id_address_delivery>#{id_address_delivery}</id_address_delivery>
        <id_cart>#{id_cart}</id_cart>
        <id_product>#{id_product}</id_product>
        <id_product_attribute>#{id_product_attribute}</id_product_attribute>
        <quantity>#{quantity}</quantity>
        <quantity_refunded>#{quantity_refunded}</quantity_refunded>
        <quantity_returned><#{quantity_returned}/quantity_returned>
        <in_cart>#{in_cart}</in_cart>
          <associations>
            <customized_data_text_fields>
              <customized_data_text_field>
                <id_customization_field>#{customized_data_text_field_id_customization_field}</id_customization_field>
                <value>#{customized_data_text_field_value}</value>
              </customized_data_text_field>
            </customized_data_text_fields>
            <customized_data_images>
              <customized_data_image>
                <id_customization_field>#{customized_data_image_id_customization_field}</id_customization_field>
                <value>#{customized_data_image_value}</value>
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

  def self.get_customization(id:)
    sup = HTTParty.get("#{@api_url}customizations/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_customization(id:)
    sup = HTTParty.delete("#{@api_url}customizations/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### DELIVERIES ######################################################################################################################################################################
   
  def self.post_deliveries(
    id_carrier:,
    id_range_price:,
    id_range_weight:,
    id_zone:,
    id_shop:1,
    id_shop_group:1,
    price:
  )
    sup = HTTParty.post("#{@api_url}deliveries/",
    {
      body:
      "<prestashop>
        <delivery>
          <id></id>
          <id_carrier>#{id_carrier}</id_carrier>
          <id_range_price>#{id_range_price}</id_range_price>
          <id_range_weight>#{id_range_weight}</id_range_weight>
          <id_zone>#{id_zone}</id_zone>
          <id_shop>#{id_shop}</id_shop>
          <id_shop_group>#{id_shop_group}</id_shop_group>
          <price>#{price}</price>
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

  def self.update_deliveries(
    id:,
    id_carrier:,
    id_range_price:,
    id_range_weight:,
    id_zone:,
    id_shop:1,
    id_shop_group:1,
    price:
  )
    sup = HTTParty.put("#{@api_url}deliveries/#{id}",
    {
      body:
      "<prestashop>
        <delivery>
          <id>#{id}</id>
          <id_carrier>#{id_carrier}</id_carrier>
          <id_range_price>#{id_range_price}</id_range_price>
          <id_range_weight>#{id_range_weight}</id_range_weight>
          <id_zone>#{id_zone}</id_zone>
          <id_shop>#{id_shop}</id_shop>
          <id_shop_group>#{id_shop_group}</id_shop_group>
          <price>#{price}</price>
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

  def self.get_deliveries(id:)
    sup = HTTParty.put("#{@api_url}deliveries/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_deliveries(id:)
    sup = HTTParty.delete("#{@api_url}deliveries/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### EMPLOYEE ##############################################################################################################################################

  def self.post_employee(
    id_lang: ,
    last_passwd_gen: "",
    stats_date_from: "",
    stats_date_to: "",
    stats_compare_from: "2",
    stats_compare_to: "",
    passwd:,
    lastname:,
    firstname:,
    email:,
    active:0,
    id_profile:,
    bo_color: "",
    default_tab:0,
    bo_theme: "",
    bo_css: "theme.css",
    bo_width: 0,
    bo_menu: 0,
    stats_compare_option: 0,
    preselect_date_range: "",
    id_last_order: 0,
    id_last_customer_message: 0,
    id_last_customer: 0,
    reset_password_token: "",
    reset_password_validity: "",
    has_enabled_gravatar: 0
  )
    emp = HTTParty.post("#{@api_url}employees/",
    {
      body: 
      "<prestashop>
        <employee>
          <id></id>
          <id_lang>#{id_lang}</id_lang>
          <last_passwd_gen>#{last_passwd_gen}</last_passwd_gen>
          <stats_date_from>#{stats_date_from}</stats_date_from>
          <stats_date_to>#{stats_date_to}</stats_date_to>
          <stats_compare_from>#{stats_compare_from}</stats_compare_from>
          <stats_compare_to>#{stats_compare_to}</stats_compare_to>
          <passwd>#{passwd}</passwd>
          <lastname>#{lastname}</lastname>
          <firstname>#{firstname}</firstname>
          <email>#{email}</email>
          <active>#{active}</active>
          <id_profile>#{id_profile}</id_profile>
          <bo_color>#{bo_color}</bo_color>
          <default_tab>#{default_tab}</default_tab>
          <bo_theme>#{bo_theme}</bo_theme>
          <bo_css>#{bo_css}</bo_css>
          <bo_width>#{bo_width}</bo_width>
          <bo_menu>#{bo_menu}</bo_menu>
          <stats_compare_option>#{stats_compare_option}</stats_compare_option>
          <preselect_date_range>#{preselect_date_range}</preselect_date_range>
          <id_last_order>#{id_last_order}</id_last_order>
          <id_last_customer_message>#{id_last_customer_message}</id_last_customer_message>
          <id_last_customer>#{id_last_customer}</id_last_customer>
          <reset_password_token>#{reset_password_token}</reset_password_token>
          <reset_password_validity>#{reset_password_validity}</reset_password_validity>
          <has_enabled_gravatar>#{has_enabled_gravatar}</has_enabled_gravatar>
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

  def self.update_employee(
    id:,
    id_lang: ,
    last_passwd_gen: "",
    stats_date_from: "",
    stats_date_to: "",
    stats_compare_from: "2",
    stats_compare_to: "",
    passwd:,
    lastname:,
    firstname:,
    email:,
    active:0,
    id_profile:,
    bo_color: "",
    default_tab:0,
    bo_theme: "",
    bo_css: "theme.css",
    bo_width: 0,
    bo_menu: 0,
    stats_compare_option: 0,
    preselect_date_range: "",
    id_last_order: 0,
    id_last_customer_message: 0,
    id_last_customer: 0,
    reset_password_token: "",
    reset_password_validity: "",
    has_enabled_gravatar: 0
  )
    emp = HTTParty.put("#{@api_url}employees/#{id}",
    {
      body: 
      "<prestashop>
        <employee>
          <id>#{id}</id>
          <id_lang>#{id_lang}</id_lang>
          <last_passwd_gen>#{last_passwd_gen}</last_passwd_gen>
          <stats_date_from>#{stats_date_from}</stats_date_from>
          <stats_date_to>#{stats_date_to}</stats_date_to>
          <stats_compare_from>#{stats_compare_from}</stats_compare_from>
          <stats_compare_to>#{stats_compare_to}</stats_compare_to>
          <passwd>#{passwd}</passwd>
          <lastname>#{lastname}</lastname>
          <firstname>#{firstname}</firstname>
          <email>#{email}</email>
          <active>#{active}</active>
          <id_profile>#{id_profile}</id_profile>
          <bo_color>#{bo_color}</bo_color>
          <default_tab>#{default_tab}</default_tab>
          <bo_theme>#{bo_theme}</bo_theme>
          <bo_css>#{bo_css}</bo_css>
          <bo_width>#{bo_width}</bo_width>
          <bo_menu>#{bo_menu}</bo_menu>
          <stats_compare_option>#{stats_compare_option}</stats_compare_option>
          <preselect_date_range>#{preselect_date_range}</preselect_date_range>
          <id_last_order>#{id_last_order}</id_last_order>
          <id_last_customer_message>#{id_last_customer_message}</id_last_customer_message>
          <id_last_customer>#{id_last_customer}</id_last_customer>
          <reset_password_token>#{reset_password_token}</reset_password_token>
          <reset_password_validity>#{reset_password_validity}</reset_password_validity>
          <has_enabled_gravatar>#{has_enabled_gravatar}</has_enabled_gravatar>
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

  def self.get_employee(id:)
    emp = HTTParty.get("#{@api_url}employees/#{id}",
    {
      basic_auth: @auth       
    }) 
    puts emp.body, emp.code
  end 

  def self.delete_employee(id:)
    emp = HTTParty.delete("#{@api_url}employees/#{id}",
    {
      basic_auth: @auth       
    }) 
    puts emp.body, emp.code
  end 


  ##### GROUPS ##########################################################################################################################################################################

  def self.post_groups(
    reduction:0,
    price_display_method:,
    show_prices:0,
    date_add:"",
    date_upd:"",
    name:,
  )
    sup = HTTParty.post("#{@api_url}groups/",
    {
      body:
      "<prestashop>
        <group>
          <id></id>
          <reduction>#{reduction}</reduction>
          <price_display_method>#{price_display_method}</price_display_method>
          <show_prices>#{show_prices}</show_prices>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <name>
            <language id=\"1\">#{name}</language>
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

  def self.update_groups(
    id:,
    reduction:0,
    price_display_method:,
    show_prices:0,
    date_add:"",
    date_upd:"",
    name:,
  )
    sup = HTTParty.put("#{@api_url}groups/#{id}",
    {
      body:
      "<prestashop>
        <group>
          <id>#{id}</id>
          <reduction>#{reduction}</reduction>
          <price_display_method>#{price_display_method}</price_display_method>
          <show_prices>#{show_prices}</show_prices>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <name>
            <language id=\"1\">#{name}</language>
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

  def self.get_groups(id:)
    sup = HTTParty.get("#{@api_url}groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_groups(id:)
    sup = HTTParty.delete("#{@api_url}groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### GUESTS #########################################################################################################################################################################

  def self.post_guests(
    id_customer:0,
    id_operating_system:0,
    id_web_browser:0,
    javascript:0,
    screen_resolution_x:0,
    screen_resolution_y:0,
    screen_color:0,
    sun_java:0,
    adobe_flash:0,
    adobe_director:0,
    apple_quicktime:0,
    real_player:0,
    windows_media:0,
    accept_language:"",
    mobile_theme:0
  )
    sup = HTTParty.post("#{@api_url}guests/",
    {
      body:
      "<prestashop>
        <guest>
          <id></id>
          <id_customer>#{id_customer}</id_customer>
          <id_operating_system>#{id_operating_system}</id_operating_system>
          <id_web_browser>#{id_web_browser}</id_web_browser>
          <javascript>#{javascript}</javascript>
          <screen_resolution_x>#{screen_resolution_x}</screen_resolution_x>
          <screen_resolution_y>#{screen_resolution_y}</screen_resolution_y>
          <screen_color>#{screen_color}</screen_color>
          <sun_java>#{sun_java}</sun_java>
          <adobe_flash>#{adobe_flash}</adobe_flash>
          <adobe_director>#{adobe_director}</adobe_director>
          <apple_quicktime>#{apple_quicktime}</apple_quicktime>
          <real_player>#{real_player}</real_player>
          <windows_media>#{windows_media}</windows_media>
          <accept_language>#{accept_language}</accept_language>
          <mobile_theme>#{mobile_theme}</mobile_theme>
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

  def self.update_guests(  
    id:,  
    id_customer:0,
    id_operating_system:0,
    id_web_browser:0,
    javascript:0,
    screen_resolution_x:0,
    screen_resolution_y:0,
    screen_color:0,
    sun_java:0,
    adobe_flash:0,
    adobe_director:0,
    apple_quicktime:0,
    real_player:0,
    windows_media:0,
    accept_language:"",
    mobile_theme:0)
    sup = HTTParty.put("#{@api_url}guests/#{id}",
    {
      body:
      "<prestashop>
        <guest>
          <id>#{id}</id>
          <id_customer>#{id_customer}</id_customer>
          <id_operating_system>#{id_operating_system}</id_operating_system>
          <id_web_browser>#{id_web_browser}</id_web_browser>
          <javascript>#{javascript}</javascript>
          <screen_resolution_x>#{screen_resolution_x}</screen_resolution_x>
          <screen_resolution_y>#{screen_resolution_y}</screen_resolution_y>
          <screen_color>#{screen_color}</screen_color>
          <sun_java>#{sun_java}</sun_java>
          <adobe_flash>#{adobe_flash}</adobe_flash>
          <adobe_director>#{adobe_director}</adobe_director>
          <apple_quicktime>#{apple_quicktime}</apple_quicktime>
          <real_player>#{real_player}</real_player>
          <windows_media>#{windows_media}</windows_media>
          <accept_language>#{accept_language}</accept_language>
          <mobile_theme>#{mobile_theme}</mobile_theme>
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

  def self.get_guests(id:)
    sup = HTTParty.get("#{@api_url}guests/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_guests(id:)
    sup = HTTParty.delete("#{@api_url}guests/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

    ##### LANGUAGE ###################################################################################################################################################

    def self.post_language(
      name:,
      iso_code:,
      locale:"",
      language_code:"",
      active:0,
      is_rtl:0,
      date_format_lite:,
      date_format_full:
    )
        language = HTTParty.post("#{@api_url}languages/",
            {
                body: 
                "<prestashop>
                    <language>
                        <id></id>
                        <name>#{name}(#{name})</name>
                        <iso_code>#{iso_code}</iso_code>
                        <locale>#{locale}</locale>
                        <language_code>#{language_code}</language_code>
                        <active>#{active}</active>
                        <is_rtl>#{is_rtl}</is_rtl>
                        <date_format_lite>#{date_format_lite}</date_format_lite>
                        <date_format_full>#{date_format_full}</date_format_full>
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

    def self.update_language(
      id:,
      name:,
      iso_code:,
      locale:"",
      language_code:"",
      active:0,
      is_rtl:0,
      date_format_lite:,
      date_format_full:
    )
      language = HTTParty.put("#{@api_url}languages/#{id}",
          {
              body: 
              "<prestashop>
                  <language>
                      <id>#{id}</id>
                      <name>#{name}(#{name})</name>
                      <iso_code>#{iso_code}</iso_code>
                      <locale>#{locale}</locale>
                      <language_code>#{language_code}</language_code>
                      <active>#{active}</active>
                      <is_rtl>#{is_rtl}</is_rtl>
                      <date_format_lite>#{date_format_lite}</date_format_lite>
                      <date_format_full>#{date_format_full}</date_format_full>
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
    def self.delete_language(id:)
      language = HTTParty.delete("#{@api_url}languages/#{id}",
          {
              basic_auth: @auth
          }
      )
      puts language.body, language.code 
    end

    def self.get_language(id:)
      language = HTTParty.get("#{@api_url}languages/#{id}",
          {
              basic_auth: @auth
          }
      )
      puts language.body, language.code 
    end

       
    ##### MANUFACTURERS ##############################################################################################################################################

    def self.post_manufacturers(
      active:0,
      name:,
      date_add:"",
      date_upd:"",
      description:"",
      short_description:"",
      meta_title:"",
      meta_description:"",
      meta_keywords:"",
      address_id:0
    )
      attach = HTTParty.post("#{@api_url}manufacturers/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <manufacturer>
            <id></id>
            <active>#{active}</active>
            <name>#{name}</name>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <description>
              <language id=\"1\">#{description}</language>
            </description>
            <short_description>
              <language id=\"1\">#{short_description}</language>
            </short_description>
            <meta_title>
              <language id=\"1\">#{meta_title}</language>
            </meta_title>
            <meta_description>
              <language id=\"1\">#{meta_description}</language>
            </meta_description>
            <meta_keywords>
              <language id=\"1\">#{meta_keywords}</language>
            </meta_keywords>
            <associations>
              <addresses>
                <address>
                  <id>#{address_id}</id>
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

  def self.update_manufacturers(
    id:,
    active:0,
    name:,
    date_add:"",
    date_upd:"",
    description:"",
    short_description:"",
    meta_title:"",
    meta_description:"",
    meta_keywords:"",
    address_id:0
  )
    attach = HTTParty.put("#{@api_url}manufacturers/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <manufacturer>
          <id>#{id}</id>
          <active>#{active}</active>
          <name>#{name}</name>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <description>
            <language id=\"1\">#{description}</language>
          </description>
          <short_description>
            <language id=\"1\">#{short_description}</language>
          </short_description>
          <meta_title>
            <language id=\"1\">#{meta_title}</language>
          </meta_title>
          <meta_description>
            <language id=\"1\">#{meta_description}</language>
          </meta_description>
          <meta_keywords>
            <language id=\"1\">#{meta_keywords}</language>
          </meta_keywords>
          <associations>
            <addresses>
              <address>
                <id>#{address_id}</id>
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

  def self.delete_manufacturers(id:)
    attach = HTTParty.delete("#{@api_url}manufacturers/#{id}",
    {
        basic_auth: @auth,    
    })
    puts attach.body, attach.code
  end

  def self.get_manufacturers(id:)
    attach = HTTParty.get("#{@api_url}manufacturers/#{id}",
    {
        basic_auth: @auth,    
    })
    puts attach.body, attach.code
  end

    
   ##### MESSAGES #######################################################################################################################################################################

   def self.post_messages(
    id_cart:0,
    id_order:0,
    id_customer:0,
    id_employee:0,
    message:,
    private:0,
    date_add:""
   )
    sup = HTTParty.post("#{@api_url}messages/",
    {
      body:
      "<prestashop>
        <message>
          <id></id>
          <id_cart>#{id_cart}</id_cart>
          <id_order>#{id_order}</id_order>
          <id_customer>#{id_customer}</id_customer>
          <id_employee>#{id_employee}</id_employee>
          <message>#{message}</message>
          <private>#{private}</private>
          <date_add>#{date_add}</date_add>
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

  def self.update_messages(
    id:,    
    id_cart:0,
    id_order:0,
    id_customer:0,
    id_employee:0,
    message:,
    private:0,
    date_add:"")
    sup = HTTParty.put("#{@api_url}messages/#{id}",
    {
      body:
      "<prestashop>
        <message>
          <id>#{id}</id>
          <id_cart>#{id_cart}</id_cart>
          <id_order>#{id_order}</id_order>
          <id_customer>#{id_customer}</id_customer>
          <id_employee>#{id_employee}</id_employee>
          <message>#{message}</message>
          <private>#{private}</private>
          <date_add>#{date_add}</date_add>
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

  def self.get_messages(id:)
    sup = HTTParty.get("#{@api_url}messages/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_messages(id:)
    sup = HTTParty.delete("#{@api_url}messages/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end 

  ##### ORDER CARRIERS ############################################################################################################################################

  def self.post_order_carriers(
    id_order:,
    id_carrier:,
    id_order_invoice:0,
    weight:0,
    shipping_cost_tax_excl:0,
    shipping_cost_tax_incl:0,
    tracking_number:0,
    date_add:""
  )
    ord = HTTParty.post("#{@api_url}order_carriers/",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_carrier>
            <id></id>
            <id_order>#{id_order}</id_order>
            <id_carrier>#{id_carrier}</id_carrier>
            <id_order_invoice>#{id_order_invoice}</id_order_invoice>
            <weight>#{weight}</weight>
            <shipping_cost_tax_excl>#{shipping_cost_tax_excl}</shipping_cost_tax_excl>
            <shipping_cost_tax_incl>#{shipping_cost_tax_incl}</shipping_cost_tax_incl>
            <tracking_number>#{tracking_number}</tracking_number>
            <date_add>#{date_add}</date_add>
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

    def self.update_order_carriers(
      id:,
      id_order:,
      id_carrier:,
      id_order_invoice:0,
      weight:0,
      shipping_cost_tax_excl:0,
      shipping_cost_tax_incl:0,
      tracking_number:0,
      date_add:""
    )
    ord = HTTParty.put("#{@api_url}order_carriers/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_carrier>
            <id>#{id}</id>
            <id_order>#{id_order}</id_order>
            <id_carrier>#{id_carrier}</id_carrier>
            <id_order_invoice>#{id_order_invoice}</id_order_invoice>
            <weight>#{weight}</weight>
            <shipping_cost_tax_excl>#{shipping_cost_tax_excl}</shipping_cost_tax_excl>
            <shipping_cost_tax_incl>#{shipping_cost_tax_incl}</shipping_cost_tax_incl>
            <tracking_number>#{tracking_number}</tracking_number>
            <date_add>#{date_add}</date_add>
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

    def self.delete_order_carriers(id:)
    ord = HTTParty.delete("#{@api_url}order_carriers/#{id}",
    {
        basic_auth: @auth
    })
    puts ord.body,ord.code
    end

    def self.get_order_carriers(id:)
    ord = HTTParty.get("#{@api_url}order_carriers/#{id}",
    {
        basic_auth: @auth
    })
    puts ord.body,ord.code
    end

    ##### ORDER CART RULES ############################################################################################################################################

    def self.post_order_cart_rules(
      id_order:,
      id_cart_rule:,
      id_order_invoice:0,
      name:,
      value:,
      value_tax_excl:,
      free_shipping:0,
      deleted:0
    )
      ord = HTTParty.post("#{@api_url}order_cart_rules/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_cart_rule>
            <id></id>
            <id_order>#{id_order}</id_order>
            <id_cart_rule>#{id_cart_rule}</id_cart_rule>
            <id_order_invoice>#{id_order_invoice}</id_order_invoice>
            <name>#{name}</name>
            <value>#{value}</value>
            <value_tax_excl>#{value_tax_excl}</value_tax_excl>
            <free_shipping>#{free_shipping}</free_shipping>
            <deleted>#{deleted}</deleted>
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

    def self.update_order_cart_rules(
      id:,
      id_order:,
      id_cart_rule:,
      id_order_invoice:0,
      name:,
      value:,
      value_tax_excl:,
      free_shipping:0,
      deleted:0
    )
      ord = HTTParty.put("#{@api_url}order_cart_rules/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_cart_rule>
            <id>#{id}</id>
            <id_order>#{id_order}</id_order>
            <id_cart_rule>#{id_cart_rule}</id_cart_rule>
            <id_order_invoice>#{id_order_invoice}</id_order_invoice>
            <name>#{name}</name>
            <value>#{value}</value>
            <value_tax_excl>#{value_tax_excl}</value_tax_excl>
            <free_shipping>#{free_shipping}</free_shipping>
            <deleted>#{deleted}</deleted>
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

    def self.delete_order_cart_rules(id:)
      ord = HTTParty.delete("#{@api_url}order_cart_rules/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    def self.get_order_cart_rules(id:)
      ord = HTTParty.get("#{@api_url}order_cart_rules/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    ##### ORDER DETAILS ############################################################################################################################################### 

    def self.post_order_details(
      id_order:,
      product_id:0,
      product_attribute_id:0,
      product_quantity_reinjected:0,
      group_reduction:0,
      discount_quantity_applied:0,
      download_hash:"",
      download_deadline:"",
      id_order_invoice:0,
      id_warehouse:,
      id_shop:,
      id_customization:0,
      product_name:,
      product_quantity:,
      product_quantity_in_stock:0,
      product_quantity_return:0,
      product_quantity_refunded:0,
      product_price:,
      reduction_percent:0,
      reduction_amount:0,
      reduction_amount_tax_incl:0,
      reduction_amount_tax_excl:0,
      product_quantity_discount:0,
      product_ean13:"",
      product_isbn:"",
      product_upc:"",
      product_mpn:"",
      product_reference:"",
      product_supplier_reference:"",
      product_weight:0,
      tax_computation_method:0,
      id_tax_rules_group:0,
      ecotax:0,
      ecotax_tax_rate:0,
      download_nb:0,
      unit_price_tax_incl:0,
      unit_price_tax_excl:0,
      total_price_tax_incl:0,
      total_price_tax_excl:0,
      total_shipping_price_tax_excl:0,
      total_shipping_price_tax_incl:0,
      purchase_supplier_price:0,
      original_product_price:0,
      original_wholesale_price:0,
      total_refunded_tax_excl:0,
      total_refunded_tax_incl:0,
      tax_id:0
    )
      ord = HTTParty.post("#{@api_url}order_details/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_detail>
            <id></id>
            <id_order>#{id_order}</id_order>
            <product_id>#{product_id}</product_id>
            <product_attribute_id>#{product_attribute_id}</product_attribute_id>
            <product_quantity_reinjected>#{product_quantity_reinjected}</product_quantity_reinjected>
            <group_reduction>#{group_reduction}</group_reduction>
            <discount_quantity_applied>#{discount_quantity_applied}</discount_quantity_applied>
            <download_hash>#{download_hash}</download_hash>
            <download_deadline>#{download_deadline}</download_deadline>
            <id_order_invoice>#{id_order_invoice}</id_order_invoice>
            <id_warehouse>#{id_warehouse}</id_warehouse>
            <id_shop>#{id_shop}</id_shop>
            <id_customization>#{id_customization}</id_customization>
            <product_name>#{product_name}</product_name>
            <product_quantity>#{product_quantity}</product_quantity>
            <product_quantity_in_stock>#{product_quantity_in_stock}</product_quantity_in_stock>
            <product_quantity_return>#{product_quantity_return}</product_quantity_return>
            <product_quantity_refunded>#{product_quantity_refunded}</product_quantity_refunded>
            <product_price>#{product_price}</product_price>
            <reduction_percent>#{reduction_percent}</reduction_percent>
            <reduction_amount>#{reduction_amount}</reduction_amount>
            <reduction_amount_tax_incl>#{reduction_amount_tax_incl}</reduction_amount_tax_incl>
            <reduction_amount_tax_excl>#{reduction_amount_tax_excl}</reduction_amount_tax_excl>
            <product_quantity_discount>#{product_quantity_discount}</product_quantity_discount>
            <product_ean13>#{product_ean13}</product_ean13>
            <product_isbn>#{product_isbn}</product_isbn>
            <product_upc>#{product_upc}</product_upc>
            <product_mpn>#{product_mpn}</product_mpn>
            <product_reference>#{product_reference}</product_reference>
            <product_supplier_reference>#{product_supplier_reference}</product_supplier_reference>
            <product_weight>#{product_weight}</product_weight>
            <tax_computation_method>#{tax_computation_method}</tax_computation_method>
            <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
            <ecotax>#{ecotax}</ecotax>
            <ecotax_tax_rate>#{ecotax_tax_rate}</ecotax_tax_rate>
            <download_nb>#{download_nb}</download_nb>
            <unit_price_tax_incl>#{unit_price_tax_incl}</unit_price_tax_incl>
            <unit_price_tax_excl>#{unit_price_tax_excl}</unit_price_tax_excl>
            <total_price_tax_incl>#{total_price_tax_incl}</total_price_tax_incl>
            <total_price_tax_excl>#{total_price_tax_excl}</total_price_tax_excl>
            <total_shipping_price_tax_excl>#{total_shipping_price_tax_excl}</total_shipping_price_tax_excl>
            <total_shipping_price_tax_incl>#{total_shipping_price_tax_incl}</total_shipping_price_tax_incl>
            <purchase_supplier_price>#{purchase_supplier_price}</purchase_supplier_price>
            <original_product_price>#{original_product_price}</original_product_price>
            <original_wholesale_price>#{original_wholesale_price}</original_wholesale_price>
            <total_refunded_tax_excl>#{total_refunded_tax_excl}</total_refunded_tax_excl>
            <total_refunded_tax_incl>#{total_refunded_tax_incl}</total_refunded_tax_incl>
            <associations>
              <taxes>
                <tax>
                  <id>#{tax_id}</id>
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

    def self.update_order_details(
      id:,
      id_order:,
      product_id:0,
      product_attribute_id:0,
      product_quantity_reinjected:0,
      group_reduction:0,
      discount_quantity_applied:0,
      download_hash:"",
      download_deadline:"",
      id_order_invoice:0,
      id_warehouse:,
      id_shop:,
      id_customization:0,
      product_name:,
      product_quantity:,
      product_quantity_in_stock:0,
      product_quantity_return:0,
      product_quantity_refunded:0,
      product_price:,
      reduction_percent:0,
      reduction_amount:0,
      reduction_amount_tax_incl:0,
      reduction_amount_tax_excl:0,
      product_quantity_discount:0,
      product_ean13:"",
      product_isbn:"",
      product_upc:"",
      product_mpn:"",
      product_reference:"",
      product_supplier_reference:"",
      product_weight:0,
      tax_computation_method:0,
      id_tax_rules_group:0,
      ecotax:0,
      ecotax_tax_rate:0,
      download_nb:0,
      unit_price_tax_incl:0,
      unit_price_tax_excl:0,
      total_price_tax_incl:0,
      total_price_tax_excl:0,
      total_shipping_price_tax_excl:0,
      total_shipping_price_tax_incl:0,
      purchase_supplier_price:0,
      original_product_price:0,
      original_wholesale_price:0,
      total_refunded_tax_excl:0,
      total_refunded_tax_incl:0,
      tax_id:0
    )
      ord = HTTParty.put("#{@api_url}order_details/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_detail>
            <id>#{id}</id>
            <id_order>#{id_order}</id_order>
            <product_id>#{product_id}</product_id>
            <product_attribute_id>#{product_attribute_id}</product_attribute_id>
            <product_quantity_reinjected>#{product_quantity_reinjected}</product_quantity_reinjected>
            <group_reduction>#{group_reduction}</group_reduction>
            <discount_quantity_applied>#{discount_quantity_applied}</discount_quantity_applied>
            <download_hash>#{download_hash}</download_hash>
            <download_deadline>#{download_deadline}</download_deadline>
            <id_order_invoice>#{id_order_invoice}</id_order_invoice>
            <id_warehouse>#{id_warehouse}</id_warehouse>
            <id_shop>#{id_shop}</id_shop>
            <id_customization>#{id_customization}</id_customization>
            <product_name>#{product_name}</product_name>
            <product_quantity>#{product_quantity}</product_quantity>
            <product_quantity_in_stock>#{product_quantity_in_stock}</product_quantity_in_stock>
            <product_quantity_return>#{product_quantity_return}</product_quantity_return>
            <product_quantity_refunded>#{product_quantity_refunded}</product_quantity_refunded>
            <product_price>#{product_price}</product_price>
            <reduction_percent>#{reduction_percent}</reduction_percent>
            <reduction_amount>#{reduction_amount}</reduction_amount>
            <reduction_amount_tax_incl>#{reduction_amount_tax_incl}</reduction_amount_tax_incl>
            <reduction_amount_tax_excl>#{reduction_amount_tax_excl}</reduction_amount_tax_excl>
            <product_quantity_discount>#{product_quantity_discount}</product_quantity_discount>
            <product_ean13>#{product_ean13}</product_ean13>
            <product_isbn>#{product_isbn}</product_isbn>
            <product_upc>#{product_upc}</product_upc>
            <product_mpn>#{product_mpn}</product_mpn>
            <product_reference>#{product_reference}</product_reference>
            <product_supplier_reference>#{product_supplier_reference}</product_supplier_reference>
            <product_weight>#{product_weight}</product_weight>
            <tax_computation_method>#{tax_computation_method}</tax_computation_method>
            <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
            <ecotax>#{ecotax}</ecotax>
            <ecotax_tax_rate>#{ecotax_tax_rate}</ecotax_tax_rate>
            <download_nb>#{download_nb}</download_nb>
            <unit_price_tax_incl>#{unit_price_tax_incl}</unit_price_tax_incl>
            <unit_price_tax_excl>#{unit_price_tax_excl}</unit_price_tax_excl>
            <total_price_tax_incl>#{total_price_tax_incl}</total_price_tax_incl>
            <total_price_tax_excl>#{total_price_tax_excl}</total_price_tax_excl>
            <total_shipping_price_tax_excl>#{total_shipping_price_tax_excl}</total_shipping_price_tax_excl>
            <total_shipping_price_tax_incl>#{total_shipping_price_tax_incl}</total_shipping_price_tax_incl>
            <purchase_supplier_price>#{purchase_supplier_price}</purchase_supplier_price>
            <original_product_price>#{original_product_price}</original_product_price>
            <original_wholesale_price>#{original_wholesale_price}</original_wholesale_price>
            <total_refunded_tax_excl>#{total_refunded_tax_excl}</total_refunded_tax_excl>
            <total_refunded_tax_incl>#{total_refunded_tax_incl}</total_refunded_tax_incl>
            <associations>
              <taxes>
                <tax>
                  <id>#{tax_id}</id>
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

    def self.delete_order_details(id:)
      ord = HTTParty.delete("#{@api_url}order_details/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    def self.get_order_details(id:)
      ord = HTTParty.get("#{@api_url}order_details/#{id}",
      {
          basic_auth: @auth
      })
      puts ord.body,ord.code
    end

    ##### ORDER HISTORIES #############################################################################################################################################

    def self.post_order_histories(
      id_employee:0,
      id_order_state:,
      id_order:,
      date_add:""
    )
      ord = HTTParty.post("#{@api_url}order_histories/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_history>
              <id></id>
              <id_employee>#{id_employee}</id_employee>
              <id_order_state>#{id_order_state}</id_order_state>
              <id_order>#{id_order}</id_order>
              <date_add>#{date_add}</date_add>
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

    def self.update_order_histories(
      id:,
      id_employee:0,
      id_order_state:,
      id_order:,
      date_add:""
    )
      ord = HTTParty.put("#{@api_url}order_histories/#{id}",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_history>
              <id>#{id}</id>
              <id_employee>#{id_employee}</id_employee>
              <id_order_state>#{id_order_state}</id_order_state>
              <id_order>#{id_order}</id_order>
              <date_add>#{date_add}</date_add>
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

    def self.delete_order_histories(id:)
      ord = HTTParty.delete("#{@api_url}order_histories/#{id}",
      {
          basic_auth: @auth,
      })
      puts ord.body,ord.code
    end

    def self.get_order_histories(id:)
      ord = HTTParty.get("#{@api_url}order_histories/#{id}",
      {
          basic_auth: @auth,
      })
      puts ord.body,ord.code
    end

    ##### ORDER INVOICE ###############################################################################################################################################

    def self.post_order_invoice(
      id_order:,
      number:,
      delivery_number:0,
      delivery_date:"",
      total_discount_tax_excl:0,
      total_discount_tax_incl:0,
      total_paid_tax_excl:0,
      total_paid_tax_incl:0,
      total_products:0,
      total_products_wt:0,
      total_shipping_tax_excl:0,
      total_shipping_tax_incl:0,
      shipping_tax_computation_method:0,
      total_wrapping_tax_excl:0,
      total_wrapping_tax_incl:0,
      shop_address:"",
      note:"",
      date_add:""
    )
      order = HTTParty.post("#{@api_url}order_invoices/",
      {
          body: 
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_invoice>
              <id></id>
              <id_order>#{id_order}</id_order>
              <number>#{number}</number>
              <delivery_number>#{delivery_number}</delivery_number>
              <delivery_date>#{delivery_date}</delivery_date>
              <total_discount_tax_excl>#{total_discount_tax_excl}</total_discount_tax_excl>
              <total_discount_tax_incl>#{total_discount_tax_incl}</total_discount_tax_incl>
              <total_paid_tax_excl>#{total_paid_tax_excl}</total_paid_tax_excl>
              <total_paid_tax_incl>#{total_paid_tax_incl}</total_paid_tax_incl>
              <total_products>#{total_products}</total_products>
              <total_products_wt>#{total_products_wt}</total_products_wt>
              <total_shipping_tax_excl>#{total_shipping_tax_excl}</total_shipping_tax_excl>
              <total_shipping_tax_incl>#{total_shipping_tax_incl}</total_shipping_tax_incl>
              <shipping_tax_computation_method>#{shipping_tax_computation_method}</shipping_tax_computation_method>
              <total_wrapping_tax_excl>#{total_wrapping_tax_excl}</total_wrapping_tax_excl>
              <total_wrapping_tax_incl>#{total_wrapping_tax_incl}</total_wrapping_tax_incl>
              <shop_address>#{shop_address}</shop_address>
              <note>#{note}</note>
              <date_add>#{date_add}</date_add>
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

    def self.update_order_invoice(
      id:,
      id_order:,
      number:,
      delivery_number:0,
      delivery_date:"",
      total_discount_tax_excl:0,
      total_discount_tax_incl:0,
      total_paid_tax_excl:0,
      total_paid_tax_incl:0,
      total_products:0,
      total_products_wt:0,
      total_shipping_tax_excl:0,
      total_shipping_tax_incl:0,
      shipping_tax_computation_method:0,
      total_wrapping_tax_excl:0,
      total_wrapping_tax_incl:0,
      shop_address:"",
      note:"",
      date_add:""
    )
      order = HTTParty.put("#{@api_url}order_invoices/#{id}",
      {
          body: 
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order_invoice>
              <id>#{id}</id>
              <id_order>#{id_order}</id_order>
              <number>#{number}</number>
              <delivery_number>#{delivery_number}</delivery_number>
              <delivery_date>#{delivery_date}</delivery_date>
              <total_discount_tax_excl>#{total_discount_tax_excl}</total_discount_tax_excl>
              <total_discount_tax_incl>#{total_discount_tax_incl}</total_discount_tax_incl>
              <total_paid_tax_excl>#{total_paid_tax_excl}</total_paid_tax_excl>
              <total_paid_tax_incl>#{total_paid_tax_incl}</total_paid_tax_incl>
              <total_products>#{total_products}</total_products>
              <total_products_wt>#{total_products_wt}</total_products_wt>
              <total_shipping_tax_excl>#{total_shipping_tax_excl}</total_shipping_tax_excl>
              <total_shipping_tax_incl>#{total_shipping_tax_incl}</total_shipping_tax_incl>
              <shipping_tax_computation_method>#{shipping_tax_computation_method}</shipping_tax_computation_method>
              <total_wrapping_tax_excl>#{total_wrapping_tax_excl}</total_wrapping_tax_excl>
              <total_wrapping_tax_incl>#{total_wrapping_tax_incl}</total_wrapping_tax_incl>
              <shop_address>#{shop_address}</shop_address>
              <note>#{note}</note>
              <date_add>#{date_add}</date_add>
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

    def self.delete_order_invoice(id:)
      order = HTTParty.delete("#{@api_url}order_invoices/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end

    def self.get_order_invoice(id:)
      order = HTTParty.get("#{@api_url}order_invoices/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end

    ###### ORDER PAYMENT #############################################################################################################################################

    def self.post_order_payment(
      order_reference:"",
      id_currency:,
      amount:,
      payment_method:"",
      conversion_rate:0,
      transaction_id:0,
      card_number:"",
      card_brand:"",
      card_expiration:"",
      card_holder:"",
      date_add:""
    )
      order = HTTParty.post("#{@api_url}order_payments/",
      {
          body: 
          "<prestashop>
              <order_payment>
              <id></id>   
                  <order_reference>#{order_reference}</order_reference>       
                  <id_currency>#{id_currency}</id_currency>
                  <amount>#{amount}</amount>
                  <payment_method>#{payment_method}</payment_method>
                  <conversion_rate>#{conversion_rate}</conversion_rate>
                  <transaction_id>#{transaction_id}</transaction_id>
                  <card_number>#{card_number}</card_number>
                  <card_brand>#{card_brand}</card_brand>
                  <card_expiration>#{card_expiration}</card_expiration>
                  <card_holder>#{card_holder}</card_holder>
                  <date_add>#{date_add}</date_add>
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

    def self.update_order_payment(
      id:,
      order_reference:"",
      id_currency:,
      amount:,
      payment_method:"",
      conversion_rate:0,
      transaction_id:0,
      card_number:"",
      card_brand:"",
      card_expiration:"",
      card_holder:"",
      date_add:""
    )
      order = HTTParty.put("#{@api_url}order_payments/#{id}",
      {
          body: 
          "<prestashop>
              <order_payment>
              <id>#{id}</id>   
                  <order_reference>#{order_reference}</order_reference>       
                  <id_currency>#{id_currency}</id_currency>
                  <amount>#{amount}</amount>
                  <payment_method>#{payment_method}</payment_method>
                  <conversion_rate>#{conversion_rate}</conversion_rate>
                  <transaction_id>#{transaction_id}</transaction_id>
                  <card_number>#{card_number}</card_number>
                  <card_brand>#{card_brand}</card_brand>
                  <card_expiration>#{card_expiration}</card_expiration>
                  <card_holder>#{card_holder}</card_holder>
                  <date_add>#{date_add}</date_add>
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

    def self.delete_order_payment(id:)
      order = HTTParty.delete("#{@api_url}order_payments/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end

    def self.get_order_payment(id:)
      order = HTTParty.get("#{@api_url}order_payments/#{id}",
      {
          basic_auth: @auth
      })
      puts order.body,order.code
    end


    ##### ORDER SLIP ###################################################################################################################################################

    def self.post_order_slip(
      id_customer:,
      id_order:,
      conversion_rate:,
      total_products_tax_excl:,
      total_products_tax_incl:,
      total_shipping_tax_excl:,
      total_shipping_tax_incl:,
      amount:0,
      shipping_cost:0,
      shipping_cost_amount:0,
      partial:0,
      date_add:"",
      date_upd:"",
      order_slip_type:0,
      id_order_detail:0,
      product_quantity:0,
      amount_tax_excl:0,
      amount_tax_incl:0
    )
      ord = HTTParty.post("#{@api_url}order_slip/",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_slip>
            <id></id>
            <id_customer>#{id_customer}</id_customer>
            <id_order>#{id_order}</id_order>
            <conversion_rate>#{conversion_rate}</conversion_rate>
            <total_products_tax_excl>#{total_products_tax_excl}</total_products_tax_excl>
            <total_products_tax_incl>#{total_products_tax_incl}</total_products_tax_incl>
            <total_shipping_tax_excl>#{total_shipping_tax_excl}</total_shipping_tax_excl>
            <total_shipping_tax_incl>#{total_shipping_tax_incl}</total_shipping_tax_incl>
            <amount>#{amount}</amount>
            <shipping_cost>#{shipping_cost}</shipping_cost>
            <shipping_cost_amount>#{shipping_cost_amount}</shipping_cost_amount>
            <partial>#{partial}</partial>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <order_slip_type>#{order_slip_type}</order_slip_type>
            <associations>
              <order_slip_details>
                <order_slip_detail>
                  <id></id>
                  <id_order_detail>#{id_order_detail}</id_order_detail>
                  <product_quantity>#{product_quantity}</product_quantity>
                  <amount_tax_excl>#{amount_tax_excl}</amount_tax_excl>
                  <amount_tax_incl>#{amount_tax_incl}</amount_tax_incl>
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

    def self.update_order_slip(
      id:,
      id_customer:,
      id_order:,
      conversion_rate:,
      total_products_tax_excl:,
      total_products_tax_incl:,
      total_shipping_tax_excl:,
      total_shipping_tax_incl:,
      amount:0,
      shipping_cost:0,
      shipping_cost_amount:0,
      partial:0,
      date_add:"",
      date_upd:"",
      order_slip_type:0,
      id_order_detail:0,
      product_quantity:0,
      amount_tax_excl:0,
      amount_tax_incl:0
    )
      ord = HTTParty.put("#{@api_url}order_slip/#{id}",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_slip>
            <id>#{id}</id>
            <id_customer>#{id_customer}</id_customer>
            <id_order>#{id_order}</id_order>
            <conversion_rate>#{conversion_rate}</conversion_rate>
            <total_products_tax_excl>#{total_products_tax_excl}</total_products_tax_excl>
            <total_products_tax_incl>#{total_products_tax_incl}</total_products_tax_incl>
            <total_shipping_tax_excl>#{total_shipping_tax_excl}</total_shipping_tax_excl>
            <total_shipping_tax_incl>#{total_shipping_tax_incl}</total_shipping_tax_incl>
            <amount>#{amount}</amount>
            <shipping_cost>#{shipping_cost}</shipping_cost>
            <shipping_cost_amount>#{shipping_cost_amount}</shipping_cost_amount>
            <partial>#{partial}</partial>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <order_slip_type>#{order_slip_type}</order_slip_type>
            <associations>
              <order_slip_details>
                <order_slip_detail>
                  <id></id>
                  <id_order_detail>#{id_order_detail}</id_order_detail>
                  <product_quantity>#{product_quantity}</product_quantity>
                  <amount_tax_excl>#{amount_tax_excl}</amount_tax_excl>
                  <amount_tax_incl>#{amount_tax_incl}</amount_tax_incl>
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

    def self.delete_order_slip(id:)
      ord = HTTParty.delete("#{@api_url}order_slip/#{id}",
      {
        basic_auth: @auth 
      })
      puts ord.body, ord.code
    end

    def self.get_order_slip(id:)
      ord = HTTParty.get("#{@api_url}order_slip/#{id}",
      {
        basic_auth: @auth 
      })
      puts ord.body, ord.code
    end


    ##### ORDER_STATES ############################################################################################################################################

    def self.post_order_states(
      unremovable:0,
      delivery:0,
      hidden:0,
      send_email:0,
      module_name:"",
      invoice:0,
      color:"",
      logable::0,
      shipped:0,
      paid:0,
      pdf_delivery:0,
      pdf_invoice:0,
      deleted:0,
      name:,
      template:""
    )
      ord = HTTParty.post("#{@api_url}order_states/",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_state>
            <id></id>
            <unremovable>#{unremovable}</unremovable>
            <delivery>#{delivery}</delivery>
            <hidden>#{hidden}</hidden>
            <send_email>#{send_email}</send_email>
            <module_name>#{module_name}</module_name>
            <invoice>#{invoice}</invoice>
            <color>#{color}</color>
            <logable>#{logable}</logable>
            <shipped>#{shipped}</shipped>
            <paid>#{paid}</paid>
            <pdf_delivery>#{pdf_delivery}</pdf_delivery>
            <pdf_invoice>#{pdf_invoice}</pdf_invoice>
            <deleted>#{deleted}</deleted>
            <name>
              <language id=\"1\">#{name}</language>
            </name>
            <template>
              <language id=\"1\">#{template}</language>
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

    def self.update_order_states(
      id:,
      unremovable:0,
      delivery:0,
      hidden:0,
      send_email:0,
      module_name:"",
      invoice:0,
      color:"",
      logable::0,
      shipped:0,
      paid:0,
      pdf_delivery:0,
      pdf_invoice:0,
      deleted:0,
      name:,
      template:""
    )
      ord = HTTParty.put("#{@api_url}order_states/#{id}",
      {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <order_state>
            <id>#{id}</id>
            <unremovable>#{unre}</unremovable>
            <delivery>#{delivery}</delivery>
            <hidden>#{hidden}</hidden>
            <send_email>#{send_email}</send_email>
            <module_name>#{module_name}</module_name>
            <invoice>#{invoice}</invoice>
            <color>#{color}</color>
            <logable>#{logable}</logable>
            <shipped>#{shipped}</shipped>
            <paid>#{paid}</paid>
            <pdf_delivery>#{pdf_delivery}</pdf_delivery>
            <pdf_invoice>#{pdf_invoice}</pdf_invoice>
            <deleted>#{deleted}</deleted>
            <name>
              <language id=\"1\">#{name}</language>
            </name>
            <template>
              <language id=\"1\">#{template}</language>
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

    def self.delete_order_states(id:)
      ord = HTTParty.delete("#{@api_url}order_states/#{id}",
      {
        basic_auth: @auth  
      })
      puts ord.body, ord.code

    end

    def self.get_order_states(id:)
      ord = HTTParty.get("#{@api_url}order_states/#{id}",
      {
        basic_auth: @auth  
      })
      puts ord.body, ord.code

    end

    ###### ORDERS ####################################################################################################################################################

    def self.post_order(
        id_address_delivery:,
        id_address_invoice:,
        id_cart:,
        id_currency:,
        id_lang:,
        id_customer:,
        id_carrier:,
        current_state:0,
        module:,
        invoice_number: 0,
        invoice_date:"",
        delivery_number: 0,
        delivery_date: "",
        valid: 0,
        date_add: "",
        date_upd: "",
        shipping_number: "",
        note: "",
        id_shop_group: 1,
        id_shop: 1,
        secure_key: "",
        payment:,
        recyclable: 0,
        gift: 0,
        gift_message: "",
        mobile_theme: 0,
        total_discounts: "",
        total_discounts_tax_incl: "",
        total_discounts_tax_excl: "",
        total_paid:,
        total_paid_tax_incl: "",
        total_paid_tax_excl: "",
        total_paid_real:,
        total_products:,
        total_products_wt:,
        total_shipping: "",
        total_shipping_tax_incl: "",
        total_shipping_tax_excl: "",
        carrier_tax_rate: "",
        total_wrapping: "",
        total_wrapping_tax_incl: "",
        total_wrapping_tax_excl: "",
        round_mode: 0,
        round_type: 0,
        conversion_rate:,
        reference: "",
        product_id: 0,
        product_attribute_id: 0,
        product_quantity: 0,
        product_name: "",
        product_reference: "",
        product_ean13: "",
        product_isbn:"",
        product_upc:"",
        product_price: "",
        id_customization: 0 ,
        unit_price_tax_incl: "",
        unit_price_tax_excl: ""
    )
      ord  = HTTParty.post("#{@api_url}orders/",
          {
              body:
              "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
              <order>
                  <id></id>
                  <id_address_delivery>#{id_address_delivery}</id_address_delivery>
                  <id_address_invoice>#{id_address_invoice}</id_address_invoice>
                  <id_cart>#{id_cart}</id_cart>
                  <id_currency>#{id_currency}</id_currency>
                  <id_lang>#{id_lang}</id_lang>
                  <id_customer>#{id_customer}</id_customer>
                  <id_carrier>#{id_carrier}</id_carrier>
                  <current_state>#{current_state}</current_state>
                  <module>#{module}</module>
                  <invoice_number>#{invoice_number}</invoice_number>
                  <invoice_date>#{invoice_date}</invoice_date>
                  <delivery_number>#{delivery_number}</delivery_number>
                  <delivery_date>#{delivery_date}</delivery_date>
                  <valid>#{valid}</valid>
                  <date_add>#{date_add}</date_add>
                  <date_upd>#{date_upd}</date_upd>
                  <shipping_number>#{shipping_number}</shipping_number>
                  <note>#{note}</note>
                  <id_shop_group>#{id_shop_group}</id_shop_group>
                  <id_shop>#{id_shop}</id_shop>
                  <secure_key>#{secure_key}</secure_key>
                  <payment>#{payment}</payment>
                  <recyclable>#{recyclable}</recyclable>
                  <gift>#{gift}</gift>
                  <gift_message>#{gift_message}</gift_message>
                  <mobile_theme>#{mobile_theme}</mobile_theme>
                  <total_discounts>#{total_discounts}</total_discounts>
                  <total_discounts_tax_incl>#{total_discounts_tax_incl}</total_discounts_tax_incl>
                  <total_discounts_tax_excl>#{total_discounts_tax_excl}</total_discounts_tax_excl>
                  <total_paid>#{total_paid}</total_paid>
                  <total_paid_tax_incl>#{total_paid_tax_incl}</total_paid_tax_incl>
                  <total_paid_tax_excl>#{total_paid_tax_excl}</total_paid_tax_excl>
                  <total_paid_real>#{total_paid_real}</total_paid_real>
                  <total_products>#{total_products}</total_products>
                  <total_products_wt>#{total_products_wt}</total_products_wt>
                  <total_shipping>#{total_shipping}</total_shipping>
                  <total_shipping_tax_incl>#{total_shipping_tax_incl}</total_shipping_tax_incl>
                  <total_shipping_tax_excl>#{total_shipping_tax_excl}</total_shipping_tax_excl>
                  <carrier_tax_rate>#{carrier_tax_rate}</carrier_tax_rate>
                  <total_wrapping>#{total_wrapping}</total_wrapping>
                  <total_wrapping_tax_incl>#{total_wrapping_tax_incl}</total_wrapping_tax_incl>
                  <total_wrapping_tax_excl>#{total_wrapping_tax_excl}</total_wrapping_tax_excl>
                  <round_mode>#{round_mode}</round_mode>
                  <round_type>#{round_type}</round_type>
                  <conversion_rate>#{conversion_rate}</conversion_rate>
                  <reference>#{reference}</reference>
                  <associations>
                      <order_rows>
                          <order_row>
                          <id></id>
                          <product_id>#{product_id}</product_id>
                          <product_attribute_id>#{product_attribute_id}</product_attribute_id>
                          <product_quantity>#{product_quantity}</product_quantity>
                          <product_name>#{product_name}</product_name>
                          <product_reference>#{product_reference}</product_reference>
                          <product_ean13>#{product_ean13}</product_ean13>
                          <product_isbn>#{product_isbn}</product_isbn>
                          <product_upc>#{product_upc}</product_upc>
                          <product_price>#{product_price}</product_price>
                          <id_customization>#{id_customization}</id_customization>
                          <unit_price_tax_incl>#{unit_price_tax_incl}</unit_price_tax_incl>
                          <unit_price_tax_excl>#{unit_price_tax_excl}</unit_price_tax_excl>
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

    def self.update_order(
        id:,
        id_address_delivery:,
        id_address_invoice:,
        id_cart:,
        id_currency:,
        id_lang:,
        id_customer:,
        id_carrier:,
        current_state:0,
        module:,
        invoice_number: 0,
        invoice_date:"",
        delivery_number: 0,
        delivery_date: "",
        valid: 0,
        date_add: "",
        date_upd: "",
        shipping_number: "",
        note: "",
        id_shop_group: 1,
        id_shop: 1,
        secure_key: "",
        payment:,
        recyclable: 0,
        gift: 0,
        gift_message: "",
        mobile_theme: 0,
        total_discounts: "",
        total_discounts_tax_incl: "",
        total_discounts_tax_excl: "",
        total_paid:,
        total_paid_tax_incl: "",
        total_paid_tax_excl: "",
        total_paid_real:,
        total_products:,
        total_products_wt:,
        total_shipping: "",
        total_shipping_tax_incl: "",
        total_shipping_tax_excl: "",
        carrier_tax_rate: "",
        total_wrapping: "",
        total_wrapping_tax_incl: "",
        total_wrapping_tax_excl: "",
        round_mode: 0,
        round_type: 0,
        conversion_rate:,
        reference: "",
        product_id: 0,
        product_attribute_id: 0,
        product_quantity: 0,
        product_name: "",
        product_reference: "",
        product_ean13: "",
        product_isbn:"",
        product_upc:"",
        product_price: "",
        id_customization: 0 ,
        unit_price_tax_incl: "",
        unit_price_tax_excl: ""
    )
      ord  = HTTParty.put("#{@api_url}orders/#{id}",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <order>
                <id>#{id}</id>
                <id_address_delivery>#{id_address_delivery}</id_address_delivery>
                <id_address_invoice>#{id_address_invoice}</id_address_invoice>
                <id_cart>#{id_cart}</id_cart>
                <id_currency>#{id_currency}</id_currency>
                <id_lang>#{id_lang}</id_lang>
                <id_customer>#{id_customer}</id_customer>
                <id_carrier>#{id_carrier}</id_carrier>
                <current_state>#{current_state}</current_state>
                <module>#{module}</module>
                <invoice_number>#{invoice_number}</invoice_number>
                <invoice_date>#{invoice_date}</invoice_date>
                <delivery_number>#{delivery_number}</delivery_number>
                <delivery_date>#{delivery_date}</delivery_date>
                <valid>#{valid}</valid>
                <date_add>#{date_add}</date_add>
                <date_upd>#{date_upd}</date_upd>
                <shipping_number>#{shipping_number}</shipping_number>
                <note>#{note}</note>
                <id_shop_group>#{id_shop_group}</id_shop_group>
                <id_shop>#{id_shop}</id_shop>
                <secure_key>#{secure_key}</secure_key>
                <payment>#{payment}</payment>
                <recyclable>#{recyclable}</recyclable>
                <gift>#{gift}</gift>
                <gift_message>#{gift_message}</gift_message>
                <mobile_theme>#{mobile_theme}</mobile_theme>
                <total_discounts>#{total_discounts}</total_discounts>
                <total_discounts_tax_incl>#{total_discounts_tax_incl}</total_discounts_tax_incl>
                <total_discounts_tax_excl>#{total_discounts_tax_excl}</total_discounts_tax_excl>
                <total_paid>#{total_paid}</total_paid>
                <total_paid_tax_incl>#{total_paid_tax_incl}</total_paid_tax_incl>
                <total_paid_tax_excl>#{total_paid_tax_excl}</total_paid_tax_excl>
                <total_paid_real>#{total_paid_real}</total_paid_real>
                <total_products>#{total_products}</total_products>
                <total_products_wt>#{total_products_wt}</total_products_wt>
                <total_shipping>#{total_shipping}</total_shipping>
                <total_shipping_tax_incl>#{total_shipping_tax_incl}</total_shipping_tax_incl>
                <total_shipping_tax_excl>#{total_shipping_tax_excl}</total_shipping_tax_excl>
                <carrier_tax_rate>#{carrier_tax_rate}</carrier_tax_rate>
                <total_wrapping>#{total_wrapping}</total_wrapping>
                <total_wrapping_tax_incl>#{total_wrapping_tax_incl}</total_wrapping_tax_incl>
                <total_wrapping_tax_excl>#{total_wrapping_tax_excl}</total_wrapping_tax_excl>
                <round_mode>#{round_mode}</round_mode>
                <round_type>#{round_type}</round_type>
                <conversion_rate>#{conversion_rate}</conversion_rate>
                <reference>#{reference}</reference>
                <associations>
                    <order_rows>
                        <order_row>
                        <id></id>
                        <product_id>#{product_id}</product_id>
                        <product_attribute_id>#{product_attribute_id}</product_attribute_id>
                        <product_quantity>#{product_quantity}</product_quantity>
                        <product_name>#{product_name}</product_name>
                        <product_reference>#{product_reference}</product_reference>
                        <product_ean13>#{product_ean13}</product_ean13>
                        <product_isbn>#{product_isbn}</product_isbn>
                        <product_upc>#{product_upc}</product_upc>
                        <product_price>#{product_price}</product_price>
                        <id_customization>#{id_customization}</id_customization>
                        <unit_price_tax_incl>#{unit_price_tax_incl}</unit_price_tax_incl>
                        <unit_price_tax_excl>#{unit_price_tax_excl}</unit_price_tax_excl>
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

    def self.delete_order(id:)
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

    def self.get_order(id:)
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

    def self.post_price_ranges(
      id_carrier:,
      delimiter1:,
      delimiter2:
    )
      sup = HTTParty.post("#{@api_url}price_ranges/",
      {
        body:
        "<prestashop>
          <price_range>
            <id></id>
            <id_carrier>#{id_carrier}</id_carrier>
            <delimiter1>#{delimiter1}</delimiter1>
            <delimiter2>#{delimiter2}</delimiter2>
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

    def self.update_price_ranges(
      id:,
      id_carrier:,
      delimiter1:,
      delimiter2:
    )
      sup = HTTParty.put("#{@api_url}price_ranges/#{id}",
      {
        body:
        "<prestashop>
          <price_range>
            <id>#{id}</id>
            <id_carrier>#{id_carrier}</id_carrier>
            <delimiter1>#{delimiter1}</delimiter1>
            <delimiter2>#{delimiter2}</delimiter2>
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

    def self.get_price_ranges(id:)
      sup = HTTParty.get("#{@api_url}price_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    def self.delete_price_ranges(id:)
      sup = HTTParty.delete("#{@api_url}price_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts sup.body,sup.code
    end

    ##### PRODUCT CUSTOMIZATION FIELD ###################################################################################################################################

    def self.post_product_customization_field(
      id_product:,
      type:,
      required:,
      is_module:0,
      is_deleted:0,
      name:
    )
      prod_cust_field = HTTParty.post("#{@api_url}product_customization_fields/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <customization_field>
            <id></id>
            <id_product>#{id_product}</id_product>
            <type>#{type}</type>
            <required>#{required}</required>
            <is_module>#{is_module}</is_module>
            <is_deleted>#{is_deleted}</is_deleted>
            <name>
              <language id=\"1\">#{name}</language>
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

  def self.update_product_customization_field(
    id:,
    id_product:,
    type:,
    required:,
    is_module:0,
    is_deleted:0,
    name:
  )
    prod_cust_field = HTTParty.put("#{@api_url}product_customization_fields/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <customization_field>
          <id>#{id}</id>
          <id_product>#{id_product}</id_product>
          <type>#{type}</type>
          <required>#{required}</required>
          <is_module>#{is_module}</is_module>
          <is_deleted>#{is_deleted}</is_deleted>
          <name>
            <language id=\"1\">#{name}</language>
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

  def self.delete_product_customization_field(id:)
    prod_cust_field = HTTParty.delete("#{@api_url}product_customization_fields/#{id}",
    {
      basic_auth: @auth
    })
    puts prod_cust_field.body,prod_cust_field.code
  end

  def self.get_product_customization_field(id:)
    prod_cust_field = HTTParty.get("#{@api_url}product_customization_fields/#{id}",
    {
      basic_auth: @auth
    })
    puts prod_cust_field.body,prod_cust_field.code
  end

  ##### PRODUCT FEATURE VALUES #######################################################################################################################################

  def self.post_product_feature_values(
    id_feature:,
    custom:0,
    value:
  )
      prod_feat_val = HTTParty.post("#{@api_url}product_feature_values/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <product_feature_value>
            <id></id>
            <id_feature>#{id_feature}</id_feature>
            <custom>#{custom}</custom>
            <value>
              <language id=\"1\">#{value}</language>
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

  def self.update_product_feature_values(
    id:,
    id_feature:,
    custom:0,
    value:
  )
    prod_feat_val = HTTParty.put("#{@api_url}product_feature_values/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <product_feature_value>
          <id>#{id}</id>
          <id_feature>#{id_feature}</id_feature>
          <custom>#{custom}</custom>
          <value>
            <language id=\"1\">#{value}</language>
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

  def self.delete_product_feature_values(id:)
    prod_feat_val = HTTParty.delete("#{@api_url}product_feature_values/#{id}",
    {
      basic_auth: @auth
    })
    puts prod_feat_val.body,prod_feat_val.code
  end

  def self.get_product_feature_values(id:)
    prod_feat_val = HTTParty.get("#{@api_url}product_feature_values/#{id}",
    {
      basic_auth: @auth
    })
    puts prod_feat_val.body,prod_feat_val.code
  end

  ##### PRODUCT FEATURES #############################################################################################################################################

  def self.post_product_features(
    position:0,
    name:
  )
      prod_feat = HTTParty.post("#{@api_url}product_features/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <product_feature>
            <id></id>
            <position>#{position}</position>
            <name>
              <language id=\"1\">#{name}</language>
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

  def self.update_product_features(
    id:,
    position:0,
    name:
  )
    prod_feat = HTTParty.put("#{@api_url}product_features/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <product_feature>
          <id>#{id}</id>
          <position>#{position}</position>
          <name>
            <language id=\"1\">#{name}</language>
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

  def self.delete_product_features(id:)
    prod_feat = HTTParty.delete("#{@api_url}product_features/#{id}",
    {
      basic_auth: @auth
    })
    puts prod_feat.body,prod_feat.code
  end

  def self.get_product_features(id:)
    prod_feat = HTTParty.get("#{@api_url}product_features/#{id}",
    {
      basic_auth: @auth
    })
    puts prod_feat.body,prod_feat.code
  end

  ##### PRODUCT OPTIONS VALUES ########################################################################################################################################

  def self.post_product_options_values(
    id_attribute_group:,
    color:"",
    position:0,
    name:
  )
      prod_opt_val = HTTParty.post("#{@api_url}product_option_values",
      {
          body: 
          "<prestashop>
              <product_option_value>
              <id></id>
                  <id_attribute_group>#{id_attribute_group}</id_attribute_group>
                  <color>#{color}</color>
                  <position>#{position}</position>
                  <name>
                  <language id=\"1\">#{name}</language>
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

  def self.update_product_options_values(
    id:,
    id_attribute_group:,
    color:"",
    position:0,
    name:
  )
    prod_opt_val = HTTParty.put("#{@api_url}product_option_values/#{id}",
    {
        body: 
        "<prestashop>
            <product_option_value>
            <id>#{id}</id>
                <id_attribute_group>#{id_attribute_group}</id_attribute_group>
                <color>#{color}</color>
                <position>#{position}</position>
                <name>
                <language id=\"1\">#{name}</language>
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

  def self.delete_product_options_values(id:)
    prod_opt_val = HTTParty.delete("#{@api_url}product_option_values/#{id}",
    {
        basic_auth: @auth
    })
    puts prod_opt_val.body,prod_opt_val.code
  end

  def self.get_product_options_values(id:)
    prod_opt_val = HTTParty.get("#{@api_url}product_option_values/#{id}",
    {
        basic_auth: @auth
    })
    puts prod_opt_val.body,prod_opt_val.code
  end


   ##### PRODUCTS OPTIONS ###########################################################################################################################################

   def self.post_product_options(
    is_color_group:0,
    group_type:,
    position:0,
    name:,
    public_name:,
    product_option_value_id:0
   )
    prod_opt = HTTParty.post("#{@api_url}product_options/",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <product_option>
          <id></id>
          <is_color_group>#{is_color_group}</is_color_group>
          <group_type>#{group_type}</group_type>
          <position>#{position}</position>
          <name>
            <language id=\"1\">#{name}</language>
          </name>
          <public_name>
            <language id=\"1\">#{public_name}</language>
          </public_name>
          <associations>
            <product_option_values>
              <product_option_value>
                <id>#{product_option_value_id}</id>
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

  def self.update_product_options(
    id:,
    is_color_group:0,
    group_type:,
    position:0,
    name:,
    public_name:,
    product_option_value_id:0
  )
    prod_opt = HTTParty.put("#{@api_url}product_options/#{id}",
    {
        body:
        "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
        <product_option>
          <id>#{id}</id>
          <is_color_group>#{is_color_group}</is_color_group>
          <group_type>#{group_type}</group_type>
          <position>#{position}</position>
          <name>
            <language id=\"1\">#{name}</language>
          </name>
          <public_name>
            <language id=\"1\">#{public_name}</language>
          </public_name>
          <associations>
            <product_option_values>
              <product_option_value>
                <id>#{product_option_value}</id>
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

  def self.delete_product_options(id:)
    prod_opt = HTTParty.delete("#{@api_url}product_options/#{id}",
    {
      basic_auth: @auth
  })
  puts prod_opt.body,prod_opt.code
  end

  def self.get_product_options(id:)
    prod_opt = HTTParty.get("#{@api_url}product_options/#{id}",
    {
      basic_auth: @auth
  })
  puts prod_opt.body,prod_opt.code
  end

  ##### PRODUCT SUPPLIERS #############################################################################################################################################

  def self.post_product_suppliers(
    id_product:,
    id_product_attribute:,
    id_supplier:,
    id_currency:1,
    product_supplier_reference:"",
    product_supplier_price_te:0
  )
      prod_sup = HTTParty.post("#{@api_url}product_suppliers/",
      {
          body: 
              "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
              <product_suppliers>
              <id></id>
              <id_product>#{id_product}</id_product>
              <id_product_attribute>#{id_product_attribute}</id_product_attribute>
              <id_supplier>#{id_supplier}</id_supplier>
              <id_currency>#{id_currency}</id_currency>
              <product_supplier_reference>#{product_supplier_reference}</product_supplier_reference>
              <product_supplier_price_te>#{product_supplier_price_te}</product_supplier_price_te>
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

  def self.update_product_suppliers(
    id:,
    id_product:,
    id_product_attribute:,
    id_supplier:,
    id_currency:1,
    product_supplier_reference:"",
    product_supplier_price_te:0
  )
    prod_sup = HTTParty.put("#{@api_url}product_suppliers/#{id}",
    {
        body: 
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <product_suppliers>
            <id>#{id}</id>
            <id_product>#{id_product}</id_product>
            <id_product_attribute>#{id_product_attribute}</id_product_attribute>
            <id_supplier>#{id_supplier}</id_supplier>
            <id_currency>#{id_currency}</id_currency>
            <product_supplier_reference>#{product_supplier_reference}</product_supplier_reference>
            <product_supplier_price_te>#{product_supplier_price_te}</product_supplier_price_te>
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

  def self.delete_product_suppliers(id:)
    prod_sup = HTTParty.delete("#{@api_url}product_suppliers/#{id}",
    {
        basic_auth: @auth
    })
    puts prod_sup.body,prod_sup.code
  end

  def self.get_product_suppliers(id:)
    prod_sup = HTTParty.get("#{@api_url}product_suppliers/#{id}",
    {
        basic_auth: @auth
    })
    puts prod_sup.body,prod_sup.code
  end



  ##### PRODUCT #################################################################################################################################################

  # def self.post_product(product)
  def self.post_product(
        id_manufacturer: 0,
        id_supplier: 0,
        id_category_default:0,
        new:"",
        cache_default_attribute:0,
        id_default_image:'',
        id_default_combination:0,
        id_tax_rules_group:0,
        position_in_category: "",
        type:"",
        id_shop_default:1,
        reference: "",
        supplier_reference:"",
        location:"",
        width: 0,
        height:0,
        depth:0,
        weight:0,
        quantity_discount:0,
        ean13: "",
        isbn: "",
        upc:"",
        mpn:"",
        cache_is_pack:0,
        cache_has_attachments:0,
        is_virtual:0,
        state:0,
        additional_delivery_times:0,
        delivery_in_stock:"",
        delivery_out_stock:"",
        product_type: "",
        on_sale:0,
        online_only:0,
        ecotax:0,
        minimal_quantity:1,
        low_stock_threshold:0,
        low_stock_alert:0,
        price:,
        wholesale_price:0,
        unity:"",
        unit_price_ratio:0,
        additional_shipping_cost:0,
        customizable:0,
        text_fields:0,
        uploadable_files:0,
        active:0,
        redirect_type:"",
        id_type_redirected:0,
        available_for_order:0,
        available_date:"",
        show_condition:0,
        condition:"",
        show_price:0,
        indexed:0,
        visibility:"",
        advanced_stock_management:0,
        date_add:"",
        date_upd:"",
        pack_stock_type:0,
        meta_description:"",
        meta_keywords:"",
        meta_title:"",
        link_rewrite:"",
        name:"",
        description:"",
        description_short:"",
        available_now:"",
        available_later:"",
        available_later1:"",
        category_id:0,
        image_id:0,
        combination_id:0,
        product_option_value_id:0,
        product_features_id:0,
        product_feature_values_id:0,
        tag_id:0,
        stock_available_id:0,
        stock_available_id_product_attribute:0,
        attachment_id:0,
        product_accessories_id:0,
        product_bundle_id:0,
        product_attribute_id:0,
        quantity:0
  )
      prod = HTTParty.post("#{@api_url}products/",
      {
          body:
          "<prestashop xmlns:ns0=\"http://www.w3.org/1999/xlink\">
               <product>
                  <id></id>
                  <id_manufacturer>#{id_manufacturer}</id_manufacturer>
                  <id_supplier>#{id_supplier}</id_supplier>
                  <id_category_default>#{id_category_default}</id_category_default>
                  <new>#{new}</new>
                  <cache_default_attribute>#{cache_default_attribute}</cache_default_attribute>
                  <id_default_image notFilterable=\"true\">#{id_default_image}</id_default_image>
                  <id_default_combination notFilterable=\"true\">#{id_default_combination}</id_default_combination>
                  <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
                  <position_in_category>#{position_in_category}</position_in_category>
                  <type notFilterable=\"true\">#{type}</type>
                  <id_shop_default>#{id_shop_default}</id_shop_default>
                  <reference>#{reference}</reference>
                  <supplier_reference>#{supplier_reference}</supplier_reference>
                  <location>#{location}</location>
                  <width>#{width}</width>
                  <height>#{height}</height>
                  <depth>#{depth}</depth>
                  <weight>#{weight}</weight>
                  <quantity_discount>#{quantity_discount}</quantity_discount>
                  <ean13>#{ean13}</ean13>
                  <isbn>#{isbn}</isbn>
                  <upc>#{upc}</upc>
                  <mpn>#{mpn}</mpn>
                  <cache_is_pack>#{cache_is_pack}</cache_is_pack>
                  <cache_has_attachments>#{cache_has_attachments}</cache_has_attachments>
                  <is_virtual>#{is_virtual}</is_virtual>
                  <state>#{state}</state>
                  <additional_delivery_times>#{additional_delivery_times}</additional_delivery_times>
                  <delivery_in_stock>
                      <language id=\"1\">#{delivery_in_stock}</language>
                  </delivery_in_stock>
                  <delivery_out_stock>
                      <language id=\"1\">#{delivery_out_stock}</language>
                  </delivery_out_stock>
                  <product_type>#{product_type}</product_type>
                  <on_sale>#{on_sale}</on_sale>
                  <online_only>#{online_only}</online_only>
                  <ecotax>#{ecotax}</ecotax>
                  <minimal_quantity>#{minimal_quantity}</minimal_quantity>
                  <low_stock_threshold>#{low_stock_threshold}</low_stock_threshold>
                  <low_stock_alert>#{low_stock_alert}</low_stock_alert>
                  <price>#{price}</price>
                  <wholesale_price>#{wholesale_price}</wholesale_price>
                  <unity>#{unity}</unity>
                  <unit_price_ratio>#{unit_price_ratio}</unit_price_ratio>
                  <additional_shipping_cost>#{additional_shipping_cost}</additional_shipping_cost>
                  <customizable>#{customizable}</customizable>
                  <text_fields>#{text_fields}</text_fields>
                  <uploadable_files>#{uploadable_files}</uploadable_files>
                  <active>#{active}</active>
                  <redirect_type>#{redirect_type}</redirect_type>
                  <id_type_redirected>#{id_type_redirected}</id_type_redirected>
                  <available_for_order>#{available_for_order}</available_for_order>
                  <available_date>#{available_date}</available_date>
                  <show_condition>#{show_condition}</show_condition>
                  <condition>#{condition}</condition>
                  <show_price>#{show_price}</show_price>
                  <indexed>#{indexed}</indexed>
                  <visibility>#{visibility}</visibility>
                  <advanced_stock_management>#{advanced_stock_management}</advanced_stock_management>
                  <date_add>#{date_add}</date_add>
                  <date_upd>#{date_upd}</date_upd>
                  <pack_stock_type>#{pack_stock_type}</pack_stock_type>
                  <meta_description>
                      <language id=\"1\">#{meta_description}</language>
                  </meta_description>
                  <meta_keywords>
                      <language id=\"1\">#{meta_keywords}</language>
                  </meta_keywords>
                  <meta_title>
                      <language id=\"1\">#{meta_title}</language>
                  </meta_title>
                  <link_rewrite>
                      <language id=\"1\">#{link_rewrite}</language>
                  </link_rewrite>
                  <name>
                      <language id=\"1\">#{name}</language>
                  </name>
                  <description>
                      <language id=\"1\">#{desciption}</language>
                  </description>
                  <description_short>
                      <language id=\"1\">#{description_short}</language>
                  </description_short>
                  <available_now>
                      <language id=\"1\">#{available_now}</language>
                  </available_now>
                  <available_later>
                       <language id=\"1\">#{available_later}</language>
                  </available_later>
                  <associations>
                      <categories nodeType=\"category\" api=\"categories\">
                        <category>
                          <id>#{category_id}</id>
                        </category>
                      </categories>
                      <images nodeType=\"image\" api=\"images\">
                        <image>
                          <id> #{image_id}</id>
                        </image>
                      </images>
                      <combinations nodeType=\"combination\" api=\"combinations\">
                        <combination>
                          <id>#{combination_id}</id>
                         </combination>
                      </combinations>
                      <product_option_values nodeType=\"product_option_value\" api=\"product_option_values\">
                        <product_option_value>
                          <id>#{product_option_value_id}</id>
                        </product_option_value>
                      </product_option_values>
                      <product_features nodeType=\"product_feature\" api=\"product_features\">
                        <product_feature>
                          <id>#{product_features_id}</id>
                          <id_feature_value>#{product_feature_values_id}</id_feature_value>
                        </product_feature>
                      </product_features>
                      <tags nodeType=\"tag\" api=\"tags\">
                        <tag>
                          <id>#{tag_id}</id>
                        </tag>
                      </tags>
                      <stock_availables nodeType=\"stock_available\" api=\"stock_availables\">
                        <stock_available>
                          <id>#{stock_available_id}</id>
                          <id_product_attribute>#{stock_available_id_product_attribute}</id_product_attribute>
                        </stock_available>
                      </stock_availables>
                      <attachments nodeType=\"attachment\" api=\"attachments\">
                        <attachment>
                          <id>#{attachment_id}</id>
                        </attachment>
                      </attachments>
                      <accessories nodeType=\"product\" api=\"products\">
                        <product>
                          <id>#{product_accessories_id}</id>
                        </product>
                      </accessories>
                      <product_bundle nodeType=\"product\" api=\"products\">
                        <product>
                          <id>#{product_bundle_id}</id>
                          <id_product_attribute>#{product_attribute_id}</id_product_attribute>
                          <quantity>#{quantity}</quantity>
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

  def self.update_product(
    id:,
    id_manufacturer: 0,
    id_supplier: 0,
    id_category_default:0,
    new:"",
    cache_default_attribute:0,
    id_default_image:'',
    id_default_combination:0,
    id_tax_rules_group:0,
    position_in_category: "",
    type:"",
    id_shop_default:1,
    reference: "",
    supplier_reference:"",
    location:"",
    width: 0,
    height:0,
    depth:0,
    weight:0,
    quantity_discount:0,
    ean13: "",
    isbn: "",
    upc:"",
    mpn:"",
    cache_is_pack:0,
    cache_has_attachments:0,
    is_virtual:0,
    state:0,
    additional_delivery_times:0,
    delivery_in_stock:"",
    delivery_out_stock:"",
    product_type: "",
    on_sale:0,
    online_only:0,
    ecotax:0,
    minimal_quantity:1,
    low_stock_threshold:0,
    low_stock_alert:0,
    price:,
    wholesale_price:0,
    unity:"",
    unit_price_ratio:0,
    additional_shipping_cost:0,
    customizable:0,
    text_fields:0,
    uploadable_files:0,
    active:0,
    redirect_type:"",
    id_type_redirected:0,
    available_for_order:0,
    available_date:"",
    show_condition:0,
    condition:"",
    show_price:0,
    indexed:0,
    visibility:"",
    advanced_stock_management:0,
    date_add:"",
    date_upd:"",
    pack_stock_type:0,
    meta_description:"",
    meta_keywords:"",
    meta_title:"",
    link_rewrite:"",
    name:"",
    description:"",
    description_short:"",
    available_now:"",
    available_later:"",
    available_later1:"",
    category_id:0,
    image_id:0,
    combination_id:0,
    product_option_value_id:0,
    product_features_id:0,
    product_feature_values_id:0,
    tag_id:0,
    stock_available_id:0,
    stock_available_id_product_attribute:0,
    attachment_id:0,
    product_accessories_id:0,
    product_bundle_id:0,
    product_attribute_id:0,
    quantity:0
  )
      prod = HTTParty.put("#{@api_url}products/#{id}",
      {
        body:"<prestashop xmlns:ns0=\"http://www.w3.org/1999/xlink\">
        <product>
           <id>#{id}</id>
           <id_manufacturer>#{id_manufacturer}</id_manufacturer>
           <id_supplier>#{id_supplier}</id_supplier>
           <id_category_default>#{id_category_default}</id_category_default>
           <new>#{new}</new>
           <cache_default_attribute>#{cache_default_attribute}</cache_default_attribute>
           <id_default_image notFilterable=\"true\">#{id_default_image}</id_default_image>
           <id_default_combination notFilterable=\"true\">#{id_default_combination}</id_default_combination>
           <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
           <type notFilterable=\"true\">#{type}</type>
           <id_shop_default>#{id_shop_default}</id_shop_default>
           <reference>#{reference}</reference>
           <supplier_reference>#{supplier_reference}</supplier_reference>
           <location>#{location}</location>
           <width>#{width}</width>
           <height>#{height}</height>
           <depth>#{depth}</depth>
           <weight>#{weight}</weight>
           <quantity_discount>#{quantity_discount}</quantity_discount>
           <ean13>#{ean13}</ean13>
           <isbn>#{isbn}</isbn>
           <upc>#{upc}</upc>
           <mpn>#{mpn}</mpn>
           <cache_is_pack>#{cache_is_pack}</cache_is_pack>
           <cache_has_attachments>#{cache_has_attachments}</cache_has_attachments>
           <is_virtual>#{is_virtual}</is_virtual>
           <state>#{state}</state>
           <additional_delivery_times>#{additional_delivery_times}</additional_delivery_times>
           <delivery_in_stock>
               <language id=\"1\">#{delivery_in_stock}</language>
           </delivery_in_stock>
           <delivery_out_stock>
               <language id=\"1\">#{delivery_out_stock}</language>
           </delivery_out_stock>
           <product_type>#{product_type}</product_type>
           <on_sale>#{on_sale}</on_sale>
           <online_only>#{online_only}</online_only>
           <ecotax>#{ecotax}</ecotax>
           <minimal_quantity>#{minimal_quantity}</minimal_quantity>
           <low_stock_threshold>#{low_stock_threshold}</low_stock_threshold>
           <low_stock_alert>#{low_stock_alert}</low_stock_alert>
           <price>#{price}</price>
           <wholesale_price>#{wholesale_price}</wholesale_price>
           <unity>#{unity}</unity>
           <unit_price_ratio>#{unit_price_ratio}</unit_price_ratio>
           <additional_shipping_cost>#{additional_shipping_cost}</additional_shipping_cost>
           <customizable>#{customizable}</customizable>
           <text_fields>#{text_fields}</text_fields>
           <uploadable_files>#{uploadable_files}</uploadable_files>
           <active>#{active}</active>
           <redirect_type>#{redirect_type}</redirect_type>
           <id_type_redirected>#{id_type_redirected}</id_type_redirected>
           <available_for_order>#{available_for_order}</available_for_order>
           <available_date>#{available_date}</available_date>
           <show_condition>#{show_condition}</show_condition>
           <condition>#{condition}</condition>
           <show_price>#{show_price}</show_price>
           <indexed>#{indexed}</indexed>
           <visibility>#{visibility}</visibility>
           <advanced_stock_management>#{advanced_stock_management}</advanced_stock_management>
           <date_add>#{date_add}</date_add>
           <date_upd>#{date_upd}</date_upd>
           <pack_stock_type>#{pack_stock_type}</pack_stock_type>
           <meta_description>
               <language id=\"1\">#{meta_description}</language>
           </meta_description>
           <meta_keywords>
               <language id=\"1\">#{meta_keywords}</language>
           </meta_keywords>
           <meta_title>
               <language id=\"1\">#{meta_title}</language>
           </meta_title>
           <link_rewrite>
               <language id=\"1\">#{link_rewrite}</language>
           </link_rewrite>
           <name>
               <language id=\"1\">#{name}</language>
           </name>
           <description>
               <language id=\"1\">#{desciption}</language>
           </description>
           <description_short>
               <language id=\"1\">#{description_short}</language>
           </description_short>
           <available_now>
               <language id=\"1\">#{available_now}</language>
           </available_now>
           <available_later>
                <language id=\"1\">#{available_later}</language>
           </available_later>
           <associations>
               <categories nodeType=\"category\" api=\"categories\">
                 <category>
                   <id>#{category_id}</id>
                 </category>
               </categories>
               <images nodeType=\"image\" api=\"images\">
                 <image>
                   <id> #{image_id}</id>
                 </image>
               </images>
               <combinations nodeType=\"combination\" api=\"combinations\">
                 <combination>
                   <id>#{combination_id}</id>
                  </combination>
               </combinations>
               <product_option_values nodeType=\"product_option_value\" api=\"product_option_values\">
                 <product_option_value>
                   <id>#{product_option_value_id}</id>
                 </product_option_value>
               </product_option_values>
               <product_features nodeType=\"product_feature\" api=\"product_features\">
                 <product_feature>
                   <id>#{product_features_id}</id>
                   <id_feature_value>#{product_feature_values_id}</id_feature_value>
                 </product_feature>
               </product_features>
               <tags nodeType=\"tag\" api=\"tags\">
                 <tag>
                   <id>#{tag_id}</id>
                 </tag>
               </tags>
               <stock_availables nodeType=\"stock_available\" api=\"stock_availables\">
                 <stock_available>
                   <id>#{stock_available_id}</id>
                   <id_product_attribute>#{stock_available_id_product_attribute}</id_product_attribute>
                 </stock_available>
               </stock_availables>
               <attachments nodeType=\"attachment\" api=\"attachments\">
                 <attachment>
                   <id>#{attachment_id}</id>
                 </attachment>
               </attachments>
               <accessories nodeType=\"product\" api=\"products\">
                 <product>
                   <id>#{product_accessories_id}</id>
                 </product>
               </accessories>
               <product_bundle nodeType=\"product\" api=\"products\">
                 <product>
                   <id>#{product_bundle_id}</id>
                   <id_product_attribute>#{product_attribute_id}</id_product_attribute>
                   <quantity>#{quantity}</quantity>
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

    def self.delete_product(id:)
        prod = HTTParty.delete("#{@api_url}products/#{id}",
          basic_auth: @auth
        )
        puts prod.body, prod.code
    end

    def self.get_product(id:)
      prod = HTTParty.get("#{@api_url}products/#{id}", basic_auth: @auth )
      puts prod.body, prod.code
  end

  ##### SHOP GROUPS #####################################################################################################################################################################

  def self.post_shop_groups(
    name:,
    color:"",
    share_customer:0,
    share_order:0,
    share_stock:0,
    active:0,
    deleted:0
  )
    sup = HTTParty.post("#{@api_url}shop_groups/",
    {
      body:
      "<prestashop>
        <shop_group>
          <id></id>
          <name>#{name}</name>
          <color>#{color}</color>
          <share_customer>#{share_customer}</share_customer>
          <share_order>#{share_order}</share_order>
          <share_stock>#{share_stock}</share_stock>
          <active>#{active}</active>
          <deleted>#{deleted}</deleted>
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

  def self.update_shop_groups(
    id:,
    name:,
    color:"",
    share_customer:0,
    share_order:0,
    share_stock:0,
    active:0,
    deleted:0
  )
    sup = HTTParty.put("#{@api_url}shop_groups/#{id}",
    {
      body:
      "<prestashop>
        <shop_group>
          <id>#{id}</id>
          <name>#{name}</name>
          <color>#{color}</color>
          <share_customer>#{share_customer}</share_customer>
          <share_order>#{share_order}</share_order>
          <share_stock>#{share_stock}</share_stock>
          <active>#{active}</active>
          <deleted>#{deleted}</deleted>
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

  def self.get_shop_groups(id:)
    sup = HTTParty.get("#{@api_url}shop_groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_shop_groups(id:)
    sup = HTTParty.delete("#{@api_url}shop_groups/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### SHOP URLS ######################################################################################################################################################################

  def self.post_shop_urls(
    id_shop:,
    active:0,
    main:0,
    domain:"",
    domain_ssl:"",
    physical_uri:"",
    virtual_uri:""
  )
    sup = HTTParty.post("#{@api_url}shop_urls/",
    {
      body:
      "<prestashop>
        <shop_url>
          <id></id>
          <id_shop>#{id_shop}</id_shop>
          <active>#{active}</active>
          <main>#{main}</main>
          <domain>#{domain}</domain>
          <domain_ssl>#{domain_ssl}</domain_ssl>
          <physical_uri>#{physical_uri}</physical_uri>
          <virtual_uri>#{virtual_uri}</virtual_uri>
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

  def self.update_shop_urls(
    id:,
    id_shop:,
    active:0,
    main:0,
    domain:"",
    domain_ssl:"",
    physical_uri:"",
    virtual_uri:""
  )
    sup = HTTParty.put("#{@api_url}shop_urls/#{id}",
    {
      body:
      "<prestashop>
        <shop_url>
          <id>#{id}</id>
          <id_shop>#{id_shop}</id_shop>
          <active>#{active}</active>
          <main>#{main}</main>
          <domain>#{domain}</domain>
          <domain_ssl>#{domain_ssl}</domain_ssl>
          <physical_uri>#{physical_uri}</physical_uri>
          <virtual_uri>#{virtual_uri}</virtual_uri>
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

  def self.get_shop_urls(id:)
    sup = HTTParty.get("#{@api_url}shop_urls/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_shop_urls(id:)
    sup = HTTParty.delete("#{@api_url}shop_urls/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SHOPS ##########################################################################################################################################################################

  def self.post_shops(
    id_shop_group:,
    id_category:,
    active:0,
    deleted:0,
    name:,
    color:"",
    theme_name:""
  )
    sup = HTTParty.post("#{@api_url}shops/",
    {
      body:
      "<prestashop>
        <shop>
        <id></id>
        <id_shop_group>#{id_shop_group}</id_shop_group>
        <id_category>#{id_category}</id_category>
        <active>#{active}</active>
        <deleted>#{deleted}</deleted>
        <name>#{name}</name>
        <color>#{color}</color>
        <theme_name>#{theme_name}</theme_name>
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

  def self.update_shops(
    id:,
    id_shop_group:,
    id_category:,
    active:0,
    deleted:0,
    name:,
    color:"",
    theme_name:""
  )
    sup = HTTParty.put("#{@api_url}shops/#{id}",
    {
      body:
      "<prestashop>
        <shop>
        <id>#{id}</id>
        <id_shop_group>#{id_shop_group}</id_shop_group>
        <id_category>#{id_category}</id_category>
        <active>#{active}</active>
        <deleted>#{deleted}</deleted>
        <name>#{name}</name>
        <color>#{color}</color>
        <theme_name>#{theme_name}</theme_name>
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

  def self.get_shops(id:)
    sup = HTTParty.get("#{@api_url}shops/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_shops(id:)
    sup = HTTParty.delete("#{@api_url}shops/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### SPECIFIC PRICE RULES ###########################################################################################################################################################

  def self.post_specific_price_rules(
    id_shop:,
    id_country:,
    id_currency:,
    id_group:,
    name:,
    from_quantity:,
    price:,
    reduction:,
    reduction_tax:,
    reduction_type:,
    from:"",
    to:""
  )
    sup = HTTParty.post("#{@api_url}specific_price_rules/",
    {
      body:
      "<prestashop>
        <specific_price_rule>
          <id></id>
          <id_shop>#{id_shop}</id_shop>
          <id_country>#{id_country}</id_country>
          <id_currency>#{id_currency}</id_currency>
          <id_group>#{id_group}</id_group>
          <name>#{name}</name>
          <from_quantity>#{from_quantity}</from_quantity>
          <price>#{price}</price>
          <reduction>#{reduction}</reduction>
          <reduction_tax>#{reduction_tax}</reduction_tax>
          <reduction_type>#{reduction_type}</reduction_type>
          <from>#{from}</from>
          <to>#{to}</to>
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

  def self.update_specific_price_rules(
    id:,
    id_shop:,
    id_country:,
    id_currency:,
    id_group:,
    name:,
    from_quantity:,
    price:,
    reduction:,
    reduction_tax:,
    reduction_type:,
    from:"",
    to:""
  )
    sup = HTTParty.put("#{@api_url}specific_price_rules/#{id}",
    {
      body:
      "<prestashop>
        <specific_price_rule>
          <id>#{id}</id>
          <id_shop>#{id_shop}</id_shop>
          <id_country>#{id_country}</id_country>
          <id_currency>#{id_currency}</id_currency>
          <id_group>#{id_group}</id_group>
          <name>#{name}</name>
          <from_quantity>#{from_quantity}</from_quantity>
          <price>#{price}</price>
          <reduction>#{reduction}</reduction>
          <reduction_tax>#{reduction_tax}</reduction_tax>
          <reduction_type>#{reduction_type}</reduction_type>
          <from>#{from}</from>
          <to>#{to}</to>
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

  def self.get_specific_price_rules(id:)
    sup = HTTParty.get("#{@api_url}specific_price_rules/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_specific_price_rules(id:)
    sup = HTTParty.delete("#{@api_url}specific_price_rules/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SPECIFIC PRICES ################################################################################################################################################################

  def self.post_specific_prices(
    id_shop_group:1,
    id_shop:,
    id_cart:,
    id_product:,
    id_product_attribute:0,
    id_currency:,
    id_country:,
    id_group:,
    id_customer:,
    id_specific_price_rule:0,
    price:,
    from_quantity:,
    reduction:,
    reduction_tax:,
    reduction_type:,
    from:,
    to:
  )
    sup = HTTParty.post("#{@api_url}specific_prices/",
    {
      body:
      "<prestashop>
        <specific_price>
          <id></id>
          <id_shop_group>#{id_shop_group}</id_shop_group>
          <id_shop>#{id_shop}</id_shop>
          <id_cart>#{id_cart}</id_cart>
          <id_product>#{id_product}</id_product>
          <id_product_attribute>#{id_product_attribute}</id_product_attribute>
          <id_currency>#{id_currency}</id_currency>
          <id_country>#{id_country}</id_country>
          <id_group>#{id_group}</id_group>
          <id_customer>#{id_customer}</id_customer>
          <id_specific_price_rule>#{id_specific_price_rule}</id_specific_price_rule>
          <price>#{price}</price>
          <from_quantity>#{from_quantity}</from_quantity>
          <reduction>#{reduction}</reduction>
          <reduction_tax>#{reduction_tax}</reduction_tax>
          <reduction_type>#{reduction_type}</reduction_type>
          <from>#{from}</from>
          <to>#{to}</to>
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

  def self.update_specific_prices(
    id:,
    id_shop_group:1,
    id_shop:,
    id_cart:,
    id_product:,
    id_product_attribute:0,
    id_currency:,
    id_country:,
    id_group:,
    id_customer:,
    id_specific_price_rule:0,
    price:,
    from_quantity:,
    reduction:,
    reduction_tax:,
    reduction_type:,
    from:,
    to:
  )
    sup = HTTParty.put("#{@api_url}specific_prices/#{id}",
    {
      body:
      "<prestashop>
        <specific_price>
          <id>#{id}</id>
          <id_shop_group>#{id_shop_group}</id_shop_group>
          <id_shop>#{id_shop}</id_shop>
          <id_cart>#{id_cart}</id_cart>
          <id_product>#{id_product}</id_product>
          <id_product_attribute>#{id_product_attribute}</id_product_attribute>
          <id_currency>#{id_currency}</id_currency>
          <id_country>#{id_country}</id_country>
          <id_group>#{id_group}</id_group>
          <id_customer>#{id_customer}</id_customer>
          <id_specific_price_rule>#{id_specific_price_rule}</id_specific_price_rule>
          <price>#{price}</price>
          <from_quantity>#{from_quantity}</from_quantity>
          <reduction>#{reduction}</reduction>
          <reduction_tax>#{reduction_tax}</reduction_tax>
          <reduction_type>#{reduction_type}</reduction_type>
          <from>#{from}</from>
          <to>#{to}</to>
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

  def self.get_specific_prices(id:)
    sup = HTTParty.get("#{@api_url}specific_prices/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_specific_prices(id:)
    sup = HTTParty.delete("#{@api_url}specific_prices/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

   ##### STATES #########################################################################################################################################################################

   def self.post_states(
    id_zone:,
    id_country:,
    iso_code:,
    name:,
    active:0
   )
    sup = HTTParty.post("#{@api_url}states/",
    {
      body:
      "<prestashop>
        <state>
          <id></id>
          <id_zone>#{id_zone}</id_zone>
          <id_country>#{id_country}</id_country>
          <iso_code>#{iso_code}</iso_code>
          <name>#{name}</name>
          <active>#{active}</active>
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

  def self.update_states(
    id:,
    id_zone:,
    id_country:,
    iso_code:,
    name:,
    active:0
  )
    sup = HTTParty.put("#{@api_url}states/#{id}",
    {
      body:
      "<prestashop>
        <state>
          <id>#{id}</id>
          <id_zone>#{id_zone}</id_zone>
          <id_country>#{id_country}</id_country>
          <iso_code>#{iso_code}</iso_code>
          <name>#{name}</name>
          <active>#{active}</active>
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

  def self.get_states(id:)
    sup = HTTParty.get("#{@api_url}states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_states(id:)
    sup = HTTParty.delete("#{@api_url}states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

   ##### STOCK AVAILABLES #############################################################################################################################################################

   def self.post_stock_availables(
    id_product:,
    id_product_attribute:,
    id_shop:1,
    id_shop_group:1,
    quantity:,
    depends_on_stock:,
    out_of_stock:,
    location:""
   )
    sup = HTTParty.post("#{@api_url}stock_movements/",
    {
      body:
      "<prestashop>
        <stock_available>
          <id></id>
          <id_product>#{id_product}</id_product>
          <id_product_attribute>#{id_product_attribute}</id_product_attribute>
          <id_shop>#{id_shop}</id_shop>
          <id_shop_group>#{id_shop_group}</id_shop_group>
          <quantity>#{quantity}</quantity>
          <depends_on_stock>#{depends_on_stock}</depends_on_stock>
          <out_of_stock>#{out_of_stock}</out_of_stock>
          <location>#{location}</location>
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

  def self.update_stock_availables(
    id:,
    id_product:,
    id_product_attribute:,
    id_shop:1,
    id_shop_group:1,
    quantity:,
    depends_on_stock:,
    out_of_stock:,
    location:""
  )
    sup = HTTParty.put("#{@api_url}stock_movements/#{id}",
    {
      body:
      "<prestashop>
        <stock_available>
          <id>#{id}</id>
          <id_product>#{id_product}</id_product>
          <id_product_attribute>#{id_product_attribute}</id_product_attribute>
          <id_shop>#{id_shop}</id_shop>
          <id_shop_group>#{id_shop_group}</id_shop_group>
          <quantity>#{quantity}</quantity>
          <depends_on_stock>#{depends_on_stock}</depends_on_stock>
          <out_of_stock>#{out_of_stock}</out_of_stock>
          <location>#{location}</location>
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

  def self.get_stock_availables(id:)
    sup = HTTParty.get("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stock_availables(id:)
    sup = HTTParty.delete("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### STOCK MOVEMENT REASONS #########################################################################################################################################################

  def self.post_stock_movement_reasons(
    sign:"",
    deleted:"",
    date_add:"",
    date_upd:"",
    name:
  )
    sup = HTTParty.post("#{@api_url}stock_movement_reasons/",
    {
      body:
      "<prestashop>
        <stock_movement_reason>
          <id></id>
          <sign>#{sign}</sign>
          <deleted>#{deleted}</deleted>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <name>
           <language id=\"1\">#{name}</language>
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

  def self.update_stock_movement_reasons(
    id:,
    sign:"",
    deleted:"",
    date_add:"",
    date_upd:"",
    name:
  )
    sup = HTTParty.put("#{@api_url}stock_movement_reasons/#{id}",
    {
      body:
      "<prestashop>
        <stock_movement_reason>
          <id>#{id}</id>
          <sign>#{sign}</sign>
          <deleted>#{deleted}</deleted>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <name>
           <language id=\"1\">#{name}</language>
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

  def self.get_stock_movement_reasons(id:)
    sup = HTTParty.get("#{@api_url}stock_movement_reasons/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stock_movement_reasons(id:)
    sup = HTTParty.delete("#{@api_url}stock_movement_reasons/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### STOCK MOVEMENTS ###############################################################################################################################################################

  def self.post_stock_movements(
    id_product:0,
    id_product_attribute:0,
    id_warehouse:0,
    id_currency:0,
    management_type:"",
    id_employee:,
    id_stock:,
    id_stock_mvt_reason:,
    id_order:0,
    id_supply_order:0,
    product_name_id:0,
    ean13:"",
    upc:"",
    reference:"",
    mpn:"",
    physical_quantity:0,
    sign:0,
    last_wa:0,
    current_wa:0,
    price_te:0,
    date_add:""
  )
    sup = HTTParty.post("#{@api_url}stock_movements/",
    {
      body:
      "<prestashop>
        <stock_mvt>
        <id></id>
        <id_product>#{id_product}</id_product>
        <id_product_attribute>#{id_product_attribute}</id_product_attribute>
        <id_warehouse>#{id_warehouse}</id_warehouse>
        <id_currency>#{id_currency}</id_currency>
        <management_type>#{management_type}</management_type>
        <id_employee>#{id_employee}</id_employee>
        <id_stock>#{id_stock}</id_stock>
        <id_stock_mvt_reason>#{id_stock_mvt_reason}</id_stock_mvt_reason>
        <id_order>#{id_order}</id_order>
        <id_supply_order>#{id_supply_order}</id_supply_order>
        <product_name>
          <language id=\"1\">#{product_name_id}</language>
        </product_name>
        <ean13>#{ean13}</ean13>
        <upc>#{upc}</upc>
        <reference>#{reference}</reference>
        <mpn>#{mpn}</mpn>
        <physical_quantity>#{physical_quantity}</physical_quantity>
        <sign>#{sign}</sign>
        <last_wa>#{last_wa}</last_wa>
        <current_wa>#{current_wa}</current_wa>
        <price_te>#{price_te}</price_te>
        <date_add>#{date_add}</date_add>
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

  def self.update_stock_movements(
    id:,
    id_product:0,
    id_product_attribute:0,
    id_warehouse:0,
    id_currency:0,
    management_type:"",
    id_employee:,
    id_stock:,
    id_stock_mvt_reason:,
    id_order:0,
    id_supply_order:0,
    product_name_id:0,
    ean13:"",
    upc:"",
    reference:"",
    mpn:"",
    physical_quantity:0,
    sign:0,
    last_wa:0,
    current_wa:0,
    price_te:0,
    date_add:""
  )
    sup = HTTParty.put("#{@api_url}stock_movements/#{id}",
    {
      body:
      "<prestashop>
        <stock_mvt>
        <id>#{id}</id>
        <id_product>#{id_product}</id_product>
        <id_product_attribute>#{id_product_attribute}</id_product_attribute>
        <id_warehouse>#{id_warehouse}</id_warehouse>
        <id_currency>#{id_currency}</id_currency>
        <management_type>#{management_type}</management_type>
        <id_employee>#{id_employee}</id_employee>
        <id_stock>#{id_stock}</id_stock>
        <id_stock_mvt_reason>#{id_stock_mvt_reason}</id_stock_mvt_reason>
        <id_order>#{id_order}</id_order>
        <id_supply_order>#{id_supply_order}</id_supply_order>
        <product_name>
          <language id=\"1\">#{product_name_id}</language>
        </product_name>
        <ean13>#{ean13}</ean13>
        <upc>#{upc}</upc>
        <reference>#{reference}</reference>
        <mpn>#{mpn}</mpn>
        <physical_quantity>#{physical_quantity}</physical_quantity>
        <sign>#{sign}</sign>
        <last_wa>#{last_wa}</last_wa>       
        <current_wa>#{current_wa}</current_wa>
        <price_te>#{price_te}</price_te>
        <date_add>#{date_add}</date_add>
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

  def self.get_stock_movements(id:)
    sup = HTTParty.get("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stock_movements(id:)
    sup = HTTParty.delete("#{@api_url}stock_movements/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


  ##### STOCKS ########################################################################################################################################################################

  def self.post_stocks(
    id_warehouse:,
    id_product:,
    id_product_attribute:,
    reference:"",
    ean13:"",
    isbn:"",
    upc:"",
    mpn:"",
    physical_quantity:0,
    usable_quantity:0,
    price_te:0
  )
    sup = HTTParty.post("#{@api_url}stocks/",
    {
      body:
      "<prestashop>
        <stock>
        <id></id>
        <id_warehouse>#{id_warehouse}</id_warehouse>
        <id_product>#{id_product}<</id_product>
        <id_product_attribute>#{id_product_attribute}<</id_product_attribute>
        <reference>#{reference}<</reference>
        <ean13>#{ean13}<</ean13>
        <isbn>#{isbn}<</isbn>
        <upc>#{upc}<</upc>
        <mpn>#{mpn}<</mpn>
        <physical_quantity>#{physical_quantity}<</physical_quantity>
        <usable_quantity>#{usable_quantity}<</usable_quantity>
        <price_te>#{price_te}<</price_te>
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

  def self.update_stocks(
    id:,
    id_warehouse:,
    id_product:,
    id_product_attribute:,
    reference:"",
    ean13:"",
    isbn:"",
    upc:"",
    mpn:"",
    physical_quantity:0,
    usable_quantity:0,
    price_te:0
  )
    sup = HTTParty.post("#{@api_url}stocks/#{id}",
    {
      body:
      "<prestashop>
        <stock>
        <id>#{id}</id>
        <id_warehouse>#{id_warehouse}</id_warehouse>
        <id_product>#{id_product}<</id_product>
        <id_product_attribute>#{id_product_attribute}<</id_product_attribute>
        <reference>#{reference}<</reference>
        <ean13>#{ean13}<</ean13>
        <isbn>#{isbn}<</isbn>
        <upc>#{upc}<</upc>
        <mpn>#{mpn}<</mpn>
        <physical_quantity>#{physical_quantity}<</physical_quantity>
        <usable_quantity>#{usable_quantity}<</usable_quantity>
        <price_te>#{price_te}<</price_te>
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

  def self.get_stocks(id:)
    sup = HTTParty.get("#{@api_url}stocks/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stocks(id:)
    sup = HTTParty.delete("#{@api_url}stocks/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### STORES ########################################################################################################################################################################

  def self.post_stores(
    id_country:,
    id_state:0,
    hours:"",
    postcode:"",
    city:,
    latitude:"",
    longitude:"",
    phone:"",
    fax:"",
    active:,
    date_add:"",
    date_upd:"",
    name:,
    address1:,
    address2:"",
    note:""
  )
    sup = HTTParty.post("#{@api_url}stores/",
    {
      body:
      "<prestashop>
      <store>
      <id></id>
      <id_country>#{id_country}</id_country>
      <id_state>#{id_state}</id_state>
      <hours>
        <language id=\"1\">#{hours}</language>
      </hours>
      <postcode>#{postcode}</postcode>
      <city>#{city}</city>
      <latitude>#{latitude}</latitude>
      <longitude>#{longitude}</longitude>
      <phone>#{phone}</phone>
      <fax>#{fax}</fax>
      <email>#{email}</email>
      <active>#{active}</active>
      <date_add>#{date_add}</date_add>
      <date_upd>#{date_upd}</date_upd>
      <name>
      <language id=\"1\">#{name}</language>
      </name>
      <address1>
      <language id=\"1\">#{address1}</language>
      </address1>
      <address2>
      <language id=\"1\">#{address2}</language>
      </address2>
      <note>
      <language id=\"1\">#{note}</language>
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

  def self.update_stores(
    id:,
    id_country:,
    id_state:0,
    hours:"",
    postcode:"",
    city:,
    latitude:"",
    longitude:"",
    phone:"",
    fax:"",
    active:,
    date_add:"",
    date_upd:"",
    name:,
    address1:,
    address2:"",
    note:""
  )
    sup = HTTParty.put("#{@api_url}stores/#{id}",
    {
      body:
      "<prestashop>
      <store>
      <id>#{id}</id>
      <id_country>#{id_country}</id_country>
      <id_state>#{id_state}</id_state>
      <hours>
        <language id=\"1\">#{hours}</language>
      </hours>
      <postcode>#{postcode}</postcode>
      <city>#{city}</city>
      <latitude>#{latitude}</latitude>
      <longitude>#{longitude}</longitude>
      <phone>#{phone}</phone>
      <fax>#{fax}</fax>
      <email>#{email}</email>
      <active>#{active}</active>
      <date_add>#{date_add}</date_add>
      <date_upd>#{date_upd}</date_upd>
      <name>
      <language id=\"1\">#{name}</language>
      </name>
      <address1>
      <language id=\"1\">#{address1}</language>
      </address1>
      <address2>
      <language id=\"1\">#{address2}</language>
      </address2>
      <note>
      <language id=\"1\">#{note}</language>
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

  def self.get_stores(id:)
    sup = HTTParty.get("#{@api_url}stores/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_stores(id:)
    sup = HTTParty.delete("#{@api_url}stores/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLIERS ######################################################################################################################################################################

  def self.post_supplier(
    link_rewrite="",
    name=,
    active=0,
    date_add="",
    date_upd="",
    description="",
    meta_title="",
    meta_description="",
    meta_keywords=""
  )
    sup = HTTParty.post("#{@api_url}suppliers/",
    {
      body:
      "<prestashop>
        <supplier>
          <id></id>
          <link_rewrite>#{link_rewrite}</link_rewrite>
          <name>#{name}</name>
          <active>#{active}</active>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <description>
          <language id=\"1\">#{description}</language>
          </description>
          <meta_title>
          <language id=\"1\">#{meta_title}</language>
          </meta_title>
          <meta_description>
          <language id=\"1\">#{meta_description}</language>
          </meta_description>
          <meta_keywords>
          <language id=\"1\">#{meta_keywords}</language>
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

  def self.update_supplier(
    id:,
    link_rewrite="",
    name=,
    active=0,
    date_add="",
    date_upd="",
    description="",
    meta_title="",
    meta_description="",
    meta_keywords=""
)
    sup = HTTParty.put("#{@api_url}suppliers/#{id}",
    {
      body:
      "<prestashop>
        <supplier>
          <id>#{id}</id>
          <link_rewrite>#{link_rewrite}</link_rewrite>
          <name>#{name}</name>
          <active>#{active}</active>
          <date_add>#{date_add}</date_add>
          <date_upd>#{date_upd}</date_upd>
          <description>
          <language id=\"1\">#{description}</language>
          </description>
          <meta_title>
          <language id=\"1\">#{meta_title}</language>
          </meta_title>
          <meta_description>
          <language id=\"1\">#{meta_description}</language>
          </meta_description>
          <meta_keywords>
          <language id=\"1\">#{meta_keywords}</language>
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

  def self.get_supplier(id:)
    sup = HTTParty.get("#{@api_url}suppliers/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supplier(id:)
    sup = HTTParty.delete("#{@api_url}suppliers/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER DETAILS ###########################################################################################################################################################

  def self.post_supply_order_detail(
    id_supply_order:,
    id_product:,
    id_product_attribute:,
    reference:"",
    supplier_reference:"",
    name:,
    ean13:"",
    isbn:"",
    upc:"",
    mpn:"",
    exchange_rate:0,
    unit_price_te:0,
    quantity_expected:0,
    quantity_received:0,
    price_te:0,
    discount_rate:0,
    discount_value_te:0,
    tax_rate:0,
    tax_value:0,
    price_ti:0,
    tax_value_with_order_discount:0,
    price_with_order_discount_te:0
  )
    sup = HTTParty.post("#{@api_url}supply_order_details/",
    {
      body:
      "<prestashop>
        <supply_order_detail>
          <id></id>
          <id_supply_order>#{id_supply_order}</id_supply_order>
          <id_product>#{id_product}</id_product>
          <id_product_attribute>#{id_product_attribute}</id_product_attribute>
          <reference>#{reference}</reference>
          <supplier_reference>#{supplier_reference}</supplier_reference>
          <name>#{name}</name>
          <ean13>#{ean13}</ean13>
          <isbn>#{isbn}</isbn>
          <upc>#{upc}</upc>
          <mpn>#{mpn}</mpn>
          <exchange_rate>#{exchange_rate}</exchange_rate>
          <unit_price_te>#{unit_price_te}</unit_price_te>
          <quantity_expected>#{quantity_expected}</quantity_expected>
          <quantity_received>#{quantity_received}</quantity_received>
          <price_te>#{price_te}</price_te>
          <discount_rate>#{discount_rate}</discount_rate>
          <discount_value_te>#{discount_value_te}</discount_value_te>
          <price_with_discount_te>#{price_with_discount_te}</price_with_discount_te>
          <tax_rate>#{tax_rate}</tax_rate>
          <tax_value>#{tax_value}</tax_value>
          <price_ti>#{price_ti}</price_ti>
          <tax_value_with_order_discount>#{tax_value_with_order_discount}</tax_value_with_order_discount>
          <price_with_order_discount_te>#{price_with_order_discount_te}</price_with_order_discount_te>
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

  def self.update_supply_order_detail(
    id:,
    id_supply_order:,
    id_product:,
    id_product_attribute:,
    reference:"",
    supplier_reference:"",
    name:,
    ean13:"",
    isbn:"",
    upc:"",
    mpn:"",
    exchange_rate:0,
    unit_price_te:0,
    quantity_expected:0,
    quantity_received:0,
    price_te:0,
    discount_rate:0,
    discount_value_te:0,
    tax_rate:0,
    tax_value:0,
    price_ti:0,
    tax_value_with_order_discount:0,
    price_with_order_discount_te:0
  )
    sup = HTTParty.put("#{@api_url}supply_order_details/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_detail>
          <id>#{id}</id>
          <id_supply_order>#{id_supply_order}</id_supply_order>
          <id_product>#{id_product}</id_product>
          <id_product_attribute>#{id_product_attribute}</id_product_attribute>
          <reference>#{reference}</reference>
          <supplier_reference>#{supplier_reference}</supplier_reference>
          <name>#{name}</name>
          <ean13>#{ean13}</ean13>
          <isbn>#{isbn}</isbn>
          <upc>#{upc}</upc>
          <mpn>#{mpn}</mpn>
          <exchange_rate>#{exchange_rate}</exchange_rate>
          <unit_price_te>#{unit_price_te}</unit_price_te>
          <quantity_expected>#{quantity_expected}</quantity_expected>
          <quantity_received>#{quantity_received}</quantity_received>
          <price_te>#{price_te}</price_te>
          <discount_rate>#{discount_rate}</discount_rate>
          <discount_value_te>#{discount_value_te}</discount_value_te>
          <price_with_discount_te>#{price_with_discount_te}</price_with_discount_te>
          <tax_rate>#{tax_rate}</tax_rate>
          <tax_value>#{tax_value}</tax_value>
          <price_ti>#{price_ti}</price_ti>
          <tax_value_with_order_discount>#{tax_value_with_order_discount}</tax_value_with_order_discount>
          <price_with_order_discount_te>#{price_with_order_discount_te}</price_with_order_discount_te>
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

  def self.get_supply_order_detail(id:)
    sup = HTTParty.get("#{@api_url}supply_order_details/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_detail(id:)
    sup = HTTParty.delete("#{@api_url}supply_order_details/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER HISOTIRES #########################################################################################################################################################

  def self.post_supply_order_history(
    id_supply_order:,
    id_employee:,
    id_state:,
    employee_firstname:"",
    employee_lastname:"",
    date_add:""
  )
    sup = HTTParty.post("#{@api_url}supply_order_histories/",
    {
      body:
      "<prestashop>
        <supply_order_history>
          <id></id>
          <id_supply_order>#{id_supply_order}</id_supply_order>
          <id_employee>#{id_employee}</id_employee>
          <id_state>#{id_state}</id_state>
          <employee_firstname>#{employee_firstname}</employee_firstname>
          <employee_lastname>#{employee_lastname}</employee_lastname>
          <date_add>#{date_add}</date_add>
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

  def self.update_supply_order_history(   
    id:, 
    id_supply_order:,
    id_employee:,
    id_state:,
    employee_firstname:"",
    employee_lastname:"",
    date_add:"")
    sup = HTTParty.put("#{@api_url}supply_order_histories/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_history>
          <id>#{id}</id>
          <id_supply_order>#{id_supply_order}</id_supply_order>
          <id_employee>#{id_employee}</id_employee>
          <id_state>#{id_state}</id_state>
          <employee_firstname>#{employee_firstname}</employee_firstname>
          <employee_lastname>#{employee_lastname}</employee_lastname>
          <date_add>#{date_add}</date_add>
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

  def self.get_supply_order_history(id:)
    sup = HTTParty.get("#{@api_url}supply_order_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_history(id:)
    sup = HTTParty.delete("#{@api_url}supply_order_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER RECEIPT HISOTRIES #################################################################################################################################################

  def self.post_supply_order_receipt_history(
    id_supply_order_detail:,
    id_employee:,
    id_supply_order_state:,
    employee_firstname:"",
    employee_lastname:"",
    quantity:0,
    date_add:""
  )
    sup = HTTParty.post("#{@api_url}supply_order_receipt_histories/",
    {
      body:
      "<prestashop>
        <supply_order_receipt_history>
          <id></id>
          <id_supply_order_detail>#{id_supply_order_detail}</id_supply_order_detail>
          <id_employee>#{id_employee}</id_employee>
          <id_supply_order_state>#{id_supply_order_state}</id_supply_order_state>
          <employee_firstname>#{employee_firstname}</employee_firstname>
          <employee_lastname>#{employee_lastname}</employee_lastname>
          <quantity>#{quantity}</quantity>
          <date_add>#{date_add}</date_add>
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

  def self.update_supply_order_receipt_history(
    id:,
    id_supply_order_detail:,
    id_employee:,
    id_supply_order_state:,
    employee_firstname:"",
    employee_lastname:"",
    quantity:0,
    date_add:""
  )
    sup = HTTParty.put("#{@api_url}supply_order_receipt_histories/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_receipt_history>
          <id>#{id}</id>
          <id_supply_order_detail>#{id_supply_order_detail}</id_supply_order_detail>
          <id_employee>#{id_employee}</id_employee>
          <id_supply_order_state>#{id_supply_order_state}</id_supply_order_state>
          <employee_firstname>#{employee_firstname}</employee_firstname>
          <employee_lastname>#{employee_lastname}</employee_lastname>
          <quantity>#{quantity}</quantity>
          <date_add>#{date_add}</date_add>
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

  def self.get_supply_order_receipt_history(id:)
    sup = HTTParty.get("#{@api_url}supply_order_receipt_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_receipt_history(id:)
    sup = HTTParty.delete("#{@api_url}supply_order_receipt_histories/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER STATES ############################################################################################################################################################

  def self.post_supply_order_states(
    delivery_note:0,
    editable:0,
    receipt_state:0,
    pending_receipt:0,
    enclosed:0,
    color:"",
    name:
  )
    sup = HTTParty.post("#{@api_url}supply_order_states/",
    {
      body:
      "<prestashop>
        <supply_order_state>
          <id></id>
          <delivery_note>#{delivery_note}</delivery_note>
          <editable>#{editable}</editable>
          <receipt_state>#{receipt_state}</receipt_state>
          <pending_receipt>#{pending_receipt}</pending_receipt>
          <enclosed>#{enclosed}</enclosed>
          <color>#{color}</color>
          <name>
          <language id=\"1\">#{name}</language>
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

  def self.update_supply_order_states(
    id:,
    delivery_note:0,
    editable:0,
    receipt_state:0,
    pending_receipt:0,
    enclosed:0,
    color:"",
    name:
  )
    sup = HTTParty.put("#{@api_url}supply_order_states/#{id}",
    {
      body:
      "<prestashop>
        <supply_order_state>
          <id>#{id}</id>
          <delivery_note>#{delivery_note}</delivery_note>
          <editable>#{editable}</editable>
          <receipt_state>#{receipt_state}</receipt_state>
          <pending_receipt>#{pending_receipt}</pending_receipt>
          <enclosed>#{enclosed}</enclosed>
          <color>#{color}</color>
          <name>
          <language id=\"1\">#{name}</language>
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

  def self.get_supply_order_states(id:)
    sup = HTTParty.get("#{@api_url}supply_order_states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_order_states(id:)
    sup = HTTParty.delete("#{@api_url}supply_order_states/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  ##### SUPPLY ORDER ###################################################################################################################################################################
   
  def self.post_supply_orders(
    id_supplier:,
    id_lang:,
    id_warehouse:,
    id_supply_order_state:,
    id_currency:,
    supplier_name:"",
    reference:,
    date_delivery_expected:,
    total_te:0,
    total_with_discount_te:0,
    total_ti:0,
    total_tax:0,
    discount_rate:0,
    discount_value_te:0,
    is_template:0,
    date_add:0,
    date_upd:0,
    supply_order_detail_id:0,
    supply_order_detail_id_product:0,
    supply_order_detail_id_product_attribute:0,
    supply_order_detail_supplier_reference:"",
    supply_order_detail_product_name:""
  )
    sup = HTTParty.post("#{@api_url}supply_orders/",
    {
      body:
      "<prestashop>
        <supply_order>
        <id></id>
        <id_supplier>#{id_supplier}</id_supplier>
        <id_lang>#{id_lang}</id_lang>
        <id_warehouse>#{id_warehouse}</id_warehouse>
        <id_supply_order_state>#{id_supply_order_state}</id_supply_order_state>
        <id_currency>#{id_currency}</id_currency>
        <supplier_name>#{supplier_name}</supplier_name>
        <reference>#{reference}</reference>
        <date_delivery_expected>#{date_delivery_expected}</date_delivery_expected>
        <total_te>#{total_te}</total_te>
        <total_with_discount_te>#{total_with_discount_te}</total_with_discount_te>
        <total_ti>#{total_ti}</total_ti>
        <total_tax>#{total_tax}</total_tax>
        <discount_rate>#{discount_rate}</discount_rate>
        <discount_value_te>#{discount_value_te}</discount_value_te>
        <is_template>#{is_template}</is_template>
        <date_add>#{date_add}</date_add>
        <date_upd>#{date_upd}</date_upd>
        <associations>
          <supply_order_details>
            <supply_order_detail>
              <id>#{supply_order_detail_id}</id>
              <id_product>#{supply_order_detail_id_product}</id_product>
              <id_product_attribute>#{supply_order_detail_id_product_attribute}</id_product_attribute>
              <supplier_reference>#{supply_order_detail_supplier_reference}</supplier_reference>
              <product_name>#{supply_order_detail_product_name}</product_name>
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

  def self.update_supply_orders(
    id:,
    id_supplier:,
    id_lang:,
    id_warehouse:,
    id_supply_order_state:,
    id_currency:,
    supplier_name:"",
    reference:,
    date_delivery_expected:,
    total_te:0,
    total_with_discount_te:0,
    total_ti:0,
    total_tax:0,
    discount_rate:0,
    discount_value_te:0,
    is_template:0,
    date_add:0,
    date_upd:0,
    supply_order_detail_id:0,
    supply_order_detail_id_product:0,
    supply_order_detail_id_product_attribute:0,
    supply_order_detail_supplier_reference:"",
    supply_order_detail_product_name:""
  )
    sup = HTTParty.put("#{@api_url}supply_orders/#{id}",
    {
      body:
      "<prestashop>
        <supply_order>
        <id>#{id}</id>
        <id_supplier>#{id_supplier}</id_supplier>
        <id_lang>#{id_lang}</id_lang>
        <id_warehouse>#{id_warehouse}</id_warehouse>
        <id_supply_order_state>#{id_supply_order_state}</id_supply_order_state>
        <id_currency>#{id_currency}</id_currency>
        <supplier_name>#{supplier_name}</supplier_name>
        <reference>#{reference}</reference>
        <date_delivery_expected>#{date_delivery_expected}</date_delivery_expected>
        <total_te>#{total_te}</total_te>
        <total_with_discount_te>#{total_with_discount_te}</total_with_discount_te>
        <total_ti>#{total_ti}</total_ti>
        <total_tax>#{total_tax}</total_tax>
        <discount_rate>#{discount_rate}</discount_rate>
        <discount_value_te>#{discount_value_te}</discount_value_te>
        <is_template>#{is_template}</is_template>
        <date_add>#{date_add}</date_add>
        <date_upd>#{date_upd}</date_upd>
        <associations>
          <supply_order_details>
            <supply_order_detail>
              <id>#{supply_order_detail_id}</id>
              <id_product>#{supply_order_detail_id_product}</id_product>
              <id_product_attribute>#{supply_order_detail_id_product_attribute}</id_product_attribute>
              <supplier_reference>#{supply_order_detail_supplier_reference}</supplier_reference>
              <product_name>#{supply_order_detail_product_name}</product_name>
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

  def self.get_supply_orders(id:)
    sup = HTTParty.get("#{@api_url}supply_orders/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end

  def self.delete_supply_orders(id:)
    sup = HTTParty.delete("#{@api_url}supply_orders/#{id}",
    {
      basic_auth: @auth
    })
    puts sup.body,sup.code
  end


    ####### TAGS ####################################################################################################################################################


    def self.post_tags(
      id_lang:,
      name:
    )
        tag = HTTParty.post("#{@api_url}tags/",
        {
            body:
            "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
            <tag>
              <id></id>
              <id_lang>#{id_lang}</id_lang>
              <name>#{name}</name>
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

    def self.update_tags(
      id:,
      id_lang:,
      name:
    )
      tag = HTTParty.post("#{@api_url}tags/",
      {
          body:
          "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <tag>
            <id>#{id}</id>
            <id_lang>#{id_lang}</id_lang>
            <name>#{name}</name>
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

    
    def self.delete_tags(id:)
      tag = HTTParty.delete("#{@api_url}tags/#{id}",
        {basic_auth: @auth}
      )

    puts tag.body,tag.code
    end

    def self.get_tags(id:)
      tag = HTTParty.get("#{@api_url}tags/#{id}",
        {basic_auth: @auth}
      )

    puts tag.body,tag.code
    end

    
    ##### TAX RULE GROUPS ############################################################################################################################################

    def self.post_tax_rule_group(
      name:,
      active:0,
      deleted:0,
      date_add:"",
      date_upd:""
    )
      t = HTTParty.post("#{@api_url}tax_rule_groups/",
      {
        body:
        "<prestashop>
          <tax_rule_group>
            <id></id>
            <name>#{name}</name>
            <active>#{active}</active>
            <deleted>#{deleted}</deleted>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
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

    def self.update_tax_rule_group(
      id:,
      name:,
      active:0,
      deleted:0,
      date_add:"",
      date_upd:""
    )
      t = HTTParty.put("#{@api_url}tax_rule_groups/#{id}",
      {
        body:
        "<prestashop>
          <tax_rule_group>
            <id>#{id}</id>
            <name>#{name}</name>
            <active>#{active}</active>
            <deleted>#{deleted}</deleted>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
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

    def self.get_tax_rule_group(id:)
      t = HTTParty.get("#{@api_url}tax_rule_groups/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_tax_rule_group(id:)
      t = HTTParty.delete("#{@api_url}tax_rule_groups/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end



    ##### TAX RULES ##################################################################################################################################################

    def self.post_tax_rule(
      id_tax_rules_group:,
      id_state:0,
      id_country:,
      zipcode_from:"",
      zipcode_to:"",
      id_tax:,
      behavior:0,
      description:""
    )
      t = HTTParty.post("#{@api_url}tax_rules/",
      {
        body:
        "<prestashop>
          <tax_rule>
            <id></id>
            <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
            <id_state>#{id_state}</id_state>
            <id_country>#{id_country}</id_country>
            <zipcode_from>#{zipcode_from}</zipcode_from>
            <zipcode_to>#{zipcode_to}</zipcode_to>
            <id_tax>#{id_tax}</id_tax>
            <behavior>#{behavior}</behavior>
            <description>#{description}</description>
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

    def self.update_tax_rule(
      id:,
      id_tax_rules_group:,
      id_state:0,
      id_country:,
      zipcode_from:"",
      zipcode_to:"",
      id_tax:,
      behavior:0,
      description:""
    )
      t = HTTParty.put("#{@api_url}tax_rules/#{id}",
      {
        body:
        "<prestashop>
          <tax_rule>
            <id>#{id}</id>
            <id_tax_rules_group>#{id_tax_rules_group}</id_tax_rules_group>
            <id_state>#{id_state}</id_state>
            <id_country>#{id_country}</id_country>
            <zipcode_from>#{zipcode_from}</zipcode_from>
            <zipcode_to>#{zipcode_to}</zipcode_to>
            <id_tax>#{id_tax}</id_tax>
            <behavior>#{behavior}</behavior>
            <description>#{description}</description>
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

    def self.get_tax_rule(id:)
      t = HTTParty.get("#{@api_url}tax_rules/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_tax_rule(id:)
      t = HTTParty.delete("#{@api_url}tax_rules/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    ##### TAXES ######################################################################################################################################################

    def self.post_tax(
      rate:,
      active:0,
      deleted:0,
      name:
    )
      t = HTTParty.post("#{@api_url}taxes/",
      {
        body:
        "<prestashop>
          <tax>
            <id></id>
            <rate>#{rate}</rate>
            <active>#{active}</active>
            <deleted>#{deleted}</deleted>
            <name>
            <language id=\"1\">#{name}</language>
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

    def self.update_tax(
      id:,
      rate:,
      active:0,
      deleted:0,
      name:
    )
      t = HTTParty.put("#{@api_url}taxes/#{id}",
      {
        body:
        "<prestashop>
          <tax>
            <id>#{id}</id>
            <rate>#{rate}</rate>
            <active>#{active}</active>
            <deleted>#{deleted}</deleted>
            <name>
            <language id=\"1\">#{name}</language>
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

    def self.get_tax(id:)
      t = HTTParty.get("#{@api_url}taxes/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_tax(id:)
      t = HTTParty.delete("#{@api_url}taxes/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    ##### TRANSLATED CONFIGURATION ####################################################################################################################################################

    def self.post_translated_configurations(
      value:0,
      date_add:"",
      date_upd:"",
      name:,
      id_shop_group:1,
      id_shop:1
    )
      t = HTTParty.post("#{@api_url}translated_configurations/",
      {
        body:
        "<prestashop>
          <translated_configuration>
            <id></id>
            <value>
            <language id=\"1\">#{value}</language>
            </value>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <name>#{name}</name>
            <id_shop_group>#{id_shop_group}</id_shop_group>
            <id_shop>#{id_shop}</id_shop>
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

    def self.update_translated_configurations(
      id:,
      value:0,
      date_add:"",
      date_upd:"",
      name:,
      id_shop_group:1,
      id_shop:1
    )
      t = HTTParty.put("#{@api_url}translated_configurations/#{id}",
      {
        body:
        "<prestashop>
          <translated_configuration>
            <id>#{id}</id>
            <value>
            <language id=\"1\">#{value}</language>
            </value>
            <date_add>#{date_add}</date_add>
            <date_upd>#{date_upd}</date_upd>
            <name>#{name}</name>
            <id_shop_group>#{id_shop_group}</id_shop_group>
            <id_shop>#{id_shop}</id_shop>
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

    def self.get_translated_configurations(id:)
      t = HTTParty.get("#{@api_url}translated_configurations/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end

    def self.delete_translated_configurations(id:)
      t = HTTParty.delete("#{@api_url}translated_configurations/#{id}",
      {
        basic_auth: @auth
      })
      puts t.body,t.code
    end
 
     ##### WAREHOUSE PRODUCT LOCATION ####################################################################################################################################################

     def self.post_warehouse_product_locations(
      id_product:,
      id_product_attribute:,
      id_warehouse:,
      location:""
     )
      war = HTTParty.post("#{@api_url}warehouse_product_locations/",
      {
        body:
        "<prestashop>
          <warehouse_product_location>
            <id></id>
            <id_product>#{id_product}</id_product>
            <id_product_attribute>#{id_product_attribute}</id_product_attribute>
            <id_warehouse>#{id_warehouse}</id_warehouse>
            <location>#{location}</location>
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

    def self.update_warehouse_product_locations(
      id:,
      id_product:,
      id_product_attribute:,
      id_warehouse:,
      location:""
    )
      war = HTTParty.put("#{@api_url}warehouse_product_locations/#{id}",
      {
        body:
        "<prestashop>
          <warehouse_product_location>
            <id>#{id}</id>
            <id_product>#{id_product}</id_product>
            <id_product_attribute>#{id_product_attribute}</id_product_attribute>
            <id_warehouse>#{id_warehouse}</id_warehouse>
            <location>#{location}</location>
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

    def self.get_warehouse_product_locations(id:)
      war = HTTParty.get("#{@api_url}warehouse_product_locations/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

    def self.delete_warehouse_product_locations(id:)
      war = HTTParty.delete("#{@api_url}warehouse_product_locations/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

    ##### WAREHOUSES ####################################################################################################################################################################

    def self.post_warehouse(
      id_address:,
      id_employee:,
      id_currency:,
      deleted:0,
      reference:,
      name:,
      management_type:,
      stock_id:0,
      carrier_id:0,
      shop_id:0,
      shop_name:""
    )
      war = HTTParty.post("#{@api_url}warehouses/",
      {
        body:
        "<prestashop>
          <warehouse>
            <id></id>
            <id_address>#{id_address}</id_address>
            <id_employee>#{id_employee}</id_employee>
            <id_currency>#{id_currency}</id_currency>
            <deleted>#{deleted}</deleted>
            <reference>#{reference}</reference>
            <name>#{name}</name>
            <management_type>#{management_type}</management_type>
            <associations>
              <stocks>
                <stock>
                  <id>#{stock_id}</id>
                </stock>
              </stocks>
              <carriers>
                <carrier>
                  <id>#{carrier_id}</id>
                </carrier>
              </carriers>
              <shops>
                <shop>
                  <id>#{shop_id}</id>
                  <name>#{shop_name}</name>
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

    def self.update_warehouse(
      id:,
      id_address:,
      id_employee:,
      id_currency:,
      deleted:0,
      reference:,
      name:,
      management_type:,
      stock_id:0,
      carrier_id:0,
      shop_id:0,
      shop_name:""
    )
      war = HTTParty.put("#{@api_url}warehouses/#{id}",
      {
        body:
        "<prestashop>
          <warehouse>
            <id>#{id}</id>
            <id_address>#{id_address}</id_address>
            <id_employee>#{id_employee}</id_employee>
            <id_currency>#{id_currency}</id_currency>
            <deleted>#{deleted}</deleted>
            <reference>#{reference}</reference>
            <name>#{name}</name>
            <management_type>#{management_type}</management_type>
            <associations>
              <stocks>
                <stock>
                  <id>#{stock_id}</id>
                </stock>
              </stocks>
              <carriers>
                <carrier>
                  <id>#{carrier_id}</id>
                </carrier>
              </carriers>
              <shops>
                <shop>
                  <id>#{shop_id}</id>
                  <name>#{shop_name}</name>
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

    def self.get_warehouse(id:)
      war = HTTParty.get("#{@api_url}warehouses/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

    def self.delete_warehouse(id:)
      war = HTTParty.delete("#{@api_url}warehouses/#{id}",
      {
        basic_auth: @auth
      })
      puts war.body,war.code
    end

   
    ##### WEIGHT RANGES #################################################################################################################################################################

    def self.post_weight_range(
      id_carrier:,
      delimiter1:,
      delimiter2:
    )
      w = HTTParty.post("#{@api_url}weight_ranges/",
      {
        body:
        "<prestashop>
          <weight_range>
            <id></id>
            <id_carrier>#{id_carrier}</id_carrier>
            <delimiter1>#{delimiter1}</delimiter1>
            <delimiter2>#{delimiter2}</delimiter2>
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

    def self.update_weight_range(
      id:,
      id_carrier:,
      delimiter1:,
      delimiter2:
    )
      w = HTTParty.put("#{@api_url}weight_ranges/#{id}",
      {
        body:
        "<prestashop>
          <weight_range>
            <id>#{id}</id>
            <id_carrier>#{id_carrier}</id_carrier>
            <delimiter1>#{delimiter1}</delimiter1>
            <delimiter2>#{delimiter2}</delimiter2>
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

    def self.get_weight_range(id:)
      w = HTTParty.get("#{@api_url}weight_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts w.body,w.code
    end

    def self.delete_weight_range(id:)
      w = HTTParty.delete("#{@api_url}weight_ranges/#{id}",
      {
        basic_auth: @auth
      })
      puts w.body,w.code
    end

    ##### ZONES #########################################################################################################################################################################
    
    def self.post_zone(
      name:,
      active:0
    )
      z = HTTParty.post("#{@api_url}zones/",
      {
        body:
        "<prestashop>
          <zone>
            <id></id>
            <name>#{name}</name>
            <active>#{active}</active>
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

    def self.update_zone(
      id:,
      name:,
      active:0
    )
      z = HTTParty.put("#{@api_url}zones/#{id}",
      {
        body:
        "<prestashop>
          <zone>
            <id>#{id}</id>
            <name>#{name}</name>
            <active>#{active}</active>
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

    def self.get_zone(id:)
      z = HTTParty.get("#{@api_url}zones/#{id}",
      {
        basic_auth: @auth
      })
      puts z.body,z.code
    end

    def self.delete_zone(id:)
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