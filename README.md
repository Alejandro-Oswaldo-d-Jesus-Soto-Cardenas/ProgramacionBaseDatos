# ProgramacionBaseDatos

# Pasos para implementar una base de datos en SQL Server 2022 1 Primero lo que hacemos es descargar la imagen de SQL Server 2022 para poder inicializar con nuestra implementación.

docker rmi mcr.microsoft.com/mssql/server:2022-latest

Después creamos un contenedor de docker para poner trabajar debes de configurar una contraseña segura y un nombre para poder conectar con nuestra base de datos docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Araceli123!' -p 1433:1433 --name sql_server_2022 -d mcr.microsoft.com/mssql/ server:2022-latest
3.Para verificar que mi contenedor de mi docker está corriendo y todo esta bien usamos este comando de verificación. docker ps

Después de verificar la conexión vamos a ir a verificar y conectar con nuestra base de datos y completamos los datos que nos pide y damos conectar .
5.Cuando conectamos nos manda una lista de archivo del mismo contenedor donde nos muestra todas las carpetas de base de datos.

Después de esto instalamos la extensión de SQL Server(mssql)

Aquí iniciamos y creamos un archivo y colocamos el código para crear nuestra primera Base de Datos .

De aquí creamos nuestras tablas como nos piden en la actividad. CREATE TABLE seller ( id INT PRIMARY KEY IDENTITY(1,1),
type_document CHAR(3) NOT NULL,
number_document CHAR(15) NOT NULL,
names VARCHAR(60) NOT NULL,
last_name VARCHAR(90) NOT NULL,
salary DECIMAL(8,2) NOT NULL,
cell_phone CHAR(9),
email VARCHAR(80),
active BIT NOT NULL
);

CREATE TABLE clothes ( id INT PRIMARY KEY IDENTITY(1,1),
descriptions VARCHAR(60) NOT NULL,
brand VARCHAR(60) NOT NULL,
amount INT NOT NULL,
size VARCHAR(10) NOT NULL,
price DECIMAL(8,2) NOT NULL,
active BIT NOT NULL
);

CREATE TABLE sale ( id INT PRIMARY KEY IDENTITY(1,1),
date_time DATETIME NOT NULL,
seller_id INT,
client_id INT,
active BIT NOT NULL,
CONSTRAINT FK_sale_seller FOREIGN KEY (seller_id) REFERENCES seller(id), CONSTRAINT FK_sale_client FOREIGN KEY (client_id) REFERENCES client(id) );

CREATE TABLE sale_detail ( id INT PRIMARY KEY IDENTITY(1,1),
sale_id INT,
clothes_id INT,
amount INT NOT NULL,
CONSTRAINT FK_sale_detail_sale FOREIGN KEY (sale_id) REFERENCES sale(id), CONSTRAINT FK_sale_detail_clothes FOREIGN KEY (clothes_id) REFERENCES clothes(id) );

De aquí realizamos las relaciones entre las tablas. ALTER TABLE sale ADD CONSTRAINT sale_client FOREIGN KEY (client_id) REFERENCES client(id);
ALTER TABLE sale ADD CONSTRAINT sale_seller FOREIGN KEY (seller_id) REFERENCES seller(id);

ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_sale FOREIGN KEY (sale_id) REFERENCES sale(id);

ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_clothes FOREIGN KEY (clothes_id) REFERENCES clothes(id);

Y vemos los enlaces con el siguiente comando SELECT fk.name [Constraint], OBJECT_NAME(fk.parent_object_id) [Tabla], COL_NAME(fc.parent_object_id, fc.parent_column_id) [Columna FK], OBJECT_NAME (fk.referenced_object_id, fc.referenced_column_id) AS [Columna PK] FROM sys.foreign_keys fk INNER JOIN sys.foreign_key_columns fc ON (fk.OBJECT_ID = fc.constraint_object_id) GO

Y de ahí nos mostrará la siguiente tabla donde detalla todo las relaciones

Código completo del trabajo realizado: SELECT @@VERSION;

ALTER DATABASE db_SalesClothes SET SINGLE_USER WITH ROLLBACK IMMEDIATE; GO

