namespace vj.masters;


using { cuid, managed } from '@sap/cds/common';
//using { Vj.trans as trans } from './vj_trans';

// Defining masters

// Business Partners
entity Partners @(title : 'Business Partner Table') {
    key partnerId        : Integer;
        partnerType      : String(1);
        firstName        : String(30);
        LastName         : String(30);
        gender           : String(5);
        salutation       : String(4);
        locationId       : Int32 ;
        address1         : String(30);
        address2         : String(30);
        villageCity      : String(30);
        tehsil           : String(30);
        district         : String(30);
        state            : String(30);
        GST              : String(30);
        PAN              : String(30);
        mobile           : String(30);
        mobile2          : String(30);
        remarks          : String(80);
}

// Material Masters

entity Products @(title : '{i18n>Name}'){
    key productId        : String(40);
        HUID             : String(20);
        materialType     : String(1);
        description      : String(40);
        quantityUnit     : String(5);
        weightUnit       : String(5); 
        hallmark         : String(5);
        hallmarkType     : String(5);
}

// Location Master

entity Locations : cuid {
    key locationId       : Int32;
        name             : String(20);
        address1         : String(20);
        villageCity      : String(20);
}
//extend Foo with @title:'Business Partner Table';

extend Partners  with managed;
extend Products  with managed;
extend Locations with managed;