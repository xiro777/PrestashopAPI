require 'httparty'
require_relative 'Presta.rb'
require "base64"
require 'mysql2'
require 'nokogiri'


class Api::V1::PrestaController < ApplicationController   
    
    def load

        payload = Base64.decode64(params[:payload])
        parse = JSON.parse(payload)
        warehouse_note = parse['warehouse_note']
        warehouse_note_items = parse['warehouse_note_items'] 
        warehouse_note_items0 = warehouse_note_items[0]
        shipping_addr = warehouse_note['data']['shipping_address']
        #render :plain => parse

        country = Presta.get_country_by_country_name(name:shipping_addr['country_code'])
        name = shipping_addr['contact_person'].split
        exist_add = Presta.get_addresses_by_data(
            address1:shipping_addr['address_line_1'],
            address2:shipping_addr['address_line_2'],
            city:shipping_addr['city'],
            id_country:country,
            postcode:shipping_addr['postal_code'],
            aliass:shipping_addr['contact_person'],
            firstname:name[0],
            lastname:name[1],
            phone_mobile:shipping_addr['phone_number']
        )
        if (exist_add.empty?)
            addr_id = Presta.post_address(
                address1:shipping_addr['address_line_1'],
                address2:shipping_addr['address_line_2'],
                city:shipping_addr['city'],
                id_country:country,
                postcode:shipping_addr['postal_code'],
                aliass:shipping_addr['contact_person'],
                firstname:name[0],
                lastname:name[1],
                phone_mobile:shipping_addr['phone_number'])
        else
            addr_id = exist_add    
        end

        # # ## POSTING PRODUCT
        tax_id = Presta.get_tax_rule_group_by_name(iso_code:shipping_addr["state_province_code"],vat:(warehouse_note_items0["vat_rate"].to_f * 100).to_i)
        
        products = {}
        

        parse["warehouse_note_items"].map{|wni| products[wni['id']]={};products[wni['id']]={'symbol'=>wni["ware_symbol"],'quantity'=>wni["quantity"],'net_price'=>wni["net_price"],'vat_rate'=>wni["vat_rate"],'price'=>wni["price"],
            "prod_id"=> 
            Presta.get_product_by_symbol(symbol:wni['ware_symbol'],price:wni["price"]).empty? ? 
                Presta.post_product(
                    id_tax_rules_group:tax_id,
                    name:wni['ware_symbol'],
                    price:wni['price'],
                    reference:wni['ware_symbol']) :
                Presta.get_product_by_symbol(symbol:wni["ware_symbol"],price:wni["price"])
               
            }}
        
        # # INCREASE STOCK QUNATITY
        products.each do |keys,values|
            upd_stock = Presta.get_stock_availables_by_product_id(id_product:values["prod_id"])
            Presta.update_stock_availables(
                id:upd_stock,
                id_product:values["prod_id"],
                quantity:1000
            )
        
        end

       curr_id = 4
        
        #POST CARTS
        cart_id = Presta.post_carts(
            id_address_delivery:addr_id,
            id_address_invoice:addr_id,
            id_carrier:1,
            id_currency:curr_id,
            products:products
        )


        
        ## POSTING ORDER           
        conv_rate = Presta.get_converison_rate_by_id(id:curr_id)
        if warehouse_note["paid"]==true
            Presta.post_order(
                id_address_delivery:addr_id,
                id_address_invoice:addr_id,
                id_cart:cart_id,
                id_currency:curr_id,
                id_carrier:1,
                current_state:9,
                shipping_number:warehouse_note["package_number"],
                total_products:warehouse_note_items0["net_price"],
                total_products_wt:warehouse_note_items0["price"],
                total_paid:0,
                total_paid_real:0,       
                note:warehouse_note["internal_comments"],
                conversion_rate:conv_rate,
                products:products
            )
           
            order_id = Presta.get_order_by_cart_id(id_cart:cart_id)
            hist_id = Presta.get_order_histories_by_order_id(order_id:order_id)
            Presta.delete_order_histories(id:hist_id)
            Presta.update_order_body(id:order_id,current_state:9,id_carrier:73)

            
            order_reference_ids = Presta.get_order_reference(order_id:order_id)
            payment_order_id = Presta.get_order_payment_by_reference(reference:order_reference_ids)
            Presta.delete_order_payment(id:payment_order_id)
        else
            Presta.post_order(
                id_address_delivery:addr_id,
                id_address_invoice:addr_id,
                id_cart:cart_id,
                id_currency:curr_id,
                id_carrier:1,
                current_state:1,
                shipping_number:warehouse_note["package_number"],
                total_products:warehouse_note_items0["net_price"],
                total_products_wt:warehouse_note_items0["price"],
                total_paid:0,
                total_paid_real:0,       
                note:warehouse_note["internal_comments"],
                conversion_rate:conv_rate,
                products:products
            )
             #methods create to avoid settting current state in "error"(bez tego stworzy sie zamowienie z statusem blad)
            order_id = Presta.get_order_by_cart_id(id_cart:cart_id)
            hist_id = Presta.get_order_histories_by_order_id(order_id:order_id)
            Presta.delete_order_histories(id:hist_id)
            Presta.update_order_body(id:order_id,current_state:1,carrier_id:1)

            #methods created to remove payment with amount 0(przy utworzeniu zamowienia trzeba podac total paid pomimo ze zamowienie nie jest oplacone i wyswietla zaplate 0zl)
            order_reference_ids = Presta.get_order_reference(order_id:order_id)
            payment_order_id = Presta.get_order_payment_by_reference(reference:order_reference_ids)
            Presta.delete_order_payment(id:payment_order_id)

            #SETTING SHIPPING PRICE
            Presta.query_insert_shipping(id_order:order_id,shipping_price:10.0)
       end


      end

end
