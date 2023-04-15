SET @data = '[
    "CategoryID" : {
        "id1": 001,
        "id2": 002,
        "id3": 003
    },
    "BrandName" : {
        "BrandName1": "Hello",
        "BrandName2": "Hello1",
        "BrandName3": "Hello3
    },
    "ProductName" : {
        "pd1": "Welcome",
        "pd2": "Welcome1",
        "pd3": "Welcome2"
    },
    "Price" : {
        "p1": 1899,
        "p2": 1299,
        "p3": 2799,
    },
    "Status" : {
        "st1": "inStock",
        "st2": "inStock",
        "st3": "outOfStock"
    }
]';


create table data1(
    cID int,
    bName varchar(50),
    pname varchar(50),
    price int,
    status varchar(50)
);

create procedure SEARCH_JSON()
BEGIN
insert into data1
select * from JSON_Table(
    @data, '$[*]' COLUMN(
        categoryId varchar(50) PATH '$.cID',
        brandName varchar(50) PATH '$.bName',
        proName varchar(50) PATH '$.pname',
        Price int PATH '$.price' 
    )
) as ITIS
END

CALL `SEARCH_JSON`