SELECT @@VERSION;

ALTER DATABASE db_SalesClothes SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE IF EXISTS db_SalesClothes;

CREATE DATABASE db_SalesClothes;

USE db_SalesClothes;

USE master;
GO

CREATE TABLE client
(
    id int,
    type_document char(3),
    number_document char(15),
    names varchar(60),
    last_name varchar(90),
    email varchar(80),
    cell_phone char(9),
    birthdate date,
    activate BIT,
    CONSTRAINT client_pk PRIMARY KEY(id)

);

SELECT * FROM INFORMATION_SCHEMA.TABLES;

DROP TABLE client;

CREATE TABLE seller (
    id INT PRIMARY KEY IDENTITY(1,1),                 
    type_document CHAR(3) NOT NULL,                    
    number_document CHAR(15) NOT NULL,                 
    names VARCHAR(60) NOT NULL,                       
    last_name VARCHAR(90) NOT NULL,                    
    salary DECIMAL(8,2) NOT NULL,                      
    cell_phone CHAR(9),                                
    email VARCHAR(80),                                 
    active BIT NOT NULL                                
);

CREATE TABLE clothes (
    id INT PRIMARY KEY IDENTITY(1,1),                 
    descriptions VARCHAR(60) NOT NULL,                  
    brand VARCHAR(60) NOT NULL,                        
    amount INT NOT NULL,                               
    size VARCHAR(10) NOT NULL,                         
    price DECIMAL(8,2) NOT NULL,                      
    active BIT NOT NULL                                
);

CREATE TABLE sale (
    id INT PRIMARY KEY IDENTITY(1,1),                
    date_time DATETIME NOT NULL,                       
    seller_id INT,                                     
    client_id INT,                                     
    active BIT NOT NULL,                               
    CONSTRAINT FK_sale_seller FOREIGN KEY (seller_id) REFERENCES seller(id),
    CONSTRAINT FK_sale_client FOREIGN KEY (client_id) REFERENCES client(id)
);


CREATE TABLE sale_detail (
    id INT PRIMARY KEY IDENTITY(1,1),                 
    sale_id INT,                                      
    clothes_id INT,                                   
    amount INT NOT NULL,                               
    CONSTRAINT FK_sale_detail_sale FOREIGN KEY (sale_id) REFERENCES sale(id),
    CONSTRAINT FK_sale_detail_clothes FOREIGN KEY (clothes_id) REFERENCES clothes(id)
);

SELECT * FROM sys.tables;


ALTER TABLE sale
        ADD CONSTRAINT sale_client FOREIGN KEY (client_id)
        REFERENCES client(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
GO


SELECT 
   fk.name[Constraint],
   OBJECT_NAME(fk.parent_object_id) [tabla],
   COL_NAME(fc.parent_object_id, fc.referenced_column_id) AS [Tabla base],
   OBJECT_NAME (fk.referenced_object_id) AS [Columna PK]
FROM
    sys.foreign_keys fk
    INNER JOIN sys.foreign_key_columns fc ON (fk.object_id = fc.constraint_object_id)
GO


ALTER TABLE sale 
        DROP CONSTRAINT sale_client
GO


SELECT
    fk.name [Constraint],
    OBJECT_NAME(fk.parent_object_id) [Tabla],
    COL_NAME(fc.parent_object_id, fc.parent_column_id) [Columna FK],
    OBJECT_NAME (fk.referenced_object_id, fc.referenced_column_id) AS [Columna PK]
FROM
    sys.foreign_keys fk
    INNER JOIN sys.foreign_key_columns fc ON (fk.OBJECT_ID = fc.constraint_object_id)
GO




ALTER TABLE sale
ADD CONSTRAINT sale_client FOREIGN KEY (client_id) REFERENCES client(id);

ALTER TABLE sale
ADD CONSTRAINT sale_seller FOREIGN KEY (seller_id) REFERENCES seller(id);

ALTER TABLE sale_detail
ADD CONSTRAINT sale_detail_sale FOREIGN KEY (sale_id) REFERENCES sale(id);

ALTER TABLE sale_detail
ADD CONSTRAINT sale_detail_clothes FOREIGN KEY (clothes_id) REFERENCES clothes(id);

