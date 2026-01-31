--===============================
--Proyecto: Análisis de ventas
--Base de Datos: SQLite
--Autora: Jennifer Merida
--===============================


--1. Facturación por mes
SELECT strftime('%Y-%m', fecha) AS mes, SUM(monto) AS facturacion
FROM ventas
GROUP BY mes
ORDER BY mes;
-- --------------------------------------------------------

--2. Facturación por categoría
SELECT categoria, SUM(monto) AS facturacion
FROM ventas
GROUP BY categoria
ORDER BY facturacion DESC;
-- --------------------------------------------------------

--3. Facturación por producto
SELECT producto, SUM(monto) AS facturacion 
FROM ventas
GROUP BY producto
ORDER BY facturacion DESC;

-- --------------------------------------------------------

--4. Facturación por mes y categoría
SELECT strftime('%m',fecha) AS mes,categoria, SUM(monto) AS facturacion_total
FROM ventas
GROUP BY mes, categoria
ORDER BY mes, facturacion_total DESC;

-- --------------------------------------------------------

--5. Cantidad y facturación por método de pago
SELECT metodo_pago, COUNT(*) AS cantidad_vendida, SUM(monto) AS facturacion
FROM ventas
GROUP BY metodo_pago;

-- --------------------------------------------------------

--6. Cantidad de productos vendidos por categoría 
SELECT categoria, COUNT(producto) AS productos_vendidos
FROM ventas
GROUP BY categoria
ORDER BYproductos_vendidos DESC;

-- --------------------------------------------------------

--7. Producto más vendido por categoría
SELECT categoria, producto, cantidad
FROM (SELECT categoria, producto,  
             COUNT(*) AS cantidad,
             ROW_NUMBER() OVER(
             PARTITION BY categoria
             ORDER BY COUNT(*) DESC
             ) AS cp
     FROM ventas
     GROUP BY categoria, producto
)
WHERE cp = 1;

-- --------------------------------------------------------

--8. Porcentaje de facturación por categoría
SELECT categoria, ROUND(SUM(monto)*100/(SELECT SUM(monto) FROM ventas), 2) AS porcentaje
FROM ventas
GROUP BY categoria;

-- --------------------------------------------------------

--9. Porcentaje de facturación por método de pago
SELECT metodo_pago, ROUND(SUM(monto)*100/(SELECT SUM(monto) FROM ventas), 2) AS porcentaje
FROM ventas
GROUP BY metodo_pago;

-- --------------------------------------------------------

--10. Ticket promedio
SELECT ROUND(AVG(monto), 1) AS ticket_promedio
FROM ventas