DROP DATABASE IF EXISTS db_SalesClothes;

CREATE DATABASE db_SalesClothes;

USE db_SalesClothes;

USE master; GO

CREATE TABLE client ( id int, type_document char(3), number_document char(15), names varchar(60), last_name varchar(90), email varchar(80), cell_phone char(9), birthdate date, activate BIT, CONSTRAINT client_pk PRIMARY KEY(id)

);

SELECT * FROM INFORMATION_SCHEMA.TABLES;

DROP TABLE client;

CREATE TABLE seller ( id INT PRIMARY KEY IDENTITY(1,1),
type_document CHAR(3) NOT NULL,
number_document CHAR(15) NOT NULL,
names VARCHAR(60) NOT NULL,
last_name VARCHAR(90) NOT NULL,
salary DECIMAL(8,2) NOT NULL,
cell_phone CHAR(9),
email VARCHAR(80),
active BIT NOT NULL
);

CREATE TABLE clothes ( id INT PRIMARY KEY IDENTITY(1,1),
descriptions VARCHAR(60) NOT NULL,
brand VARCHAR(60) NOT NULL,
amount INT NOT NULL,
size VARCHAR(10) NOT NULL,
price DECIMAL(8,2) NOT NULL,
active BIT NOT NULL
);

CREATE TABLE sale ( id INT PRIMARY KEY IDENTITY(1,1),
date_time DATETIME NOT NULL,
seller_id INT,
client_id INT,
active BIT NOT NULL,
CONSTRAINT FK_sale_seller FOREIGN KEY (seller_id) REFERENCES seller(id), CONSTRAINT FK_sale_client FOREIGN KEY (client_id) REFERENCES client(id) );

CREATE TABLE sale_detail ( id INT PRIMARY KEY IDENTITY(1,1),
sale_id INT,
clothes_id INT,
amount INT NOT NULL,
CONSTRAINT FK_sale_detail_sale FOREIGN KEY (sale_id) REFERENCES sale(id), CONSTRAINT FK_sale_detail_clothes FOREIGN KEY (clothes_id) REFERENCES clothes(id) );

SELECT * FROM sys.tables;

ALTER TABLE sale ADD CONSTRAINT sale_client FOREIGN KEY (client_id) REFERENCES client(id) ON UPDATE CASCADE ON DELETE CASCADE GO

SELECT fk.name[Constraint], OBJECT_NAME(fk.parent_object_id) [tabla], COL_NAME(fc.parent_object_id, fc.referenced_column_id) AS [Tabla base], OBJECT_NAME (fk.referenced_object_id) AS [Columna PK] FROM sys.foreign_keys fk INNER JOIN sys.foreign_key_columns fc ON (fk.object_id = fc.constraint_object_id) GO

ALTER TABLE sale DROP CONSTRAINT sale_client GO

SELECT fk.name [Constraint], OBJECT_NAME(fk.parent_object_id) [Tabla], COL_NAME(fc.parent_object_id, fc.parent_column_id) [Columna FK], OBJECT_NAME (fk.referenced_object_id, fc.referenced_column_id) AS [Columna PK] FROM sys.foreign_keys fk INNER JOIN sys.foreign_key_columns fc ON (fk.OBJECT_ID = fc.constraint_object_id) GO

ALTER TABLE sale ADD CONSTRAINT sale_client FOREIGN KEY (client_id) REFERENCES client(id);

ALTER TABLE sale ADD CONSTRAINT sale_seller FOREIGN KEY (seller_id) REFERENCES seller(id);

ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_sale FOREIGN KEY (sale_id) REFERENCES sale(id);

ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_clothes FOREIGN KEY (clothes_id) REFERENCES clothes(id);

About
No description, website, or topics provided.
Resources
 Readme
 Activity
Stars
 1 star
Watchers
 0 watching
Forks
 0 forks
Releases
No releases published
Create a new release
Packages
No packages published
Publish your first package
Footer
© 2025 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact
Manage cookies
Do not share my personal information
Alejandro-Oswaldo-d-Jesus-Soto-Cardenas/ProgramacionBaseDatos at develop
