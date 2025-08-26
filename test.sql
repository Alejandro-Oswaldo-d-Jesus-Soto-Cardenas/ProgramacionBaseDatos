SELECT @@VERSION;

CREATE DATABASE TrabajoEnClase;

USE TrabajoEnClase;

CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),   -- ID único para cada categoría
    Nombre NVARCHAR(100) NOT NULL                 -- Nombre de la categoría
);


CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY IDENTITY(1,1),    -- ID único para cada proveedor
    Nombre NVARCHAR(100) NOT NULL,                 -- Nombre del proveedor
    Contacto NVARCHAR(100),                        -- Persona de contacto
    Telefono NVARCHAR(20),                         -- Teléfono del proveedor
    Email NVARCHAR(100)                           -- Correo electrónico
);


CREATE TABLE UtilesEscolares (
    UtilID INT PRIMARY KEY IDENTITY(1,1),           -- Identificador único para cada útil
    Nombre NVARCHAR(100) NOT NULL,                   -- Nombre del útil (por ejemplo, "Cuaderno")
    Descripcion NVARCHAR(255),                       -- Descripción del útil (opcional)
    Precio DECIMAL(10, 2) NOT NULL,                  -- Precio del útil
    Cantidad INT NOT NULL,                           -- Cantidad disponible en inventario
    CategoriaID INT,                                 -- Referencia a la tabla Categorias
    ProveedorID INT,                                 -- Referencia a la tabla Proveedores
    CONSTRAINT FK_UtilesEscolares_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    CONSTRAINT FK_UtilesEscolares_Proveedor FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);


SELECT * FROM sys.tables;


SELECT * FROM UtilesEscolares;




