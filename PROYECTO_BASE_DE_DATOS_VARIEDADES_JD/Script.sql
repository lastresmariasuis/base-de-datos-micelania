

create database Variedades_JD;
use Variedades_JD;


create table categorias(
id_categoria int not null primary key,
nombre varchar(200) not null
);


create table ciudades(
id_ciudad int not null primary key,
nombre varchar(200) not null
);

create table sugerencias(
id_sugerencia int not null primary key,
nombre varchar(200) not null,
descripcion varchar(200) not null
);


create table empresas(
id_empresa int not null primary key,
nombre varchar(200) not null,
telefono varchar(100) not null,
direccion varchar(100) not null,
ciudad int,
e_mail varchar(100) not null,
constraint empresas_ciudades_fk foreign key (ciudad) references ciudades(id_ciudad)
);


create table proveedores(
id_proveedor int not null primary key,
empresa int,
nombre_proveedor varchar(200),
constraint proveedores_empresa_fk foreign key (empresa) references empresas (id_empresa)
);


create table productos(
id_producto int not null primary key,
nombre varchar(200) not null,
cantidad_disponible int not null,
precio_bruto double not null,
precio_neto double not null,
categoria int,
id_proveedor int,
constraint productos_categorias_fk foreign key (categoria) references categorias(id_categoria),
constraint productos_proveedores_fk foreign key (id_proveedor) references proveedores(id_proveedor)
);


create table empleados(
id_empleado int not null primary key,
nombre varchar(200) not null,
telefono varchar(100) not null,
salario double not null,
fecha_nacimiento varchar(100) not null
);


create table compras(
id_compra int AUTO_INCREMENT primary key ,
fecha_compra varchar(100) not null,
precio_tl double not null
);


create table ventas(
id_venta int AUTO_INCREMENT primary key,
precio_total double not null,
empleado int,
constraint ventas_empleado_fk foreign key (empleado) references empleados (id_empleado)
);



create table compras_productos(
c_id_compra int not null,
p_id_producto int not null,
cantidad int not null,
primary key(c_id_compra,p_id_producto),
constraint compras_productos_compras_fk foreign key (c_id_compra) references compras (id_compra),
constraint compras_productos_productos_fk foreign key (p_id_producto) references productos (id_producto) 
);




create table ventas_productos(
v_id_venta int not null,
p_id_producto int not null,
cantidad int not null,
primary key(v_id_venta,p_id_producto),
constraint ventas_productos_ventas_fk foreign key (v_id_venta) references ventas(id_venta),
constraint ventas_productos_productos_fk foreign key (p_id_producto) references productos(id_producto)
);



