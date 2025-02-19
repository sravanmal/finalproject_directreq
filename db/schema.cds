using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

using { OP_API_PRODUCT_SRV_0001 as product_api } from '../srv/external/OP_API_PRODUCT_SRV_0001';
using { API_PLANT_SRV as plant_api } from '../srv/external/API_PLANT_SRV';



namespace indirectreq.ust.db;

context transaction {

    //request header entity

    entity Request_Header : cuid, managed {

        PR_Number           : String(10) @readonly @title : '{i18n>PR_Number}'; // PR number
        Status_Code         : String(1) default 'O'  @readonly ; // Status Code
        PRType              : String @title : '{i18n>PRType}'; // PR type
        _Items              : Composition of many Request_Item
                                  on _Items._Header = $self; // items
        Request_Description : String  @mandatory @title : '{i18n>Request_Description}'; //  .Request Description
        _Comments           : Composition of many Comments
                                  on _Comments._headercomment = $self; // comments
        Request_No          : String(10) @title : '{i18n>Request_No}'; // Request No
        insertrestrictions  : Integer default 1;     // restrictions for buttons
        TotalPrice          : Integer @title : '{i18n>TotalPrice}';     // total price

    }

    // request items entity

    entity Request_Item : cuid, managed {

        PR_Item_Number       : String(10) @readonly; // PR number
        Material             : String  @mandatory @title : '{i18n>Material}'; // .Material
        Material_Description : String  @mandatory @title : '{i18n>Material_Description}'; // Material Description
        PurOrg               : String @title : '{i18n>PurOrg}'; // .PurOrg
        Plant                : String  @mandatory @title : '{i18n>Material_Description}'; // .Plant
        Status               : String; // Status
        Quantity             : Integer @mandatory @title : '{i18n>Quantity}'; // Quantity
        UoM                  : String @title : '{i18n>UoM}'; // Unit of Mass (uom)
        UnitPrice            : Integer @title : '{i18n>UnitPrice}'; // Unit price
        Price                : Decimal = Quantity * UnitPrice @title : '{i18n>Price}}'; // Price
        Currency             : Currency; // currency
        PurchasingGroup      : String @title : '{i18n>PurchasingGroup}';
        Req_Item_No          : Integer @title : '{i18n>Req_Item_No}'; // Request Item Number
        _Header              : Association to Request_Header;

    }


    // Comments entity

    entity Comments : cuid, managed {
        _headercomment : Association to Request_Header;
        text           : String // Text
    }

    // projections for product and plant 

    entity material  as projection on product_api.A_Product{
        key Product as ID,
        ProductType as Desc,
        BaseUnit as UnitofMass,
        CountryOfOrigin as Country,
     };


     entity plant  as projection on product_api.A_ProductPlant{
        key Plant as plant,
        
     };

     entity plantapi as projection on plant_api.A_Plant{
        key Plant as plant_id,
        PlantName as plantname,
        
     };


}
