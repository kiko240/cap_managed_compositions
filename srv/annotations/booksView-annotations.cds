namespace com.seidor.cap_managed_compositions;

using {Service} from '../service';

annotate Service.Books with @(Capabilities : {
    Insertable : true,
    Updatable  : true,
    Deletable  : true
});

annotate Service.Books with {
    ID
    @title : 'ID';
    price
    @title : 'Price';
    stock
    @title : 'Stock';
}

annotate Service.Books with @(
  Common.SemanticKey : [ID],
  UI: {
    Identification           : [{
            $Type : 'UI.DataField',
            Value : ID
        }],
    SelectionFields: [ ID, price, stock ],
    LineItem: [
      {Value: ID},
      {Value: price},
      {Value: stock}
    ],
  HeaderInfo               : {
    TypeName       : 'Book',
    TypeNamePlural : 'Books',
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
        Label   : 'Texts',
        Target  : 'texts/@UI.LineItem'
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
                    Value : stock
                },
                {
                    $Type : 'UI.DataField',
                    Value : price
                },
            ]
        }
  }
);

annotate Service.Books.texts with @(Capabilities : {
    Insertable : true,
    Updatable  : true,
    Deletable  : true
});

annotate Service.Books.texts with {
    locale
    @title : 'Locale';
    title
    @title : 'Title';
    descr
    @title : 'Description';
}

annotate Service.Books.texts with @(
    Common.SemanticKey  : [ID,locale],
    UI  : {
        Identification  : [{
            $Type   : 'UI.DataField',
            Value   :   ID
        }],
        Identification  : [{
            $Type   : 'UI.DataField',
            Value   :   locale
        }],
        SelectionFields  : [],
        LineItem  : [
            {Value:ID},
            {Value:locale},
            {Value:title}
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Text',
            TypeNamePlural : 'Texts',
        },
        Facets  : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'Text',
                Target : '@UI.FieldGroup#TextsDetails'
            },
        ],
        FieldGroup #TextsDetails : {
            Data  : [
                {
                    $Type : 'UI.DataField',
                    Value : title
                },
                {
                    $Type : 'UI.DataField',
                    Value : locale
                }
            ]
        },
    }
);