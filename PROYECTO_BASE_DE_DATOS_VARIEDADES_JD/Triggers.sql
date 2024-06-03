
 DELIMITER $$
CREATE TRIGGER actualizarProductos
AFTER INSERT ON ventas_productos
FOR EACH ROW
BEGIN
    DECLARE cantidadRestar INT;
    DECLARE idProducto INT;

    SET cantidadRestar = NEW.cantidad;
    SET idProducto = NEW.p_id_producto;

    UPDATE productos
    SET cantidad_disponible = cantidad_disponible - cantidadRestar
    WHERE id_producto = idProducto;
END $$




 
 