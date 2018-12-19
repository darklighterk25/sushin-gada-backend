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
  declare aux_total varchar(45);
  declare aux_taxes varchar(45);
  select sum(subtotal) from items where id_purchase = purchase_key into aux_total;
  if aux_total is null then
    set aux_total = 0;
  end if;
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