SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

-- create table VACCINE_STORAGE if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'VACCINE_STORAGE';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('VACCINE_STORAGE Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
Else
    execute immediate 'CREATE table VACCINE_STORAGE (
    Vaccine_Storage_Facility_Id number  GENERATED ALWAYS as IDENTITY(START with 801 INCREMENT by 1),
    Vaccine_Storage_Name VARCHAR(15) unique not null,
    Street VARCHAR(30) not null,
    City  VARCHAR(10) not null,
    State VARCHAR(25) not null,
    Zipcode NUMBER(10) not null,
    CONSTRAINT VAC_STORAGE_ID_PK PRIMARY KEY(Vaccine_Storage_Facility_Id)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE VACCINE_STORAGE_TEST CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/


SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN
-- create table VACCINE_DETAILS if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'VACCINE_DETAILS';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('VACCINE_DETAILS Table already exists');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
Else
    execute immediate 'CREATE  table VACCINE_DETAILS (
    Vaccine_Id NUMBER GENERATED ALWAYS as IDENTITY(START with 1800 INCREMENT by 1),    
    Vaccine_Mnf VARCHAR(25) CONSTRAINT "VAC_MNF_NAME_NN" NOT NULL ENABLE,
    Mnf_Date DATE CONSTRAINT "VAC_MNF_DATE" NOT NULL ENABLE ,
    Exp_Date DATE CONSTRAINT "VAC_EXP_DATE" NOT NULL ENABLE,
    Batch_No NUMBER CONSTRAINT "VAC_BATCH_NO" NOT NULL ENABLE,
    Vaccine_Storage_Facility_Id NUMBER NOT NULL,
    CONSTRAINT Vaccine_Storage_Id_vd_FK FOREIGN KEY (Vaccine_Storage_Facility_Id) REFERENCES VACCINE_STORAGE(Vaccine_Storage_Facility_Id),
    CONSTRAINT Vaccine_Id_PK PRIMARY KEY(Vaccine_Id)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE VACCINE_DETAILS CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;    
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/

-- create table VACCINE_CENTER if doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'VACCINE_CENTER';
    IF(record_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('VACCINE_CENTER Table already exists');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    Else
        execute immediate 'create table VACCINE_CENTER (
        Vaccine_Center_Id NUMBER GENERATED ALWAYS as IDENTITY(START with 1001 INCREMENT by 1),
        Vaccine_Center_Name VARCHAR2(30)  unique NOT NULL,
        Vaccine_Center_Street VARCHAR2(30) NOT NULL,
        Vaccine_Center_City VARCHAR2(30) NOT NULL,
        Vaccine_Center_State VARCHAR2(30) NOT NULL,
       Vaccine_Center_Zipcode NUMBER NOT NULL,
        CONSTRAINT Vaccine_Center_Id_PK PRIMARY KEY(Vaccine_Center_Id)
        )';
     DBMS_OUTPUT.PUT_LINE('TABLE VACCINE_CENTER CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
    end if;
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/



    -- create table INVENTORY if doesn't exist
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN
    
    SELECT count(*) into record_count FROM user_tables where table_name = 'INVENTORY';


    IF ( record_count > 0 ) THEN
        dbms_output.put_line('INVENTORY table already exists');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    ELSE
        EXECUTE IMMEDIATE 'create table INVENTORY (
        Inventory_Id number GENERATED ALWAYS as IDENTITY(START with 9001 INCREMENT by 1),
        Vaccine_Center_Id number not null,
        Vaccine_Id number not null,
        constraint Vaccine_Id_Inv_fk foreign key (Vaccine_Id) references VACCINE_DETAILS(Vaccine_Id),
        constraint Vaccine_Center_Id_Inv_fk foreign key (Vaccine_Center_Id) references VACCINE_CENTER(Vaccine_Center_Id),
        CONSTRAINT Inventory_Id_PK PRIMARY KEY(Inventory_Id)
        )';
        dbms_output.put_line('TABLE INVENTORY CREATED SUCCESSFULLY');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    END IF; 
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/

-- create table VACCINE_REQUEST doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

SELECT count(*) into record_count FROM user_tables where table_name = 'VACCINE_REQUEST';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('VACCINE_REQUEST Table already exists');
         DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
Else
    execute immediate 'CREATE table VACCINE_REQUEST(
    Vaccine_Request_Id number GENERATED ALWAYS as IDENTITY(START with 901 INCREMENT by 1),
    Request_Date DATE not null,
    Vaccine_Request_Mnf_Name VARCHAR2(20) NOT NULL,
    Vaccine_Storage_Facility_Id number not null,
    CONSTRAINT VR_FK FOREIGN KEY(Vaccine_Storage_Facility_Id) REFERENCES VACCINE_STORAGE(Vaccine_Storage_Facility_Id),
    Inventory_Id number not null,
    CONSTRAINT VR_FK2 FOREIGN KEY(Inventory_Id) REFERENCES INVENTORY(Inventory_Id),
    CONSTRAINT Vaccine_Request_Id_PK PRIMARY KEY(Vaccine_Request_Id)
    )'; 
     DBMS_OUTPUT.PUT_LINE('TABLE VACCINE_REQUEST CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/

-- create table UNIVERSITY if doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'UNIVERSITY';
    IF(record_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('UNIVERSITY Table already exists');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    Else
        execute immediate 'create table UNIVERSITY (
        University_Id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
        University_Name VARCHAR2(25)  unique CONSTRAINT "UNIVERSITY_NAME_NN" NOT NULL ENABLE,
        University_Street VARCHAR2(30)NOT NULL,
        University_City VARCHAR2(30) NOT NULL,
University_State VARCHAR2(30) NOT NULL,
University_Zip_Code NUMBER NOT NULL,
        Vaccine_Center_Id  NUMBER NOT NULL,
        CONSTRAINT Vaccine_Center_Id_FK FOREIGN KEY (Vaccine_Center_Id) REFERENCES VACCINE_CENTER(Vaccine_Center_Id),
        CONSTRAINT University_Id_PK PRIMARY KEY(University_Id)
       
        )';
     DBMS_OUTPUT.PUT_LINE('TABLE UNIVERSITY CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
    end if; 
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/  

-- create table STAFF if doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'STAFF';
    IF(record_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('STAFF Table already exists');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    Else
        execute immediate 'create table STAFF (
        Staff_Id NUMBER GENERATED ALWAYS as IDENTITY(START with 301 INCREMENT by 1),
        First_Name VARCHAR2(20) NOT NULL,
        Last_Name VARCHAR2(20) NOT NULL, 
        Gender VARCHAR2(10) NOT NULL CHECK (Gender IN (''M'', ''F'', ''U'')),        
        Vaccine_Center_Id  NUMBER NOT NULL,
        CONSTRAINT Vaccine_Ctr_Id_FK FOREIGN KEY (Vaccine_Center_Id) REFERENCES VACCINE_CENTER(Vaccine_Center_Id),
    CONSTRAINT Staff_Id_PK PRIMARY KEY(Staff_Id)    

        )';
     DBMS_OUTPUT.PUT_LINE('TABLE STAFF CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
    end if;
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/

-- create table USERS if doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'USERS';
    IF(record_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('USERS Table already exists');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    Else
        execute immediate 'create table USERS (
        User_Id number GENERATED ALWAYS as IDENTITY(START with 701 INCREMENT by 1),
        First_Name varchar2(30) NOT NULL,
        Last_Name varchar2(30) not null,
        Date_of_Birth date not null,
        Gender varchar2(15) not null,
        Contact_No varchar2(20) not null,
        Email varchar2(50)  unique not null,
        University_Id Number Not Null,
        constraint user_fk foreign key(University_Id) references UNIVERSITY(University_Id),
        CONSTRAINT User_Id_PK PRIMARY KEY(User_Id)
        )';
     DBMS_OUTPUT.PUT_LINE('TABLE USERS CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
    end if; 
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/
  
-- create table IMMUNIZATION_DETAILS if doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'IMMUNIZATION_DETAILS';
    IF(record_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('IMMUNIZATION_DETAILS Table already exists');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    Else
        execute immediate 'create table IMMUNIZATION_DETAILS  (
      Immunization_Id number GENERATED ALWAYS as IDENTITY(START with 1301 INCREMENT by 1),
      Vaccine_Brand Varchar2(20) not null,
      Dose_date Date Not null,
      Vaccination_Status Varchar2(30) Not null,
      User_Id number not null,
      constraint User_Id_Immunization_fk foreign key (User_Id) references USERS(User_Id),
      CONSTRAINT Immunization_Id_PK PRIMARY KEY(Immunization_Id)
        )';
     DBMS_OUTPUT.PUT_LINE('TABLE IMMUNIZATION_DETAILS CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
    end if;
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/



-- create table APPOINTMENT if doesn't exists
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'APPOINTMENT';
    IF(record_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('APPOINTMENT Table already exists');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    Else
        execute immediate 'create table APPOINTMENT (
        Appointment_Id number GENERATED ALWAYS as IDENTITY(START with 3001 INCREMENT by 1),
        Date_of_Appointment date not null,
        Appointment_Status varchar(30) not null,
        User_Id number not null,
        Vaccine_mnf_name varchar(20) not null,
        constraint user_id_apt_fk foreign key (User_Id) references USERS(User_Id),
        CONSTRAINT Appointment_Id_PK PRIMARY KEY(Appointment_Id)
        )';
     DBMS_OUTPUT.PUT_LINE('TABLE APPOINTMENT CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
    end if; 
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/


    
-- create table USER_MEDICAL_RECORD if doesn't exist
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN
    
    SELECT count(*) into record_count FROM user_tables where table_name = 'USER_MEDICAL_RECORD';
    IF ( record_count > 0 ) THEN
        dbms_output.put_line('USER_MEDICAL_RECORD table already exists');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    ELSE
        EXECUTE IMMEDIATE 'create table USER_MEDICAL_RECORD (
    User_Id number not null,
    Respiratory_distress number(1,0) not null,
    Allergy number(1,0) not null,
    High_blood_pressure number(1,0) not null,
    Fever number(1,0) not null,
    Date_of_Appointment date not null,
    Comments varchar(50),
    constraint user_id_medical_fk foreign key (User_Id) references USERS(User_Id)
    
    )';
        dbms_output.put_line('TABLE USER_MEDICAL_RECORD CREATED SUCCESSFULLY');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    END IF;    
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/


-- create table VACCINE_SHIPMENT if doesn't exist
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT count(*) into record_count FROM user_tables where table_name = 'VACCINE_SHIPMENT';

    IF ( record_count > 0 ) THEN
        dbms_output.put_line('VACCINE_SHIPMENT table already exists');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    ELSE
        EXECUTE IMMEDIATE 'create table VACCINE_SHIPMENT(
    Shipment_Id number GENERATED ALWAYS as IDENTITY(START with 2701 INCREMENT by 1),
    Shipment_start_date date not null,
    Shipment_end_date date,    
    Shipment_status varchar(30),
    Vaccine_Storage_Facility_Id number not null,
    Inventory_Id number not null,    
    constraint Vaccine_Storage_Facility_Id_shipment_fk foreign key(Vaccine_Storage_Facility_Id) references VACCINE_STORAGE(Vaccine_Storage_Facility_Id),     
    constraint Inventory_Id_vac_shipment_fk foreign key (Inventory_Id) references INVENTORY(Inventory_Id),
    CONSTRAINT Shipment_Id_PK PRIMARY KEY(Shipment_Id)
    )';
        dbms_output.put_line('TABLE VACCINE_SHIPMENT CREATED SUCCESSFULLY');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/


-- create table VACCINE_BATCH_INFORMATION if doesn't exist
SET SERVEROUT ON;

DECLARE
record_count NUMBER;
BEGIN

    SELECT
        COUNT(*)
    INTO record_count
    FROM
        sys.user_tables
    WHERE
        table_name = 'VACCINE_BATCH_INFORMATION';

    IF ( record_count > 0 ) THEN
        dbms_output.put_line('VACCINE_BATCH_INFORMATION table already exists');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    ELSE
        EXECUTE IMMEDIATE 'create table VACCINE_BATCH_INFORMATION (
    Vaccine_Batch_Info_Id number GENERATED ALWAYS as IDENTITY(START with 1200 INCREMENT by 1),
    Shipment_Id number not null,
CONSTRAINT batchid_fk foreign key(Shipment_Id) references VACCINE_SHIPMENT(Shipment_Id),

    Vaccine_Manufacturer_Name varchar(30) not null,
    CONSTRAINT Vaccine_Batch_Info_Id_PK PRIMARY KEY(Vaccine_Batch_Info_Id)
   
    )';
        dbms_output.put_line('TABLE VACCINE_BATCH_INFORMATION CREATED SUCCESSFULLY');
        dbms_output.put_line('-------------------------------------------------------------------------------------------------------------------');
    END IF;    
EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('-------------------------EXCEPTION HANDLING KP---------------------------------');

        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;

end;
/






