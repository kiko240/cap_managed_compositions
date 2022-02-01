namespace com.seidor.cap_managed_compositions;

using {Service} from '../service';

annotate Service.Orders with @(Capabilities : {
    Insertable : true,
    Updatable  : true,
    Deletable  : true
});

annotate Service.Orders with {
    ID
    @title : 'ID';
    clientName
    @title : 'ClientName';
}

annotate Service.Orders with @(
  Common.SemanticKey : [ID],
  UI: {
    Identification           : [{
            $Type : 'UI.DataField',
            Value : ID
        }],
    SelectionFields: [ID],
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
    Label  : 'General',
    Target : '@UI.FieldGroup#General'
  },
    {
        $Type   : 'UI.ReferenceFacet',
        Label   : 'Books',
        Target  : 'items/@UI.LineItem'
    },
          ],
        FieldGroup #General : {
            Data  : [
                {
                    $Type : 'UI.DataField',
                    Value : ID
                },
                {
                    $Type : 'UI.DataField',
                    Value : clientName
                }
            ]
        }
  }
);

annotate Service.Orders_items with @(Capabilities : {
    Insertable : true,
    Updatable  : true,
    Deletable  : true
});

annotate Service.Orders.items with {
    book
    @Title:'Book';
    quantity
    @title : 'Quantity';
    book_ID
    @title: 'Book ID';
}

annotate Service.Orders.items with @(
    Common.SemanticKey  : [up__ID],
    UI  : {
        Identification  : [{
            $Type   : 'UI.DataField',
            Value   :   up__ID
        }],
        SelectionFields  : [],
        LineItem  : [
            {Value:book_ID},
            {Value:quantity}
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Book',
            TypeNamePlural : 'Books',
        },
        Facets  : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'Book',
                Target : '@UI.FieldGroup#ItemDetails'
            },
        ],
        FieldGroup #ItemDetails : {
            Data  : [
                {
                    $Type : 'UI.DataField',
                    Value : book_ID
                },
                {
                    $Type : 'UI.DataField',
                    Value : quantity
                }
            ]
        },
    }
);