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

#address body
body:
          "<prestashop>
            <address>
              <id></id>
              <id_customer>#{address[:id_customer]}</id_customer>
              <id_manufacturer>#{address[:id_manufacturer]}</id_manufacturer>
              <id_supplier>#{address[:id_supplier]}</id_supplier>
              <id_warehouse>#{address[:id_warehouse]}</id_warehouse>
              <id_country>#{address[:id_country]}</id_country>
              <id_state>#{address[:id_state]}</id_state>
              <alias>#{address[:alias]}</alias>
              <company>#{address[:company]}</company>
              <lastname>#{address[:lastname]}</lastname>
              <firstname>#{address[:firstname]}</firstname>
              <vat_number>#{address[:vat_number]}</vat_number>
              <address1>#{address[:address1]}</address1>
              <address2>#{address[:address2]}</address2>
              <postcode>#{address[:postcode]}</postcode>
              <city>#{address[:city]}</city>
              <other>#{address[:other]}</other>
              <phone>#{address[:phone]}</phone>
              <phone_mobile>#{address[:phone_mobile]}</phone_mobile>
              <dni>#{address[:dni]}</dni>
              <deleted>#{address[:deleted]}</deleted>
              <date_add>#{address[:date_add]}</date_add>
              <date_upd>#{address[:date_upd]}</date_upd>
            </address>
          </prestashop>",


          def self.update_address(id,address)
            add = HTTParty.put("#{@api_url}addresses/#{id}",
            {
                body:
                "<prestashop>
                  <address>
                    <id>#{id}</id>
                    <id_customer>#{address[:id_customer]}</id_customer>
                    <id_manufacturer>#{address[:id_manufacturer]}</id_manufacturer>
                    <id_supplier>#{address[:id_supplier]}</id_supplier>
                    <id_warehouse>#{address[:id_warehouse]}</id_warehouse>
                    <id_country>#{address[:id_country]}</id_country>
                    <id_state>#{address[:id_state]}</id_state>
                    <alias>#{address[:alias]}</alias>
                    <company>#{address[:company]}</company>
                    <lastname>#{address[:lastname]}</lastname>
                    <firstname>#{address[:firstname]}</firstname>
                    <vat_number>#{address[:vat_number]}</vat_number>
                    <address1>#{address[:address1]}</address1>
                    <address2>#{address[:address2]}</address2>
                    <postcode>#{address[:postcode]}</postcode>
                    <city>#{address[:city]}</city>
                    <other>#{address[:other]}</other>
                    <phone>#{address[:phone]}</phone>
                    <phone_mobile>#{address[:phone_mobile]}</phone_mobile>
                    <dni>#{address[:dni]}</dni>
                    <deleted>#{address[:deleted]}</deleted>
                    <date_add>#{address[:date_add]}</date_add>
                    <date_upd>#{address[:date_upd]}</date_upd>
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