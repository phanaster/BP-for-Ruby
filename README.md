# Bpruby

This Gem is for making easy Api-Calls to the Bitpay.com Payment Api.
It currently supports Creating an Invoice and getting the Status of an Invoice.

## Installation

Add this line to your application's Gemfile:

    gem 'bpruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bpruby

## Usage


There are two methods available :

	createInvoice(apikey,price,orderId,posData,options={})

Example Call :

     response = Bpruby::Bplib.createInvoice(
	 'XXXXAPIKEYHERE',
	 15.40,
	 '333',
	 '230928307203',
	 :transactionSpeed => 'high',
	 :itemDesc =>'Test',
	 :currency => 'USD',
	 :buyerEmail =>'test@bitpay.com',
	 :buyerAddress1 =>'On the',
	 :buyerAddress2 =>'Teststreet')

Required Parameters : 

  Api-Key : Obtainable in your Bitpay Merchant Account
 Price : This is the amount that is required to be collected from the
buyer. Note, if this is specified in a currency other than BTC,
the price will be converted into BTC at market exchange
rates to determine the amount collected from the buyer.
 orderID : Used to display an orderID to the buyer. In the account
summary view, this value is used to identify a ledger entry if
present.
- posData : This content of this field is included in status updates or
requests to get an invoice. It is intended to be used by
the merchant to uniquely identify an order associated with
an invoice in their system. Aside from that, Bit-Pay does
not use the data in this field. The data in this field can be
anything that is meaningful to the merchant

 * Parameters that are required but are already set to a default :

   *  ´:currency => BTC#´ ,can be overwritten if needed. Currently BTC and USD supported. Get more infos from Bitpay.

 + Optional Parameters : 

   + ´:itemDesc ,:itemCode, :notificationEmail, :notificationURL, :redirectURL,´
   + ´:currency, :physical, :fullNotifications, :transactionSpeed, :buyerName,´
   + ´:buyerAddress1, :buyerAddress2, :buyerCity, :buyerState, :buyerZip, :buyerEmail, :buyerPhone´

   
   
   
   
 * The Method returns a Json-Object with the following Information :

   * id  : The unique id of the invoice.
   * url : An https URL where the invoice can be viewed.
   * posData : A data field provided by the merchant and designed to be used by the merchant to correlate : the invoice with an order or other object in their system.
   * status  : The current invoice status. The possible states are described earlier in this document.
   * btcPrice : The amount of bitcoins being requested for payment of this invoice (same as the price if
             the merchant set the price in BTC).
   * price  : The price set by the merchant (in terms of the provided currency).
   * currency : The 3 letter currency code in which the invoice was priced.
   * invoiceTime : The time the invoice was created in milliseconds since midnight January 1, 1970.
   * expirationTime : The time at which the invoice expires and no further payment will be accepted (in
   * milliseconds : since midnight January 1, 1970). Currently, all invoices are valid for 15
                 minutes.
   * currentTime : The current time on the Bit-Pay.com system (by subtracting the current time from the
   * expiration  : time, the amount of time remaining for payment can be determined).

More Information about Parameters and calls : https://bitpay.com/help-api



	getInvoice(apikey,invoiceID)

example call : 

	  response = Bpruby::Bplib.getInvoice('XXXXXXXXXXYOURAPIKEYHERE','T11zE6Xmoz4rK1qq5ktalduPTUO9C9V9NN-BBEpv58o=')

To get the current state of an invoice, an http GET request can be sent to https://bitpay.com/api/invoice/
<id> where the id is the invoice id provided when the invoice was created. The format of the response is
exactly the same as that which is returned when creating an invoice.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## About me :

I am a Ruby Newbie and i like to try ideas. If i have fundamental flaws or when i'm missing best practices please tell me , i am eager to learn !

## I like Cookies and Bitcoins :

If you want to help me out , figure a creative way to send me a cookie or spare a Bitcent to this adress , so i can get the cookie myself :
	 1Phantadn1nq1ZuxYc3rzqNgxKPxMdM2oQ

