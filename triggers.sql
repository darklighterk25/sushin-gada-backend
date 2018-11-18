// trigger que actualiza el total y taxes acumulados de una orden
create trigger purchase_trigger after insert on items

for each row

begin

  declare aux_purchase int;

  declare aux_total varchar(45);

  declare aux_taxes varchar(45);

  set aux_purchase = new.id_purchase;

  select sum(subtotal) from items where id_purchase = aux_purchase into aux_total;

  set aux_taxes = aux_total * 0.16;

  update purchase set total = aux_total, taxes = aux_taxes where id_purchase = aux_purchase;

end