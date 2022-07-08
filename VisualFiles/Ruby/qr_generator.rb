require 'rqrcode'

id = 1
card_country = "PL"
account_num = 88124069601570000000278514
#dwie ostatnie cyfry w price to ilosc groszy
price = 932
company_name = "Firma Sp z o.o."
title = "tytul"

def bank_transfer_qr_code(id,
			   card_country,
			   account_num,
			   price,
			   company_name,
			   title)

  
  qr_code = RQRCode::QRCode.new(
	[
		{data: id.to_s,mode: :number},
		{data: "|",mode: :byte_8bit},
		{data: card_country.upcase(),mode: :byte_8bit},
		{data: "|",mode: :byte_8bit},
		{data: account_num.to_s,mode: :number},
		{data: "|",mode: :byte_8bit},
		{data: price.to_s,mode: :number},
		{data: "|",mode: :byte_8bit},
		{data: company_name,mode: :byte_8bit},
		{data: "|",mode: :byte_8bit},
		{data: title,mode: :byte_8bit},
		{data: "|||",mode: :byte_8bit},
  	],level: :l)
  return qr_code
end


png = bank_transfer_qr_code(id,
							card_country,
							account_num,
							price,
							company_name,
							title).as_png(
  color:"black",
  fill:"white",
  size: 120,
  module_size: 7
)

IO.binwrite("qr_code_facture.png",png.to_s)