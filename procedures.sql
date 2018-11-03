// Procedimiento para registrar un nuevo usuario
create procedure sign_up(
  in
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
