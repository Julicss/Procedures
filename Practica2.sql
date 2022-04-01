--Crear un procedimiento almacenado que actualice los precios de venta de todos
--aquellos productos cuyo precio de venta es menor al precio de venta promedio.
--Ingresar por parámetro la lista a actualizar (mayorista o minorista) y el porcentaje
--de incremento


create procedure blanco3 as 
declare @promedio float, @cod int
select @promedio=avg(p.precio_costo) from producto p
declare precios cursor for select p.codigo_producto from producto p where p.precio_costo<@promedio
open precios
fetch next from precios into @cod
while @@Fetch_Status =0
begin
print @cod
fetch next from precios into @cod
end
close precios
deallocate precios

exec blanco3


create procedure blanco5 as 
declare @promedios float, @cod int
select @promedios=avg(p.precio_costo) from  producto p 
declare precio cursor for select p.codigo_producto from producto p
where p.precio_costo<@promedios
open precio
fetch next from precio into @cod
while @@FETCH_STATUS=0
begin 
print @cod
fetch next from precio into @cod
end 
close precio
deallocate precio 

exec blanco5

--Crear un procedimiento almacenado que ingresando como parámetros: nombre
--del producto, cantidad comprada, código de fabricante y precio de costo, realice
--las siguientes acciones: En el caso en que el producto sea nuevo darlo de alta en
--la tabla “producto”, en cualquier caso, actualice el stock y el punto de reposición
--del producto.


declare @nuevo varchar(255),@cantidad int,@cod int,@precio_costo float
set @nuevo='Arandela'
set @cantidad=100
set @cod=1
set @precio_costo=0.605
declare @codigo int
select @codigo=p.codigo_producto from producto p where p.descripcion= @nuevo
if (@codigo is not null)
begin
	update stock set cantidad=cantidad-@cantidad where codigo_producto =@codigo
	end
	ELSE
begin
insert into producto (descripcion, precio_costo, codigo_fabricante) values (@nuevo, @precio_costo,@cod)
end 


exec ejercicio1 
select * from producto 
select * from stock 



select * from stock

  