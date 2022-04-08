SET SERVEROUT ON;

CREATE OR REPLACE PACKAGE INSERT_TABLES
AS
PROCEDURE INSERT_VACCINE_STORAGE(Vaccine_Storage_Name in VARCHAR, Street in VARCHAR, City in VARCHAR, State in VARCHAR, Zipcode in NUMBER);

PROCEDURE INSERT_VACCINE_DETAILS(Vaccine_Mnf in VARCHAR, Mnf_Date in DATE, Exp_Date in DATE, Batch_No in Number, Vaccine_Storage_Facility_Id in Number);

PROCEDURE INSERT_VACCINE_CENTER(Vaccine_Center_Name in VARCHAR, Vaccine_Center_Street in VARCHAR, Vaccine_Center_City in VARCHAR, Vaccine_Center_State in VARCHAR, Vaccine_Center_Zipcode in NUMBER);

PROCEDURE INSERT_INVENTORY(Vaccine_Center_Id in Number, Vaccine_Id in Number);

PROCEDURE INSERT_VACCINE_REQUEST(Request_Date in DATE, Vaccine_Request_Mnf_Name in VARCHAR, Vaccine_Storage_Facility_Id in NUMBER, Inventory_Id in Number);

PROCEDURE INSERT_UNIVERSITY(University_Name in VARCHAR, University_Street in VARCHAR, University_City in VARCHAR, University_State in VARCHAR, University_Zip_Code in NUMBER, Vaccine_Center_Id in number);

PROCEDURE INSERT_STAFF(First_Name in VARCHAR, Last_Name in VARCHAR, Gender in VARCHAR , Vaccine_Center_Id in number);

PROCEDURE INSERT_USERS(First_Name in VARCHAR, Last_Name in VARCHAR, Date_of_Birth in DATE, Gender in VARCHAR, Contact_No in VARCHAR, Email in VARCHAR, University_Id in NUMBER);

PROCEDURE INSERT_IMMUNIZATION_DETAILS(Vaccine_Brand in VARCHAR, Dose_date in DATE, Vaccination_Status in VARCHAR, User_Id in NUMBER);

PROCEDURE INSERT_APPOINTMENT(Date_of_Appointment in DATE, Appointment_Status in VARCHAR, User_Id in NUMBER,  Vaccine_mnf_name  in VARCHAR);

PROCEDURE INSERT_USER_MEDICAL_RECORD(User_Id in NUMBER, Respiratory_distress in NUMBER, Allergy in NUMBER, High_blood_pressure in NUMBER, Fever in NUMBER, Date_of_Appointment in DATE);

PROCEDURE INSERT_VACCINE_SHIPMENT(Shipment_start_date in DATE, Shipment_end_date DATE, Shipment_status in VARCHAR, Vaccine_Storage_Facility_Id in NUMBER, Inventory_Id  in NUMBER);

PROCEDURE INSERT_VACCINE_BATCH_INFORMATION(Shipment_Id in NUMBER, Vaccine_Manufacturer_Name in VARCHAR);
end INSERT_TABLES;
/

