require "bpruby/version"


module Bpruby
 class Bplib
  require 'rest-client'
   
  =begin
   Creates an invoice for Bitpay.com.
  =end			 
				 
  def self.createInvoice(apikey,price,orderId,posData,options={})
     
	 defaultoptions ||= {                
	            :currency => 'BTC' ,
            	:notificationEmail => '',
				:notificationURL => '', 
				:redirectURL => '',  
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
