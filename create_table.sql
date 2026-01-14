DROP TABLE IF EXISTS ventas;

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    fecha DATE,
    producto TEXT,
    categoria TEXT,
    monto DECIMAL(10,2),
    metodo_pago TEXT
);
