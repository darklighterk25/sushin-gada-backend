-- trigger que actualiza el total y taxes acumulados de una orden
create trigger purchase_trigger after insert on items

for each row

begin

  call update_purchase(new.id_purchase);

end

-- trigger que actualiza el total y taxes de una orden al cambiar el precio del menu
create trigger update_order_total after update on items

for each row

begin

	call update_purchase(new.id_purchase);

end

-- trigger que actualiza los precios en el carrito cuando aun no se haga la compra
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