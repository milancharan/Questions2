
create table Category(
    CategoryID int PRIMARY KEY,
    CategoryName varchar(25),
    ParentID int,
    FOREIGN KEY (ParentID) REFERENCES Category(CategoryID)
);

INSERT INTO Category VALUES
(1, 'Food', NULL),
(2, 'Electronics', NULL),
(3, 'Bevarages', 1),
(4, 'Breads', 1),
(5, 'BeakedGood', 1),
(6, 'Camera&Photos	', 2),
(7, 'Cars&VehicleElectronics', 2);

create table Brand(
    BrandID int PRIMARY KEY,
    BrandName varchar(25)
);

INSERT INTO Brand VALUES
(1, 'Iceberg'),
(2, 'Mojito'),
(3, 'Britania'),
(4, 'TGB'),
(5, 'Nessale'),
(6, 'Canon')

create table Image(
    ImageID int PRIMARY KEY,
    ImageName varchar(50),
    ImageURL varchar(200)
);

create table Product(
    ProductID int PRIMARY KEY,
    Name varchar(50),
    BrandID int,
    CategoryID int,
    Price int,
    Status varchar(25) DEFAULT 'inStock',
    CHECK(Status IN ('inStock','outofstock')),
    CreatedDate date
);

INSERT INTO Product VALUES
(1, 'BrownBread', 3, 4, 40, 'inStock', STR_TO_DATE('2021-01-02', '%y-%m-%i')),
(2, 'Irish Soda Bread', 3, 4, 50, 'OutOfStock', STR_TO_DATE('2021-02-03', '%y-%m-%i')),
(3, 'Tea(T001)', 5, 3, 50, 'inStock', STR_TO_DATE('	2021-03-03', '%y-%m-%i')),
(4, 'Cofee(T002)', 5, 3, 56, 'inStock', STR_TO_DATE('2021-02-03', '%y-%m-%i')),
(5, 'headphones', NULL, 7, 1000, 'OutOfStock', STR_TO_DATE('2022-01-02', '%y-%m-%i')),
(6, 'Seatbelt', NULL, 7, 2000, 'OutOfStock', STR_TO_DATE('2021-01-02', '%y-%m-%i')),
(7, 'SeatCover', NULL, 7, 3000, 'OutOfStock', STR_TO_DATE('2021-01-02', '%y-%m-%i')),
(8, 'Camera-canon-1	', NULL, 6, 4000, 'inStock', STR_TO_DATE('2022-01-02', '%y-%m-%i'));

create table ProductDetail(
    ProductDetailID int PRIMARY KEY, 
    ProductID int,
    ImageID int,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (ImageID) REFERENCES Image(ImageID),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO ProductDetail VALUES
(1, 1, 'http://www.imagegallery/1'),
(2, 1, 'http://www.imagegallery/2'),
(3, 2, 'http://www.imagegallery/3'),
(4, 3, 'http://www.imagegallery/4'),
(5, 3, 'http://www.imagegallery/5'),



-- create table Category(
--     CategoryID int PRIMARY KEY,
--     CategoryName varchar(25),
--     ParentID int
-- );

-- ALTER TABLE Category
-- ADD CONSTRAINT fk_Category_cID
-- FOREIGN KEY (ParentID)
-- REFERENCES Category(CategoryID);



