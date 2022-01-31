namespace com.seidor.cap_managed_compositions;

using {Service} from '../service';

annotate Service.Orders with @(Capabilities : {
    Insertable : true,
    Updatable  : true,
    Deletable  : true
});

annotate Service.Orders with @(
  Common.SemanticKey : [ID],
  UI: {
    Identification           : [{
            $Type : 'UI.DataField',
            Value : ID
        }],
    SelectionFields: [ ID ],
    LineItem: [
      {Value: ID}
    ],
  HeaderInfo               : {
    TypeName       : 'Order',
    TypeNamePlural : 'Orders',
    Title          : {Value : ID}
  },
  Facets                   : [
  {
     $Type  : 'UI.ReferenceFacet',
     Label  : 'ddd',
                  Target : '@UI.FieldGroup#UnitsDetails'
              },
          ],
        FieldGroup #UnitsDetails : {
            Label : 'asdf',
            Data  : [
                {
                    $Type : 'UI.DataField',
                    Value : ID
                },
            ]
        }
  }
);