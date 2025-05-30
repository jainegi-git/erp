namespace Vj.trans;


using { cuid, managed , Currency } from '@sap/cds/common';
using { vj.masters as masters } from './vj_masters';


/***********************************************************************************
All the transaction data related entities are defined below
So if there is any new type of transaction entity required, 
it can be declared below 
***********************************************************************************/

entity Orders @(title:'i18n>ORDERH') : cuid {
    key orderNo 	     : String(10);                        // Order ID or Transaction Number 
        orderType        : String(1);                         // Order Type : Sales = S , Purchase = P, Demand = D
        partnerId	     : Association                        // Vendor or Customer ID from partner table
                            to masters.Partners @assert.target;         
        location	     : Association                        // Location ID from Location master
                            to masters.Locations;        
        orderDueDate     : Date;                              // Order delivery date
        referenceOrder	 : String(10);                        // Reference from Demand Order 
        orderValue	     : Currency;                          // Remaining value of Demand Order
        paymentRefNo	 : String(10);                        // Payment Ref. no if payment already made with Demand Order
        paymentValue	 : Currency;	                      // Payment Remaining
        rateFixed	     : Boolean;                           // If customer asked to fix rates
        rate	         : Integer;                           // Rate on the order date
        taxCode          : String(2);                         // Tax code
};


entity OrderItems @(title:'i18n>ORDERI') : cuid {
    key orderNo          : Association                         // Order ID from Order Header table
                            to Orders;                          
        orderItem        : Integer;
        productId        : Association 
                            to masters.Products @assert.target;
        weight           : Decimal(6,3);
        weightUnit       : String(6);
        quantity         : Int16;
        quantityUnit     : Association 
                            to masters.Products @assert.target;
}

extend Orders with managed;
extend OrderItems with managed;
