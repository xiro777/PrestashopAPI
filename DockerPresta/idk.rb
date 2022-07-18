#post stock availables nie mozna uzyc post 


def self.post_stock_availables(stock_availables)
  stock_avb = HTTParty.post("http://localhost:8080/api/stock_availables/",
  {
      body:
      "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
          <stock_available>
          <id></id>
          <id_product>#{stock_availables[:id_product]}</id_product>
          <id_product_attribute>#{stock_availables[:id_product_attribute]}</id_product_attribute>
          <id_shop>#{stock_availables[:id_shop]}</id_shop>
          <id_shop_group>#{stock_availables[:id_shop_group]}</id_shop_group>
          <quantity>#{stock_availables[:quantity]}</quantity>
          <depends_on_stock>#{stock_availables[:depends_on_stock]}</depends_on_stock>
          <out_of_stock>#{stock_availables[:out_of_stock]}</out_of_stock>
          <location>#{stock_availables[:location]}</location>
          </stock_available>
      </prestashop>",
      basic_auth: @auth,
      header: {
        "Content-Type" => 'text/xml',
        "charset" => 'utf-8'
      }
  })
  puts stock_avb.body, stock_avb.code
end





def self.post_product(product)
  prod = HTTParty.post("http://localhost:8080/api/products/",
  {
      body:
      "<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
      <product>
         <id />
         <id_manufacturer>1</id_manufacturer>
         <id_supplier>1</id_supplier>
         <id_category_default>2</id_category_default>
         <new />
         <cache_default_attribute>0</cache_default_attribute>
         <id_default_image notFilterable=\"true\" />
         <id_default_combination notFilterable=\"true\">0</id_default_combination>
         <id_tax_rules_group>1</id_tax_rules_group>
         <type notFilterable=\"true\">simple</type>
         <id_shop_default>1</id_shop_default>
         <reference>RM-</reference>
         <supplier_reference />
         <location />
         <width>0.000000</width>
         <height>0.000000</height>
         <depth>0.000000</depth>
         <weight>0.000000</weight>
         <quantity_discount>0</quantity_discount>
         <ean13>00000145</ean13>
         <isbn />
         <upc />
         <mpn>S 100 ABT</mpn>
         <cache_is_pack>0</cache_is_pack>
         <cache_has_attachments>0</cache_has_attachments>
         <is_virtual>0</is_virtual>
         <state>1</state>
         <additional_delivery_times>1</additional_delivery_times>
         <delivery_in_stock><language id=\"1\" /></delivery_in_stock>
         <delivery_out_stock><language id=\"1\" /></delivery_out_stock>
         <product_type />
         <on_sale>0</on_sale>
         <online_only>0</online_only>
         <ecotax>0.000000</ecotax>
         <minimal_quantity>1</minimal_quantity>
         <low_stock_threshold>0</low_stock_threshold>
         <low_stock_alert>0</low_stock_alert>
         <price>15014.23</price>
         <wholesale_price>0.000000</wholesale_price>
         <unity />
         <unit_price_ratio>0.000000</unit_price_ratio>
         <additional_shipping_cost>0.000000</additional_shipping_cost>
         <customizable>0</customizable>
         <text_fields>0</text_fields>
         <uploadable_files>0</uploadable_files>
         <active>1</active>
         <redirect_type>404</redirect_type>
         <id_type_redirected>0</id_type_redirected>
         <available_for_order>1</available_for_order>
         <available_date>0000-00-00</available_date>
         <show_condition>0</show_condition>
         <condition>new</condition>
         <show_price>1</show_price>
         <indexed>0</indexed>
         <visibility>both</visibility>
         <advanced_stock_management>0</advanced_stock_management>
         <date_add />
         <date_upd />
         <pack_stock_type>3</pack_stock_type>
         <meta_description><language id=\"1\" /></meta_description>
         <meta_keywords><language id=\"1\" /></meta_keywords>
         <meta_title><language id=\"1\" /></meta_title>
         <link_rewrite><language id=\"1\" /></link_rewrite>
         <name><language id=\"1\">S100 ABT Zmywarka do naczyń i garnków</language></name>
         <description><language id=\"1\">Zmywarka do garnków, koszy, rondli, itp.&lt;br/&gt; sterowany czasowo dozownik środka myjącego i płuczącego&lt;br/&gt; system stałej temperatury płukania abt z pompą 
 wspomagającą płukanie&lt;br/&gt; dwie pompy myjące&lt;br/&gt; 4 programy standardowe (cykle: 60”, 120”, 180”, 240”)&lt;br/&gt; termometr bojlera i wanny&lt;br/&gt; wysokość drzwi: 50 cm&lt;br/&gt; w zestawie: 1x nierdzewny 
 ruszt na naczynia 55 x 70 cm&lt;br/&gt; 1x kosz uniwersalny, na szkło 55 x 55 cm&lt;br/&gt; 1x kosz na tace 55 x 55 cm</language></description>
         <description_short><language id=\"1\" /></description_short>
         <available_now><language id=\"1\" /></available_now>
         <available_later><language id=\"1\"/></available_later>
         <associations>
             <categories nodeType=\"category\" api=\"categories\" />
             <images nodeType=\"image\" api=\"images\" />
             <combinations nodeType=\"combination\" api=\"combinations\" />
             <product_option_values nodeType=\"product_option_value\" api=\"product_option_values\" />
             <product_features nodeType=\"product_feature\" api=\"product_features\" />
             <tags nodeType=\"tag\" api=\"tags\" />
             <stock_availables nodeType=\"stock_available\" api=\"stock_availables\" />
             <attachments nodeType=\"attachment\" api=\"attachments\" />
             <accessories nodeType=\"product\" api=\"products\" />
             <product_bundle nodeType=\"product\" api=\"products\" />
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

def self.post_product(product)
  prod = HTTParty.post("http://localhost:8080/api/products/",
  {
      body:
      "<prestashop xmlns:xlink\"http://www.w3.org/1999/xlink\">
          <product>
              <id></id>
              <id_manufacturer>#{product[:id_manufacturer]}</id_manufacturer>
              <id_supplier>#{product[:id_supplier]}</id_supplier>
              <id_category_default>#{product[:id_category_default]}</id_category_default>
              <new>#{product[:new]}</new>
              <cache_default_attribute>#{product[:cache_default_attribute]}</cache_default_attribute>
              <id_default_image>#{product[:id_default_image]}</id_default_image>
              <id_default_combination>#{product[:id_default_combination]}</id_default_combination>
              <id_tax_rules_group>#{product[:id_tax_rules_group]}</id_tax_rules_group>
              <position_in_category>#{product[:position_in_category]}</position_in_category>
              <type>#{product[:type]}</type>
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
                  <language id=\"2\">#{product[:delivery_in_stock1]}</language>
              </delivery_in_stock>
              <delivery_out_stock>
                  <language id=\"1\">#{product[:delivery_out_stock]}</language>
                  <language id=\"2\">#{product[:delivery_out_stock1]}</language>
              </delivery_out_stock>
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
                  <language id=\"2\">#{product[:meta_description1]}</language>
              </meta_description>
              <meta_keywords>
                  <language id=\"1\">#{product[:meta_keywords]}</language>
                  <language id=\"2\">#{product[:meta_keywords1]}</language>
              </meta_keywords>
              <meta_title>
                  <language id=\"1\">#{product[:meta_title]}</language>
                  <language id=\"2\">#{product[:meta_title1]}</language>
              </meta_title>
              <link_rewrite>
                  <language id=\"1\">#{product[:link_rewrite]}</language>
                  <language id=\"2\">#{product[:link_rewrite1]}</language>
              </link_rewrite>
              <name>
                  <language id=\"1\">#{product[:name]}</language>
                  <language id=\"2\">#{product[:name1]}</language>
              </name>
              <description>
                  <language id=\"1\">#{product[:name]}</language>
                  <language id=\"2\">#{product[:name1]}</language>
              </description>
              <description_short>
                  <language id=\"1\">#{product[:description_short]}</language>
                  <language id=\"2\">#{product[:description_short1]}</language>
              </description_short>
              <available_now>
                  <language id=\"1\">#{product[:available_now]}</language>
                  <language id=\"2\">#{product[:available_now1]}</language>
              </available_now>
              <available_later>
                  <language id=\"1\">#{product[:available_later]}</language>
                  <language id=\"2\">#{product[:available_later1]}</language>
              </available_later>
              <associations>
                  <categories>
                      <category>
                          <id>#{product[:category_id]}</id>
                      </category>
                  </categories>
                  <images>
                      <image>
                          <id>#{product[:image_id]}</id>
                      </image>
                  </images>
                  <combinations>
                      <combination>
                          <id>#{product[:combination_id]}</id>
                      </combination>
                  </combinations>
                  <product_option_values>
                      <product_option_value>
                          <id>#{product[:product_option_value_id]}</id>
                      </product_option_value>
                  </product_option_values>
                  <product_features>
                      <product_feature>
                          <id>#{product[:product_features_id]}</id>
                          <id_feature_value>#{product[:product_feature_values_id]}</id_feature_value>
                      </product_feature>
                  </product_features>
                  <tags>
                      <tag>
                          <id>#{product[:tag_id]}</id>
                      </tag>
                  </tags>
                  <stock_availables>
                      <stock_available>
                          <id>#{product[:stock_available_id]}</id>
                          <id_product_attribute>#{product[:stock_available_id_product_attribute]}</id_product_attribute>
                      </stock_available>
                  </stock_availables>
                  <attachments>
                      <attachment>
                          <id>#{product[:attachment_id]}</id>
                      </attachment>
                  </attachments>
                  <accessories>
                      <product>
                          <id>#{product[:product_accessories_id]}</id>
                      </product>
                  </accessories>
                  <product_bundle>
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
  puts prod.body, prod.code,prod.response
end




#order body

"<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
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
                <order_rows nodeType=\"order_row\" virtualEntity=\"true\">
                    <order_row>
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
                    </order_row>
                </order_rows>
                </associations>
                </order>
                </prestashop>"


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




cart


<prestashop xmlns:xlink=\"http://www.w3.org/1999/xlink\">
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
      </prestashop>