require 'open-uri'
require 'httparty'
require 'pp'
require 'json'
require 'uri'
require_relative 'dane_presta.rb'

class Presta
    
    include HTTParty
    include PrestaData

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
                        <name>#{tab[0]}(#{tab[0]})</name>
                        <iso_code>#{tab[1]}</iso_code>
                        <locale>#{tab[2]}</locale>
                        <language_code>#{tab[3]}</language_code>
                        <active>#{tab[4]}</active>
                        <is_rtl>#{tab[5]}</is_rtl>
                        <date_format_lite>#{tab[6]}</date_format_lite>
                        <date_format_full>#{tab[7]}</date_format_full>
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
                    <id_default_group href=\"http://localhost:8080/api/groups/\">#{tab[0]}</id_default_group>
                    <id_lang href=\"http://localhost:8080/api/languages/\">#{tab[1]}</id_lang>
                    <newsletter_date_add>#{tab[2]}</newsletter_date_add>
                    <ip_registration_newsletter>#{tab[3]}</ip_registration_newsletter>
                    <last_passwd_gen>#{tab[4]}</last_passwd_gen>
                    <secure_key>#{tab[5]}</secure_key>
                    <deleted>#{tab[6]}</deleted>
                    <passwd>#{tab[7]}</passwd>
                    <lastname>#{tab[8]}</lastname>
                    <firstname>#{tab[9]}</firstname>
                    <email>#{tab[10]}</email>
                    <id_gender>#{tab[11]}</id_gender>
                    <birthday>#{tab[12]}</birthday>
                    <newsletter>#{tab[13]}</newsletter>
                    <optin>#{tab[14]}</optin>
                    <website>#{tab[15]}</website>
                    <company>#{tab[16]}</company>
                    <siret>#{tab[17]}</siret>
                    <ape>#{tab[18]}</ape>
                    <outstanding_allow_amount>#{tab[19]}</outstanding_allow_amount>
                    <show_public_prices>#{tab[20]}</show_public_prices>
                    <id_risk>#{tab[21]}</id_risk>
                    <max_payment_days>#{tab[22]}</max_payment_days>
                    <active>#{tab[23]}</active>
                    <note>#{tab[24]}</note>
                    <is_guest>#{tab[25]}</is_guest>
                    <id_shop>#{tab[26]}</id_shop>
                    <id_shop_group>#{tab[27]}</id_shop_group>
                    <date_add>#{tab[28]}</date_add>
                    <date_upd>#{tab[29]}</date_upd>
                    <reset_password_token>#{tab[30]}</reset_password_token>
                    <reset_password_validity>#{tab[31]}</reset_password_validity>
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



#print Presta.getaddresses(1)

#Presta.post_language($language)


#Presta.add_shop(tab)

#Presta.post_customer($customer1)
















