CREATE DATABASE POWERFITBD

USE POWERFITBD

CREATE TABLE Condicion
(
	cod_cond nchar(4)
		constraint Condicion_cod_cond_pk primary key,
	nomb_cond nvarchar(80),
	tipo_cond nvarchar(80)
)

CREATE TABLE Membresia
(
	cod_memb nchar(4)
		constraint Membresia_cod_memb_pk primary key,
	nomb_memb nvarchar(20),
	descripcion nvarchar(80),
	precio float 
)

CREATE TABLE Sucursal
(
	cod_sucursal nchar(4)
		constraint Sucursal_cod_sucursal_pk primary key,
	provincia nvarchar(20),
	ubicacion nvarchar(20) 
)

CREATE TABLE Posicion
(
	cod_posicion nchar(4)
		constraint Posicion_cod_posicion_pk primary key,
	nom_posicion nvarchar(20)
)

CREATE TABLE Empleado
( 
	ced_empleado nvarchar(12)
		Constraint Empleado_ced_empleado_pk primary key,
	nomb_empleado nvarchar(20),
	apell_empleado nvarchar(20),
	cod_posicion nchar(4),
	cod_sucursal nchar(4),
	salario float,
		constraint Empleado_cod_posicion_fk
			foreign key (cod_posicion) references Posicion(cod_posicion),
		constraint Empleado_cod_sucursal_fk
			foreign key (cod_sucursal) references Sucursal(cod_sucursal)
)

CREATE TABLE  Cliente
(
	ced_cliente nvarchar(12),
	fecha_adqui date,
		Constraint Cliente_ced_cliente_pk
			primary key(ced_cliente),
	nomb_cliente nvarchar(20),
	apell_cliente nvarchar(20),
	fecha_nac date,
	peso float,
	sexo nvarchar(20),
	cod_sucursal nchar(4),
	cod_memb nchar(4),
		Constraint Cliente_cod_memb_fk
			foreign key (cod_memb) references Membresia(cod_memb),
		Constraint Cliente_cod_sucursal_fk
			foreign key (cod_sucursal) references Sucursal(cod_sucursal)
)

CREATE TABLE  Invitado
(
	ced_invitado nvarchar(12),
	fecha_visita date,
		Constraint Invitado_ced_invitado_fecha_visita_pk
			primary key(ced_invitado,fecha_visita),
	nomb_invitado varchar(20),
	ced_cliente nvarchar(12),
		Constraint Invitado_ced_cliente_fk
			foreign key (ced_cliente) references Cliente(ced_cliente)
)

CREATE TABLE  Condicion_cliente
(
	ced_cliente nvarchar(12),
	cod_cond nchar(4),
		Constraint Condicion_cliente_ced_cliente_cod_cond_pk
			primary key(ced_cliente,cod_cond),
		Constraint Condicion_cliente_ced_cliente_fk
			foreign key (ced_cliente) references Cliente(ced_cliente),
		Constraint Condicion_cliente_cod_cond_fk
			foreign key (cod_cond) references Condicion(cod_cond)
)

alter table cliente
	nocheck constraint [Cliente_cod_memb_fk]

alter table cliente
	nocheck constraint [Cliente_cod_sucursal_fk]

alter table empleado
	nocheck constraint [Empleado_cod_posicion_fk]

alter table Condicion_cliente
	nocheck constraint [Condicion_cliente_ced_cliente_fk]

alter table Invitado
	nocheck constraint [Invitado_ced_cliente_fk]


INSERT INTO Condicion
VALUES('1001','Epilepsia','Trastorno Cerebral'),
('1002','Alzheimer','Trastorno Cerebral'),
('1005','Hemofilia','Trastorno Hemorragico'),
('1006','Diabetes','Metabolico'),
('1008','Anemia','Genetico'),
('1009','Distrofia Muscular','Genetico')


INSERT INTO Sucursal
VALUES('0101','Panama','Tumba Muerto'),
('0202','Panama','Albrook'),
('0303','Panama','Los Andes'),
('0404','Panama','Via España'),
('0505','Panama Oeste','Costa Verde'),
('0606','Chiriqui','David'),
('0707','Chiriqui','Boquete')


INSERT INTO Posicion 
VALUES('1237','Aseo'),
('1234','Recepcionista'),
('1235','Instructor'),
('1236','Entrenador')


INSERT INTO Membresia
VALUES('1111','BASICO', 'Acceso a las instalaciones por un mes',20.00),
('2222','PREMIUM','Acceso a las instalaciones y clases exclusivas por un mes', 40.00),
('3333', 'GOLD','Acceso a las instalaciones, clases exclusivas y sillas de masaje por un mes',60.00)


