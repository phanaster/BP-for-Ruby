require "bpruby/version"


module Bpruby
 class Bplib
  require 'rest-client'
   
  =begin
   Required Parameters : 

- Api-Key : Obtainable in your Bitpay Merchant Account
- Price : This is the amount that is required to be collected from the
buyer. Note, if this is specified in a currency other than BTC,
the price will be converted into BTC at market exchange
rates to determine the amount collected from the buyer.
- orderID : Used to display an orderID to the buyer. In the account
summary view, this value is used to identify a ledger entry if
present.
- posData : This content of this field is included in status updates or
requests to get an invoice. It is intended to be used by
the merchant to uniquely identify an order associated with
an invoice in their system. Aside from that, Bit-Pay does
not use the data in this field. The data in this field can be
anything that is meaningful to the merchant

Parameters that are required but are already set to a default :

:currency => BTC ,can be overwritten if needed. Currently BTC and USD supported. Get more infos from Bitpay.

Optional Parameters : 

:itemDesc ,:itemCode, :notificationEmail, :notificationURL, :redirectURL,
:currency, :physical, :fullNotifications, :transactionSpeed, :buyerName, 
:buyerAddress1, :buyerAddress2, :buyerCity, :buyerState, :buyerZip, :buyerEmail, :buyerPhone

The Method returns a Json-Object with the following Information :

id  : The unique id of the invoice.
url : An https URL where the invoice can be viewed.
posData : A data field provided by the merchant and designed to be used by the merchant to
correlate : the invoice with an order or other object in their system.
status  : The current invoice status. The possible states are described earlier in this document.
btcPrice : The amount of bitcoins being requested for payment of this invoice (same as the price if
the merchant set the price in BTC).
price  : The price set by the merchant (in terms of the provided currency).
currency : The 3 letter currency code in which the invoice was priced.
invoiceTime : The time the invoice was created in milliseconds since midnight January 1, 1970.
expirationTime : The time at which the invoice expires and no further payment will be accepted (in
milliseconds : since midnight January 1, 1970). Currently, all invoices are valid for 15
minutes.
currentTime : The current time on the Bit-Pay.com system (by subtracting the current time from the
expiration  : time, the amount of time remaining for payment can be determined).

More Information about Parameters and calls : https://bitpay.com/help-api

  =end			 
				 
  def self.createInvoice(apikey,price,orderId,posData,options={})
     
	 defaultoptions ||= {                
	            :currency => 'BTC' ,  
				:physical => 'true', 
				:fullNotifications => 'true', 
				:transactionSpeed => 'low', 
                 }
				 
	options = defaultoptions.merge(options)
    options[:price] = price
	options[:orderId]= orderId
	options[:posData]= posData
	 
	 
		
				
     response = RestClient.post "https://#{apikey}:@bitpay.com/api/invoice", options, :content_type => :json, :accept => :json
     return response 
   end
   
     
	  def self.getInvoice(apikey,invoiceId)
    
       response = RestClient.get "http://#{apikey}:@bitpay.com/api/invoice/#{invoiceId}", :content_type => :json, :accept => :json
	  return response
	  end
  end
end
