
show databases;

show tables; 

describe ventas;

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


create table productos(
id_producto int not null primary key,
nombre varchar(200) not null,
cantidad_disponible int not null,
precio_bruto double not null,
precio_neto double not null,
categoria int,
constraint productos_categorias_fk foreign key (categoria) references categorias(id_categoria)
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
constraint proveedores_empresa_fk foreign key (empresa) references empresas (id_empresa)
);


create table empleados(
id_empleado int not null primary key,
nombre varchar(200) not null,
telefono varchar(100) not null,
salario double not null,
fecha_nacimiento date not null
);


create table compras(
id_compra int AUTO_INCREMENT primary key ,
fecha_compra date not null,
precio_tl double not null
);


create table ventas(
id_venta int AUTO_INCREMENT primary key,
precio_total double not null,
empleado int,
constraint ventas_empleado_fk foreign key (empleado) references empleados (id_empleado)
);


TABLA DE MUCHOS A MUCHOS PRODUC_COMPRA

create table compras_productos(
id_compra int not null,
id_producto int not null,
cantidad int not null,
primary key(id_compra,id_producto),
constraint compras_productos_compras_fk foreign key (id_compra) references compras (id_compra),
constraint compras_productos_productos_fk foreign key (id_producto) references productos (id_producto) 
);


TABLA DE MUCHOS A MUCHOS PRODUCTO-PROVEED

create table proveedores_productos(
id_proveedor int not null,
id_producto int not null,
primary key(id_proveedor,id_producto),
constraint proveedores_productos_productos_fk foreign key (id_producto) references productos(id_producto),
constraint proveedores_productos_proveedores_fk foreign key (id_proveedor) references proveedores(id_proveedor)
);


TABLA DE MUCHOS A VENTA_PRODUCTO

create table ventas_productos(
id_venta int not null,
id_producto int not null,
cantidad int not null,
constraint ventas_productos_ventas_fk foreign key (id_venta) references ventas(id_venta),
constraint ventas_productos_productos_fk foreign key (id_producto) references productos(id_producto)
);