INSERT INTO Empleado
VALUES('8-123-456','Juan',' Perez','1234','0101',1000),
('8-123-674','Ana',' Gomez','1235','0101',1500),
('8-123-984','Marcos',' Gonzalez','1236','0101',1500),
('8-123-900','Marta',' Marquez','1237','0101',600),
('8-788-784','Bernardo ','Gomez','1234','0202',1000),
('8-837-859','Lucas',' Cartagena','1235','0202',1500),
('8-323-940','Raul ','Lezcano','1236','0202',1500),
('8-785-984','Jacob',' Luna','1237','0202',600),
('8-445-959','Jair',' Martinez','1234','0303',1000),
('8-589-695','Lina ','Fernandez','1235','0303',1500),
('8-903-455','Berta',' Dominguez','1236','0303',1500),
('8-873-123','Gonzalo ','Lopez','1237','0303',600),
('8-940-944','Juan ','Leal','1234','0404',1000),
('8-1000-234','Rosa ','Melendez','1235','0404',1500),
('8-1000-345','Luis ','Ortiz','1236','0404',1500),
('8-1000-531','Martin ','Camargo','1237','0404',600),
('8-984-233','Brisa',' Altozano','1234','0505',1000),
('8-432-955','Angelica',' Berrio','1235','0505',1500),
('8-555-934','Juana',' Melendez','1236','0505',1500),
('8-857-809','Michael',' Jackson','1237','0505',600),
('4-223-456','Eladio',' Perez','1234','0606',1000),
('4-923-674','Rigoberto ','Rios','1235','0606',1500),
('4-823-984','Aracely',' Lopez','1236','0606',1500),
('4-723-900','Leandro',' Vargas','1237','0606',600),
('4-623-456','Martina',' Lara','1234','0707',1000),
('4-123-674','Rita',' Cortizo','1235','0707',1500),
('4-523-984','Alma ','Vergas','1236','0707',1500),
('4-423-900','Julio',' Ferrer','1237','0707',600)

Create procedure ListarEmpleados
as 
Select ced_empleado as Cedula, nomb_empleado as Nombre, 
apell_empleado as Apellido, cod_posicion as Posicion, 
cod_sucursal as Sucursal, salario as Salario 
from empleado

Create procedure ListarSucursales
as 
Select cod_sucursal as Codigo, provincia as Provincia, 
ubicacion as Ubicacion from Sucursal

Create procedure ListarPosiciones
as 
Select cod_posicion as Codigo, nom_posicion as Posicion from Posicion


create procedure ListarCondiciones
as 
select cod_cond as Codigo, nomb_cond as Nombre, tipo_cond as Tipo from condicion

create procedure ListaCondicionesClientes
as 
select * from Condicion_cliente

create procedure ListarMembresia
as 
select * from Membresia

create proc NuevoCliente(
	@ced_cliente nvarchar(12),
	@fecha_adqui date,
	@nomb_cliente nvarchar(20),
	@apell_cliente nvarchar(20),
	@fecha_nac date,
	@peso float,
	@sexo nvarchar(20),
	@cod_sucursal nchar(4),
	@cod_memb nchar(4) )
as 
insert into cliente
values(	@ced_cliente,
	@fecha_adqui,
	@nomb_cliente,
	@apell_cliente,
	@fecha_nac,
	@peso,
	@sexo,
	@cod_sucursal,
	@cod_memb)

create proc InsertarCondiciones(
	@ced_cliente nvarchar(12),
	@cod_cond nchar(4)
)
as
insert into Condicion_cliente
values(@ced_cliente,@cod_cond)

create proc InsertarInvitado(
	@ced_invitado nvarchar(12),
	@fecha_visita date,
	@nomb_invitado nvarchar(20),
	@ced_cliente nvarchar(12)	
)
as
insert into Invitado
values(@ced_invitado,@fecha_visita,@nomb_invitado,@ced_cliente)



Create procedure ListarClientes
as
SELECT ced_cliente as Cedula, nomb_cliente as Nombre, 
apell_cliente as Apellido, DATEDIFF(YEAR, fecha_nac, GETDATE()) AS Edad, 
peso as Peso, sexo as Sexo, cod_sucursal as Sucursal, cod_memb as Membresia
FROM Cliente

Create procedure actualizarSalario
@ced_empleado nvarchar(12),
@salario float
as
UPDATE Empleado
SET salario = @salario
WHERE ced_empleado = @ced_empleado


Create procedure actualizarSucursal
@ced_empleado nvarchar(12),
@cod_sucursal nchar(4)
as
UPDATE Empleado
SET cod_sucursal = @cod_sucursal
WHERE ced_empleado = @ced_empleado


Create procedure ListarInvitados
as
select ced_invitado as Cedula, nomb_invitado as Nombre, 
ced_cliente as [Invitado por], fecha_visita as Fecha from invitado