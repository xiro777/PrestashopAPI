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
