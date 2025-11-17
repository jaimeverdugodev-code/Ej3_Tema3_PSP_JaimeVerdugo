CREATE TABLE IF NOT EXISTS tipos_camisa (
  id           BIGSERIAL PRIMARY KEY,
  nombre       VARCHAR(100) NOT NULL UNIQUE,
  descripcion  VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS camisas (
  id           BIGSERIAL PRIMARY KEY,
  nombre       VARCHAR(120) NOT NULL,
  talla        VARCHAR(10),
  color        VARCHAR(50),
  precio       NUMERIC(10,2),
  imagen_url   VARCHAR(300),
  lat          DOUBLE PRECISION,
  lng          DOUBLE PRECISION,
  tipo_id      BIGINT NOT NULL REFERENCES tipos_camisa(id)
);

CREATE INDEX IF NOT EXISTS idx_camisas_tipo ON camisas(tipo_id);
