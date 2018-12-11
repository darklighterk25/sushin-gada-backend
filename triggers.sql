-- Trigger que actualiza el total y taxes acumulados de una orden
-- despues de insertar un nuevo item al carrito.
create trigger purchase_trigger_ins after insert on items
for each row
begin
	call update_purchase(new.id_purchase);
end

-- Trigger que actualiza el total y taxes acumulados de una orden
-- despues de actualizar algun registro del carrito.
create trigger purchase_trigger_upd after update on items
for each row
begin
	call update_purchase(new.id_purchase);
end

-- Trigger que actualiza el total y taxes acumulados de una orden
-- después de eliminar algun item del carrito.
create trigger purchase_trigger_del after delete on items
for each row
begin
	call update_purchase(old.id_purchase);
end

-- Trigger que actualiza los precios de compra en el carrito siempre
-- que aun no se haya pagado la orden.
create trigger update_prices before update on menu
for each row
begin
	declare done int default false;
	declare c_closed int;
	declare c_purchase int;
	declare c_cursor cursor for select closed, id_purchase from purchase;
	declare continue handler for not found set done = true;
    	open c_cursor;
    	if new.price != old.price then
		read_loop: loop
			fetch c_cursor into c_closed, c_purchase;
            		if done then
				leave read_loop;
			end if;
			if c_closed = 0 then
				update items set price = new.price, subtotal = new.price*quantity where id_item = new.id_item and id_purchase = c_purchase;
            		end if;
		end loop;
	end if;
    close c_cursor;
end