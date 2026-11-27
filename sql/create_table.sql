-- CREACIÓN DE TABLAS

-- 1. Campus
CREATE TABLE Campus (
    id_campus INTEGER PRIMARY KEY,
    Campus VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Verticales
CREATE TABLE Verticales (
    id_vertical INTEGER PRIMARY KEY,
    Vertical VARCHAR(100) NOT NULL UNIQUE
);

-- 3. Roles
CREATE TABLE Roles (
    id_rol INTEGER PRIMARY KEY,
    Rol VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Profesores
CREATE TABLE Profesores (
    id_profesor INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- 5. Clases
CREATE TABLE Clases (
    id_clase INTEGER PRIMARY KEY,
    id_campus INTEGER NOT NULL,
    id_vertical INTEGER NOT NULL,
    Promocion VARCHAR(100) NOT NULL,
    Fecha_comienzo DATE NOT NULL,

    FOREIGN KEY (id_campus) REFERENCES Campus(id_campus),
    FOREIGN KEY (id_vertical) REFERENCES Verticales(id_vertical)
);

-- 6. Proyectos
CREATE TABLE Proyectos (
    id_proyecto INTEGER PRIMARY KEY,
    id_vertical INTEGER NOT NULL,
    Proyecto VARCHAR(100) NOT NULL,

    FOREIGN KEY (id_vertical) REFERENCES Verticales(id_vertical),
    UNIQUE (id_vertical, Proyecto)
);

-- 7. Alumnos
CREATE TABLE Alumnos (
    id_alumno INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    id_clase INTEGER NOT NULL,

    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- 8. Claustro
CREATE TABLE Claustro (
    id_claustro INTEGER PRIMARY KEY,
    id_profesor INTEGER NOT NULL,
    id_campus INTEGER NOT NULL,
    id_vertical INTEGER NOT NULL,
    Promocion VARCHAR(100) NOT NULL,
    id_rol INTEGER NOT NULL,
    Modalidad VARCHAR(100) NOT NULL,

    FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor),
    FOREIGN KEY (id_campus) REFERENCES Campus(id_campus),
    FOREIGN KEY (id_vertical) REFERENCES Verticales(id_vertical),
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

-- 9. Evaluaciones
CREATE TABLE Evaluaciones (
    id_alumno INTEGER NOT NULL,
    id_proyecto INTEGER NOT NULL,
    Evaluacion VARCHAR(100) NOT NULL,

    PRIMARY KEY (id_alumno, id_proyecto),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);