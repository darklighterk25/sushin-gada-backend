-- Procedimiento para registrar un nuevo usuario
create procedure sign_up(
  street varchar(50),
  number varchar(7),
  interior_number varchar(5),
  neighborhood varchar(50),
  zip_code char(6),
  phone char(10),
  name varchar(45),
  last_name1 varchar(45),
  last_name2 varchar(45),
  birthdate date,
  gender tinyint(4),
  email varchar(45),
  password varchar(64)
)
begin
  declare addr int;
  insert into address values (id_address, street, number, interior_number, neighborhood, zip_code, phone);
  select last_insert_id() into addr;
  insert into user values(id_user, addr, name, last_name1, last_name2, birthdate, gender, email, password, 1, 1);
end

-- Procedimiento para insertar nuevos items al carrito
create procedure add_to_cart(
  user int,
  new_item tinyint(4),
  new_quantity tinyint(4),
  unit_price decimal(5,2)
)
begin
  declare subtotal decimal(5,2);
  declare aux_purchase int;
  declare aux_items int;
  set subtotal = new_quantity * unit_price;
  select id_purchase from purchase where closed = 0 and id_user = user into aux_purchase;
  if aux_purchase is null then
    insert into purchase values(id_purchase, user, null, 0, 0, now(), 0, 0, 0, null);
    select id_purchase from purchase where closed = 0 and id_user = user into aux_purchase;
  end if;
  select id_items from items where id_purchase = aux_purchase and id_item = new_item into aux_items;
  if aux_items is null then
    insert into items values(id_items, aux_purchase, new_item, new_quantity, subtotal, unit_price);
  else
    update items set quantity = quantity + new_quantity, subtotal = quantity * price where id_items = aux_items;
  end if;
end

-- Procedimiento para actualizar el total y taxes en las compras
create procedure update_purchase(purchase_key int)
begin
  declare aux_percentage float;
  declare aux_total float;
  declare aux_taxes float;
  select percentage from discount where id_discount = (select id_discount from purchase where id_purchase = purchase_key) into aux_percentage;
  select sum(subtotal) from items where id_purchase = purchase_key into aux_total;
  if aux_total is null then
    set aux_total = 0;
  end if;
  set aux_total = aux_total - (aux_total * aux_percentage);
  set aux_taxes = aux_total * 0.16;
  update purchase set total = aux_total, taxes = aux_taxes where id_purchase = purchase_key;
end

-- Procedimiento para eliminar todos los items del carrito
create procedure delete_cart(user int)
begin
  declare aux_purchase int;
  select id_purchase from purchase where closed = 0 and id_user = user into aux_purchase;
  if aux_purchase is not null then
    delete from items where id_purchase = aux_purchase;
  end if;
end

-- Procedimiento para cerrar una compra
create procedure close_purchase(
  user int,
  location int,
  new_discount int,
  new_street varchar(50),
  new_number varchar(7),
  new_interior_number varchar(5),
  new_neighborhood varchar(50),
  new_zip_code varchar(6),
  new_phone varchar (10)
)
begin
  declare aux_address int;
  declare purchase_key int;
  if new_interior_number is not null then
    select id_address from address where street = new_street and number = new_number and  interior_number = new_interior_number and  neighborhood = new_neighborhood and zip_code = new_zip_code and  phone = new_phone into aux_address;
  else 
    select id_address from address where street = new_street and number = new_number and  interior_number is null and neighborhood = new_neighborhood and zip_code = new_zip_code and  phone = new_phone into aux_address;
  end if;
  if aux_address is null then
    insert into address values (id_address, new_street, new_number, new_interior_number, new_neighborhood, new_zip_code, new_phone);
    select last_insert_id() into aux_address;
  end if;
  select id_purchase from purchase where id_user = user and closed = 0 into purchase_key;
  update purchase set closed = 1, id_discount = new_discount, date = now(), id_billing_address = aux_address, id_location = location where id_user = user and closed = 0;
  call update_purchase(purchase_key);
end

-- Procedimiento para cerrar una compra en sucursal
create procedure purchase_in_branch(user_key int, new_discount int)
begin
  declare purchase_key int;
  declare address_key int;
  select id_shipping_address from user where id_user = user_key into address_key;
  select id_purchase from purchase where id_user = user_key and closed = 0 into purchase_key;
  update purchase set closed = 1, id_discount = new_discount, date = now(), id_billing_address = address_key, id_location = address_key where id_user = user_key and closed = 0;
  call update_purchase(purchase_key);
end