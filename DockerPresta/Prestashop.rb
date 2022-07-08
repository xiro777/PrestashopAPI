require 'open-uri'
require 'httparty'
require 'pp'
require 'json'
require 'uri'
require_relative 'dane_presta.rb'
require_relative 'creating_hashes.rb'

class Presta
    
    include HTTParty
    include PrestaData
    include Create

    @auth = {username: "9UUNVSHIC7EL4ZBAXB6LG18HLREFQPMG", password: ""}

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
       
    def self.post_customer(tab)
        customer = HTTParty.post("http://localhost:8080/api/customers/",{
            body:
            "<prestashop>
                <customer>
                    <id></id>
                    <id_default_group href=\"http://localhost:8080/api/groups/\">#{tab[:d_default_group]}</id_default_group>
                    <id_lang href=\"http://localhost:8080/api/languages/\">#{tab[:id_lang]}</id_lang>
                    <newsletter_date_add>#{tab[:ip_registration_newsletter]}</newsletter_date_add>
                    <ip_registration_newsletter>#{tab[:ip_registration_newsletter]}</ip_registration_newsletter>
                    <last_passwd_gen>#{tab[:last_passwd_gen]}</last_passwd_gen>
                    <secure_key>#{tab[:secure_key]}</secure_key>
                    <deleted>#{tab[:deleted]}</deleted>
                    <passwd>#{tab[:passwd]}</passwd>
                    <lastname>#{tab[:lastname]}</lastname>
                    <firstname>#{tab[:firstname]}</firstname>
                    <email>#{tab[:email]}</email>
                    <id_gender>#{tab[:id_gender]}</id_gender>
                    <birthday>#{tab[:birthday]}</birthday>
                    <newsletter>#{tab[:newsletter]}</newsletter>
                    <optin>#{tab[:optin]}</optin>
                    <website>#{tab[:website]}</website>
                    <company>#{tab[:company]}</company>
                    <siret>#{tab[:siret]}</siret>
                    <ape>#{tab[:ape]}</ape>
                    <outstanding_allow_amount>#{tab[:outstanding_allow_amount]}</outstanding_allow_amount>
                    <show_public_prices>#{tab[:show_public_prices]}</show_public_prices>
                    <id_risk>#{tab[:id_risk]}</id_risk>
                    <max_payment_days>#{tab[:max_payment_days]}</max_payment_days>
                    <active>#{tab[:active]}</active>
                    <note>#{tab[:note]}</note>
                    <is_guest>#{tab[:is_guest]}</is_guest>
                    <id_shop>#{tab[:id_shop]}</id_shop>
                    <id_shop_group>#{tab[:id_shop_group]}</id_shop_group>
                    <date_add>#{tab[:date_add]}</date_add>
                    <date_upd>#{tab[:date_upd]}</date_upd>
                    <reset_password_token>#{tab[:reset_password_token]}</reset_password_token>
                    <reset_password_validity>#{tab[:reset_password_validity]}</reset_password_validity>
                    <associations>
                        <groups nodeType=\"group\" api=\"groups\">
                        <group href=\"http://localhost:8080/api/groups/\">
                        <id>#{tab[32]}</id>
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


    
   
    
end

############## TESTING METHODS #############

#print Presta.getaddresses(1)

#Presta.post_language($language)


#Presta.add_shop(tab)

#Presta.post_customer($customer1)
















