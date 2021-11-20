-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-20 07:35:22.744

-- tables
-- Table: Customer_Table
CREATE TABLE Customer_Table (
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    Address varchar(50) NOT NULL,
    City varchar(20) NOT NULL,
    State varchar(20) NOT NULL,
    Zipcode varchar(10) NOT NULL,
    Email varchar(30) NOT NULL,
    Phonenumber int NOT NULL,
    customerID varchar(7) NOT NULL,
    CONSTRAINT Customer_Table_pk PRIMARY KEY (customerID)
);

-- Table: ProductDataTable
CREATE TABLE ProductDataTable (
    ProductName varchar(30) NOT NULL,
    ProductTypeCategeory varchar(20) NOT NULL,
    ProductOrigion varchar(30) NOT NULL,
    ProductPrice decimal(10,2) NOT NULL,
    ProductID varchar(5) NOT NULL,
    CONSTRAINT ProductDataTable_pk PRIMARY KEY (ProductID)
);

-- Table: SalesDetails
CREATE TABLE SalesDetails (
    ProductPrice decimal(10,3) NOT NULL,
    Quantity int NOT NULL,
    SalesID varchar(7) NOT NULL,
    ProductID varchar(5) NOT NULL,
    ProductDataTable_ProductID varchar(5) NOT NULL,
    CONSTRAINT SalesDetails_pk PRIMARY KEY (SalesID)
);

-- Table: SalesTable
CREATE TABLE SalesTable (
    DateofSale date NOT NULL,
    SaleID varchar(5) NOT NULL,
    CustomerID varchar(5) NOT NULL,
    Customer_Table_customerID varchar(7) NOT NULL,
    SalesDetails_SalesID varchar(7) NOT NULL,
    CONSTRAINT SalesTable_pk PRIMARY KEY (SaleID)
);

-- foreign keys
-- Reference: SalesDetails_ProductDataTable (table: SalesDetails)
ALTER TABLE SalesDetails ADD CONSTRAINT SalesDetails_ProductDataTable FOREIGN KEY SalesDetails_ProductDataTable (ProductDataTable_ProductID)
    REFERENCES ProductDataTable (ProductID);

-- Reference: SlaesTable_Customer_Table (table: SalesTable)
ALTER TABLE SalesTable ADD CONSTRAINT SlaesTable_Customer_Table FOREIGN KEY SlaesTable_Customer_Table (Customer_Table_customerID)
    REFERENCES Customer_Table (customerID);

-- Reference: SlaesTable_SalesDetails (table: SalesTable)
ALTER TABLE SalesTable ADD CONSTRAINT SlaesTable_SalesDetails FOREIGN KEY SlaesTable_SalesDetails (SalesDetails_SalesID)
    REFERENCES SalesDetails (SalesID);

-- End of file.

