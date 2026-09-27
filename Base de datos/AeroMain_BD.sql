USE aeromaint;
CREATE TABLE aeronave (
    id_aeronave INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    numero_serie VARCHAR(50) NOT NULL UNIQUE,
    ciclos INT UNSIGNED NOT NULL,
    estado VARCHAR(20) NOT NULL
);
CREATE TABLE tecnico (
    id_tecnico INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    licencia VARCHAR(30) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL
);
CREATE TABLE componente (
    id_componente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_aeronave INT UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    numero_parte VARCHAR(50) NOT NULL UNIQUE,
    numero_serie VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL,
    ciclos INT UNSIGNED NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_aeronave) REFERENCES aeronave(id_aeronave)
);
CREATE TABLE orden_mantenimiento (
    id_orden INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_aeronave INT UNSIGNED NOT NULL,
    fecha_apertura DATE NOT NULL,
    fecha_cierre DATE NULL,
    tipo_mantenimiento VARCHAR(30) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    prioridad VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_aeronave) REFERENCES aeronave(id_aeronave)
);
CREATE TABLE mantenimiento (
    id_mantenimiento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_orden INT UNSIGNED NOT NULL,
    id_tecnico INT UNSIGNED NOT NULL,
    id_componente INT UNSIGNED NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    descripcion VARCHAR(255) NOT NULL,
    resultado VARCHAR(255) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES orden_mantenimiento(id_orden),
    FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico),
    FOREIGN KEY (id_componente) REFERENCES coaeromaintaeromaintaeromaintaeromaintmponente(id_componente)
);
CREATE TABLE usuario (
    id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(aeromaint100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL
);