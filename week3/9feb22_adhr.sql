AGENDA
1. CREATE SYNONYM
2. CREATE SEQUENCE
==============================================================================
--######################################################
--Oracle synonyms
--create aliases for schema objects such as tables, views, 
--materialized views, sequences, procedures, and stored function.
--######################################################
select * from c##erpuser.colors;
select * from c##aduser.color;

CREATE PUBLIC SYNONYM colors for c##erpuser.colors;
SELECT * FROM COLORS;

--######################################################
--    CREATE [OR REPLACE] [PUBLIC] SYNONYM schema.synonym_name
--    FOR schema.object;
--    CREATE PUBLIC SYNONYM colors 
--    FOR c##erpuser.colors;

--######################################################
CREATE TABLE DEMO(
ID NUMBER GENERATED AS IDENTITY,
DATA VARCHAR2(10)
);

INSERT INTO DEMO (DATA) VALUES ('RECORD1');
INSERT INTO DEMO (DATA) VALUES ('RECORD2');
INSERT INTO DEMO (DATA) VALUES ('RECORD3');
INSERT INTO DEMO (DATA) VALUES ('RECORD4');
INSERT INTO DEMO (DATA) VALUES ('RECORD5');
COMMIT;
SELECT  * FROM DEMO;

CREATE SYNONYM SYN_DEMO FOR C##ADUSER.DEMO;

SELECT * FROM SYN_DEMO;

SELECT * FROM c##aduser.syn_demo;
SELECT * FROM c##erpuser.syn_demo;


--#################################################################
--DROP SYNONYM schema.synonym_name FORCE;
--#################################################################
DROP SYNONYM SYN_DEMO FORCE;
--#################################################################
--generating identity  values based on
-- increment by 1 or 10 or 100...
-- min 1
-- max 9999999999999999999999999999
--CREATE SEQUENCE <<seqname>> 
--INCREMENT BY 1 
--MAXVALUE 9999999999999999999999999999 
--MINVALUE 1 
--CACHE 20

--#################################################################
CREATE SEQUENCE productid
INCREMENT BY 1
MAXVALUE 1000
MINVALUE 1
CACHE 20;

CREATE TABLE PRODUCT(
pid number primary key,
pname varchar(50) not null
)

insert into product values(productid.nextval,'pepsi 500ml');  
insert into product values(productid.nextval,'pepsi 500ml');
insert into product values(productid.nextval,'pepsi 500ml');
insert into product values(productid.nextval,'pepsi 500ml');
insert into product values(productid.nextval,'pepsi 500ml');

select * from product;

--######################################################
--alter sequence
--######################################################
ALTER SEQUENCE PRODUCTID MAXVALUE 10000;
--######################################################
-- DROP SEQUENCE
--######################################################
DROP SEQUENCE PRODUCTID;









