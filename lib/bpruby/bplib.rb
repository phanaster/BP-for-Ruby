module BPRUBY
 class BPLIB
   require 'rest-client'
  
    
    
				 
				 
  def bpCreateInvoice(price,orderid,posData,options={})
    
	
	@options ||= {                
	            'currency' => 'BTC' ,
            	'notificationEmail' => '',
				'notificationURL' => '', 
				'redirectURL' => '',  
				'physical' => 'true', 
				'fullNotifications' => 'true', 
				'transactionSpeed' => 'low', 
                 }
	
	
	
	options = @options.merge(options)
    options[:price] = price
	options[:orderId]= orderid
	options[:posData]= posData
	 
	 
	postOptions = ['orderID', 'itemDesc', 'itemCode', 'notificationEmail', 'notificationURL', 'redirectURL', 
		'posData', 'price', 'currency', 'physical', 'fullNotifications', 'transactionSpeed', 'buyerName', 
		'buyerAddress1', 'buyerAddress2', 'buyerCity', 'buyerState', 'buyerZip', 'buyerEmail', 'buyerPhone']
		
		postOptions.each_with_index do |opt,index|
		 if options.include(opt[index])
		    postdata[index] = options[index]			
		 end
        end
		
		
		
    postdata = {}
				
				
    response = RestClient.post "https://JRcbOrlCYNhMFDfYygX3NSHypUibMZzC59v15P95AQg:@bitpay.com/api/invoice", postdata, :content_type => :json, :accept => :json
    return response 
  end
 end
end