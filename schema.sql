-- JUAN FERNANDO GONZALEZ CASTRO

CREATE DATABASE proyecto;
USE proyecto;

-- Creación de la tabla Roles
CREATE TABLE Rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla Usuarios
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(50),
    apellido_paterno VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    contraseña VARCHAR(50) NOT NULL,
    id_rol INT,
    CONSTRAINT fk_usuarios_roles FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

-- Creación de la tabla Proyectos
CREATE TABLE Proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR (500),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_jefe_departamento INT,
    CONSTRAINT fk_proyectos_jefe FOREIGN KEY (id_jefe_departamento) REFERENCES Usuario(id_usuario),
	CONSTRAINT chk_fecha_fin CHECK (fecha_fin >= fecha_inicio)
);

-- Creación de la tabla Miembros_Proyecto
CREATE TABLE MiembroProyecto (
    id_miembro_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    id_usuario INT,
    CONSTRAINT fk_miembros_proyecto_proyectos FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto),
    CONSTRAINT fk_miembros_proyecto_usuarios FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Creación de la tabla Estados_Tarea
CREATE TABLE EstadoTarea (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla Tareas
CREATE TABLE Tarea (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR (500),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_proyecto INT,
    id_usuario_asignado INT,
    id_estado INT,
    CONSTRAINT fk_tareas_proyectos FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto),
    CONSTRAINT fk_tareas_usuarios FOREIGN KEY (id_usuario_asignado) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_tareas_estados FOREIGN KEY (id_estado) REFERENCES EstadoTarea(id_estado),
	CONSTRAINT chk_fecha_fin CHECK (fecha_fin >= fecha_inicio)
);

-- Creación de la tabla Comentarios_Tareas
CREATE TABLE ComentarioTarea (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_tarea INT,
    id_usuario INT,
    comentario VARCHAR (500),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comentarios_tareas_tareas FOREIGN KEY (id_tarea) REFERENCES Tarea(id_tarea),
    CONSTRAINT fk_comentarios_tareas_usuarios FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    INDEX (id_tarea),
    INDEX (id_usuario)
);
