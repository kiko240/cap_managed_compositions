using {
  com.seidor.cap_managed_compositions as db
} from '../db/schema';

service Service @(path : '/Service') {

    entity Orders as projection on db.Orders;
    entity Books as projection on db.Books;

    //entity Orders_items as projection on db.Orders.items;
    //entity Books_texts as projection on db.Books.texts;
}