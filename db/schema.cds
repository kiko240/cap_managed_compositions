namespace com.seidor.cap_managed_compositions;

using {
    cuid,
    managed 
} from '@sap/cds/common';

    entity Orders : cuid  {
        clientName: String;
        items  : Composition of many {
                    key book : Association to Books;
                    quantity : Integer;
        }
    };

    entity Books {
        key ID : Integer;
        title  : localized String(100);
        descr  : localized String(500);
        stock  : Integer;
        price  : Decimal;
    }