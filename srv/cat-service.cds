using { vj.masters as m } from '../db/vj_masters';
using { Vj.trans as t  } from '../db/vj_trans';



/************************************************************************
Define service for the entities created for masters and transsaction data 
************************************************************************/
service Masters @(path : '/master') {

entity Products as projection on m.Products;
entity Partners as projection on m.Partners;
entity Locations as projection on m.Locations;
};



/************************************************************************
Define service for the entities created for masters and transsaction data 
************************************************************************/

service Transaction @(path :'/transaction') {
entity Orders as projection on t.Orders { 
    
    orderNo as orderNo,
    orderType,
    partnerId.partnerId as partnerId,
    location.locationId  as locationId,
    orderDueDate,
    referenceOrder,
    orderValue,
    paymentRefNo,
    paymentValue,
    rateFixed,
    rate, 
    taxCode,
     *
     }
excluding {
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
};
entity OrderItems as projection on t.OrderItems {
        orderNo.orderNo as OrderNo,
        //orderId.orderId as orderId,                          
        orderItem,
        productId.productId as productId,
        weight,
        weightUnit,
        quantity,
        quantityUnit,  
        * 
        }
excluding {
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
};
} // Catalog service

