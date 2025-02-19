using indirectreq.ust.db.transaction as my from '../db/schema';
using from '@cap-js/change-tracking';
using sap.changelog as myy;


annotate my.Request_Header with @changelog: [author, timestamp]
{
    Request_Description @changelog @Common.Label: '{i18n>Request_Description}';
    PR_Number @changelog @Common.Label: '{i18n>PR_Number}';
    
};



annotate my.Request_Item with @changelog: [author, timestamp]
{
    Material @changelog;
    Material_Description @changelog @Common.Label: '{i18n>Material_Description}';
    PurOrg @changelog @Common.Label: '{i18n>PurOrg}';
    Plant @changelog @Common.Label: '{i18n>Plant}';
    PurchasingGroup @changelog @Common.Label: '{i18n>PurchasingGroup}';
    UnitPrice @changelog @Common.Label: '{i18n>UnitPrice}';
    UoM @changelog @Common.Label: '{i18n>UoM}';
    Quantity @changelog @Common.Label: '{i18n>Quantity}';

    
};

annotate my.Request_Header with @title: 'Header';
annotate my.Request_Item with @title: 'Items';

annotate sap.changelog.aspect @(UI.Facets: [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'ChangeHistoryFacet',
    Label : '{i18n>ChangeHistory}',
    Target: 'changes/@UI.PresentationVariant',
    ![@UI.PartOfPreview]
}]);


service ChangeTrackingService {
    entity ChangeLog as projection on myy.ChangeLog; 

}