------------------------------------------------VACCINE_STORAGE INSERT----------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY INSERT_TABLES
AS
PROCEDURE INSERT_VACCINE_STORAGE(Vaccine_Storage_Name in VARCHAR, Street in VARCHAR, City in VARCHAR, State in VARCHAR, Zipcode in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO VACCINE_STORAGE(Vaccine_Storage_Name, Street, City, State, Zipcode) VALUES (Vaccine_Storage_Name, Street, City, State, Zipcode); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in VACCINE_STORAGE Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into VACCINE_STORAGE Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_VACCINE_STORAGE;


------------------------------------------------VACCINE_DETAILS INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_VACCINE_DETAILS(Vaccine_Mnf in VARCHAR, Mnf_Date in DATE, Exp_Date in DATE, Batch_No in Number, Vaccine_Storage_Facility_Id in Number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO VACCINE_DETAILS(Vaccine_Mnf, Mnf_Date, Exp_Date, Batch_No, Vaccine_Storage_Facility_Id) VALUES (Vaccine_Mnf, Mnf_Date, Exp_Date, Batch_No, Vaccine_Storage_Facility_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in VACCINE_DETAILS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into VACCINE_DETAILS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_VACCINE_DETAILS;


------------------------------------------------VACCINE_CENTER INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_VACCINE_CENTER(Vaccine_Center_Name in VARCHAR, Vaccine_Center_Street in VARCHAR, Vaccine_Center_City in VARCHAR, Vaccine_Center_State in VARCHAR, Vaccine_Center_Zipcode in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO VACCINE_CENTER(Vaccine_Center_Name, Vaccine_Center_Street, Vaccine_Center_City, Vaccine_Center_State, Vaccine_Center_Zipcode) VALUES (Vaccine_Center_Name, Vaccine_Center_Street, Vaccine_Center_City, Vaccine_Center_State, Vaccine_Center_Zipcode); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in VACCINE_CENTER Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into VACCINE_CENTER Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_VACCINE_CENTER;



------------------------------------------------INVENTORY INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_INVENTORY(Vaccine_Center_Id in Number, Vaccine_Id in Number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO INVENTORY(Vaccine_Center_Id, Vaccine_Id) VALUES (Vaccine_Center_Id, Vaccine_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in INVENTORY Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into INVENTORY Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_INVENTORY;



------------------------------------------------VACCINE_REQUEST INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_VACCINE_REQUEST(Request_Date in DATE, Vaccine_Request_Mnf_Name in VARCHAR, Vaccine_Storage_Facility_Id in NUMBER, Inventory_Id in Number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO VACCINE_REQUEST(Request_Date, Vaccine_Request_Mnf_Name, Vaccine_Storage_Facility_Id, Inventory_Id ) VALUES (Request_Date, Vaccine_Request_Mnf_Name, Vaccine_Storage_Facility_Id, Inventory_Id ); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in VACCINE_REQUEST( Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into VACCINE_REQUEST Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_VACCINE_REQUEST;


------------------------------------------------UNIVERSITY INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_UNIVERSITY(University_Name in VARCHAR, University_Street in VARCHAR, University_City in VARCHAR, University_State in VARCHAR, University_Zip_Code in NUMBER, Vaccine_Center_Id in number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO UNIVERSITY(University_Name, University_Street,  University_City, University_State, University_Zip_Code, Vaccine_Center_Id) VALUES (University_Name, University_Street,  University_City, University_State, University_Zip_Code, Vaccine_Center_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in UNIVERSITY Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into UNIVERSITY Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_UNIVERSITY;

------------------------------------------------STAFF INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_STAFF(First_Name in VARCHAR, Last_Name in VARCHAR, Gender in VARCHAR , Vaccine_Center_Id in number)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO STAFF(First_Name, Last_Name, Gender, Vaccine_Center_Id) VALUES (First_Name, Last_Name, Gender, Vaccine_Center_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in STAFF Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into STAFF Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_STAFF;


------------------------------------------------USERS INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_USERS(First_Name in VARCHAR, Last_Name in VARCHAR, Date_of_Birth in DATE, Gender in VARCHAR, Contact_No in VARCHAR, Email in VARCHAR, University_Id in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO USERS(First_Name, Last_Name, Date_of_Birth, Gender, Contact_No, Email, University_Id) VALUES (First_Name, Last_Name, Date_of_Birth, Gender, Contact_No, Email, University_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in USERS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into USERS( Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_USERS;


------------------------------------------------IMMUNIZATION_DETAILS INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_IMMUNIZATION_DETAILS(Vaccine_Brand in VARCHAR, Dose_date in DATE, Vaccination_Status in VARCHAR, User_Id in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO IMMUNIZATION_DETAILS(Vaccine_Brand, Dose_date, Vaccination_Status, User_Id) VALUES (Vaccine_Brand, Dose_date, Vaccination_Status, User_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in IMMUNIZATION_DETAILS Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into IMMUNIZATION_DETAILS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_IMMUNIZATION_DETAILS;




------------------------------------------------APPOINTMENT INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_APPOINTMENT(Date_of_Appointment in DATE, Appointment_Status in VARCHAR, User_Id in NUMBER, Vaccine_mnf_name  in VARCHAR)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO APPOINTMENT(Date_of_Appointment, Appointment_Status, User_Id, Vaccine_mnf_name) VALUES (Date_of_Appointment, Appointment_Status, User_Id, Vaccine_mnf_name); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in APPOINTMENT Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into APPOINTMENT Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_APPOINTMENT;


------------------------------------------------USER_MEDICAL_RECORD INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_USER_MEDICAL_RECORD(User_Id in NUMBER, Respiratory_distress in NUMBER, Allergy in NUMBER, High_blood_pressure in NUMBER, Fever in NUMBER, Date_of_Appointment in DATE)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO USER_MEDICAL_RECORD(User_Id, Respiratory_distress, Allergy, High_blood_pressure, Fever, Date_of_Appointment) VALUES (User_Id, Respiratory_distress, Allergy, High_blood_pressure, Fever, Date_of_Appointment); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in USER_MEDICAL_RECORD Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into USER_MEDICAL_RECORD Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_USER_MEDICAL_RECORD;



------------------------------------------------VACCINE_SHIPMENT INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_VACCINE_SHIPMENT(Shipment_start_date in DATE,Shipment_end_date DATE,  Shipment_status in VARCHAR, Vaccine_Storage_Facility_Id in NUMBER, Inventory_Id  in NUMBER)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO VACCINE_SHIPMENT(Shipment_start_date, Shipment_end_date, Shipment_status, Vaccine_Storage_Facility_Id, Inventory_Id) VALUES (Shipment_start_date, Shipment_end_date, Shipment_status, Vaccine_Storage_Facility_Id, Inventory_Id); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in VACCINE_SHIPMENT Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into VACCINE_SHIPMENT Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_VACCINE_SHIPMENT;


------------------------------------------------VACCINE_BATCH_INFORMATION INSERT----------------------------------------------------------------------------

PROCEDURE INSERT_VACCINE_BATCH_INFORMATION( Shipment_Id in NUMBER, Vaccine_Manufacturer_Name in VARCHAR)
AS
BEGIN
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        INSERT INTO VACCINE_BATCH_INFORMATION( Shipment_Id, Vaccine_Manufacturer_Name) VALUES ( Shipment_Id, Vaccine_Manufacturer_Name); 
        DBMS_OUTPUT.PUT_LINE('Rows inserted in VACCINE_BATCH_INFORMATION Table');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
COMMIT;
EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into VACCINE_BATCH_INFORMATION Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_VACCINE_BATCH_INFORMATION;

End;






