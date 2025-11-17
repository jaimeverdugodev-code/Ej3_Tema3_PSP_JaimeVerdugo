-- Crear índice único para camisas para poder usar ON CONFLICT
CREATE UNIQUE INDEX IF NOT EXISTS idx_camisas_nombre_tipo ON camisas(nombre, tipo_id);

-- Insertar tipos de camisa
INSERT INTO tipos_camisa(nombre, descripcion)
VALUES
    ('Polo', 'Camisa tipo polo'),
    ('Camiseta', 'Camiseta casual'),
    ('Formal', 'Camisa de vestir formal')
ON CONFLICT(nombre) DO UPDATE
    SET descripcion = EXCLUDED.descripcion;

-- Insertar camisas
INSERT INTO camisas(nombre, talla, color, precio, imagen_url, lat, lng, tipo_id)
VALUES
    ('Camiseta Azul', 'M', 'Azul', 25.00, 'https://example.com/azul.jpg', 40.4168, -3.7038, (SELECT id FROM tipos_camisa WHERE nombre='Camiseta')),
    ('Camiseta Roja', 'L', 'Rojo', 28.50, 'https://example.com/roja.jpg', 40.4168, -3.7038, (SELECT id FROM tipos_camisa WHERE nombre='Camiseta')),
    ('Polo Verde', 'S', 'Verde', 35.00, 'https://example.com/verde.jpg', 40.4168, -3.7038, (SELECT id FROM tipos_camisa WHERE nombre='Polo')),
    ('Formal Blanca', 'M', 'Blanco', 40.00, 'https://example.com/blanca.jpg', 40.4168, -3.7038, (SELECT id FROM tipos_camisa WHERE nombre='Formal'))
ON CONFLICT(nombre, tipo_id) DO UPDATE
    SET talla = EXCLUDED.talla,
        color = EXCLUDED.color,
        precio = EXCLUDED.precio,
        imagen_url = EXCLUDED.imagen_url,
        lat = EXCLUDED.lat,
        lng = EXCLUDED.lng;


