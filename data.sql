-- Inserción de datos en la tabla Rol
INSERT INTO Rol (nombre) VALUES ('Administrador');
INSERT INTO Rol (nombre) VALUES ('Desarrollador');
INSERT INTO Rol (nombre) VALUES ('Jefe de Proyecto');

-- Inserción de datos en la tabla Usuario
INSERT INTO Usuario (nombre, apellido_paterno, apellido_materno, email, contraseña, id_rol)
VALUES ('Juan', 'Gonzalez', 'Perez', 'juan.gonzalez@example.com', '1234', 1);
INSERT INTO Usuario (nombre, apellido_paterno, apellido_materno, email, contraseña, id_rol)
VALUES ('Maria', 'Fernandez', 'Lopez', 'maria.fernandez@example.com', '5678', 2);
INSERT INTO Usuario (nombre, apellido_paterno, apellido_materno, email, contraseña, id_rol)
VALUES ('Carlos', 'Ramirez', 'Sanchez', 'carlos.ramirez@example.com', 'abcd', 3);

-- Inserción de datos en la tabla Proyecto
INSERT INTO Proyecto (nombre, descripcion, fecha_inicio, fecha_fin, id_jefe_departamento)
VALUES ('Proyecto Alpha', 'Desarrollo de una plataforma web', '2023-01-01', '2023-12-31', 3);
INSERT INTO Proyecto (nombre, descripcion, fecha_inicio, fecha_fin, id_jefe_departamento)
VALUES ('Proyecto Beta', 'Implementación de un sistema de gestión', '2023-02-01', '2023-10-31', 3);

-- Inserción de datos en la tabla MiembroProyecto
INSERT INTO MiembroProyecto (id_proyecto, id_usuario) VALUES (1, 1); -- Juan en Proyecto Alpha
INSERT INTO MiembroProyecto (id_proyecto, id_usuario) VALUES (1, 2); -- Maria en Proyecto Alpha
INSERT INTO MiembroProyecto (id_proyecto, id_usuario) VALUES (2, 1); -- Juan en Proyecto Beta
INSERT INTO MiembroProyecto (id_proyecto, id_usuario) VALUES (2, 2); -- Maria en Proyecto Beta

-- Inserción de datos en la tabla EstadoTarea
INSERT INTO EstadoTarea (nombre) VALUES ('Pendiente');
INSERT INTO EstadoTarea (nombre) VALUES ('En Proceso');
INSERT INTO EstadoTarea (nombre) VALUES ('Completada');

-- Inserción de datos en la tabla Tarea
INSERT INTO Tarea (nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto, id_usuario_asignado, id_estado)
VALUES ('Diseño de la interfaz', 'Diseño inicial de la interfaz gráfica', '2023-01-05', '2023-01-20', 1, 1, 1); -- Juan en Proyecto Alpha
INSERT INTO Tarea (nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto, id_usuario_asignado, id_estado)
VALUES ('Desarrollo del backend', 'Implementación de la lógica del servidor', '2023-01-21', '2023-06-01', 1, 2, 2); -- Maria en Proyecto Alpha
INSERT INTO Tarea (nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto, id_usuario_asignado, id_estado)
VALUES ('Pruebas unitarias', 'Realización de pruebas de las funciones', '2023-06-02', '2023-06-20', 2, 1, 1); -- Juan en Proyecto Beta

-- Inserción de datos en la tabla ComentarioTarea
INSERT INTO ComentarioTarea (id_tarea, id_usuario, comentario)
VALUES (1, 1, 'El diseño de la interfaz está en progreso.');
INSERT INTO ComentarioTarea (id_tarea, id_usuario, comentario)
VALUES (2, 2, 'El backend ha sido completado en un 50%.');
INSERT INTO ComentarioTarea (id_tarea, id_usuario, comentario)
VALUES (3, 1, 'Las pruebas unitarias se han iniciado.');
