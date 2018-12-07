// trigger que actualiza el total y taxes acumulados de una orden
create trigger purchase_trigger after insert on items

for each row

begin

  call update_purchase(new.id_purchase);

end

// trigger que actualiza el total y taxes de una orden al cambiar el precio del menu
create trigger update_order_total after update on items

for each row

begin

	call update_purchase(new.id_purchase);

end

// trigger que actualiza los precios en el carrito cuando aun no se haga la compra
create trigger update_prices before update on menu

for each row

begin

    	declare aux_closed int;

	select closed from purchase natural join items where id_item = new.id_item into aux_closed;

	if new.price != old.price and aux_closed = 0 then

		update items set price = new.price, subtotal = new.price*quantity where id_item = new.id_item;

	end if;

end