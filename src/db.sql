CREATE DATABASE IF NOT EXISTS gonzalo_barber;
USE gonzalo_barber;


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    rol ENUM('cliente', 'admin') NOT NULL DEFAULT 'cliente',
    puntos INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    duracion INT NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Turnos (Relacional *Usuario/Servicio*)

CREATE TABLE turnos (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    servicio_id INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado ENUM('pendiente', 'completado', 'cancelado') NOT NULL DEFAULT 'pendiente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (servicio_id) REFERENCES servicios(id_servicio) ON DELETE CASCADE
);

-- 	MODULO COMERCIAL --

CREATE TABLE categorias(
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
categoria_id INT NOT NULL,
nombre VARCHAR (100) NOT NULL,
descripcion VARCHAR (255),
precio DECIMAL (10,2) NOT NULL,
stock INT NOT NULL,
imagen_url VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria) ON DELETE CASCADE
);

-- MODULO VENTAS 

CREATE TABLE ventas (
id_venta INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT,
total DECIMAL (10,2) NOT NULL,
tipo_venta enum ('web', 'mostrador') NOT NULL,
estado enum('pendiente','completado','cancelado') NOT NULL DEFAULT 'pendiente',

FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario) ON DELETE CASCADE
);

CREATE TABLE detalle_ventas (
id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
venta_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario DECIMAL (10,2) NOT NULL,

FOREIGN KEY (venta_id) REFERENCES ventas (id_venta) ON DELETE CASCADE,
FOREIGN KEY (producto_id) REFERENCES productos (id_producto) ON DELETE CASCADE
);

