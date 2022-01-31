using {
  com.seidor.cap_managed_compositions as db
} from '../db/schema';
//using {com.seidor.sfc.md.TenantConfiguration_toSyncLanguages} from '../../gen/db/src/gen/com.seidor.sfc.md.TenantConfiguration_toSyncLanguages';

service Service @(
    path : '/Service') {

    entity Orders as projection on db.Orders;
    entity Books as projection on db.Books;
    //entity Orders_items as projection on db.Orders.items;
    //entity Books_texts as projection on db.Books.texts;
}