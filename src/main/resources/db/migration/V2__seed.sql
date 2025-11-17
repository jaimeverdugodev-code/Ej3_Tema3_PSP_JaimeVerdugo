INSERT INTO tipos_camisa (id, nombre, descripcion) VALUES
(1, 'Oxford', 'Algodón tejido tipo Oxford'),
(2, 'Camiseta', 'Tejido jersey, cuello redondo'),
(3, 'Lino', 'Ligera y transpirable para verano'),
(4, 'Polo', 'Piqué con cuello y botones')
ON CONFLICT (id) DO NOTHING;

INSERT INTO camisas (nombre, talla, color, precio, imagen_url, lat, lng, tipo_id) VALUES
('Oxford Azul', 'M', 'Azul', 39.99, NULL, NULL, NULL, 1),
('Camiseta Negra Básica', 'S', 'Negro', 12.99, NULL, NULL, NULL, 2),
('Lino Natural', 'M', 'Beige', 49.00, NULL, NULL, NULL, 3),
('Polo Verde', 'M', 'Verde', 24.90, NULL, NULL, NULL, 4)
ON CONFLICT (nombre) DO NOTHING;

