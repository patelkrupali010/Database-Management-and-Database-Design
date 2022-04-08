SET SERVEROUT ON;
------------------------------------------------USER UPDATE INSERT----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UPDATE_USER_TABLE(user_id in NUMBER, column_name in VARCHAR2, column_val in VARCHAR2)
AS
col_name VARCHAR2(50):=column_name;
col_val VARCHAR2(100):=column_val;
update_query VARCHAR2(500);
BEGIN

        update_query := 'UPDATE USERS set '|| col_name || '=''' || col_val ||  ''' where USER_ID=' || user_id; 
        DBMS_OUTPUT.PUT_LINE(update_query);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        EXECUTE IMMEDIATE  'UPDATE USERS set '|| col_name || '=''' || col_val ||  ''' where  USER_ID=' || user_id; 
COMMIT;
EXCEPTION WHEN others then
dbms_output.put_line('Error while inserting data into USERS Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end;
/

execute UPDATE_USER_TABLE(704, 'FIRST_NAME', 'KRUPALI');
execute UPDATE_USER_TABLE(704, 'CONTACT_NO', 9989757874);
execute UPDATE_USER_TABLE(704, 'EMAIL', 'KRUPALIPATEL010@GMAIL.COM');


SET SERVEROUT ON;
------------------------------------------------VACCINE_STORAGE UPDATE-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UPDATE_VACCINE_STORAGE_TABLE(VACCINE_STORAGE_FACILITY_ID in NUMBER, column_name in VARCHAR2, column_val in VARCHAR2)
AS
col_name VARCHAR2(15):=column_name;
col_val VARCHAR2(100):=column_val;
update_query VARCHAR2(500);
BEGIN
  

        update_query := 'UPDATE VACCINE_STORAGE set '|| col_name || '=''' || col_val ||  ''' where   VACCINE_STORAGE_FACILITY_ID=' || VACCINE_STORAGE_FACILITY_ID; 
        DBMS_OUTPUT.PUT_LINE(update_query);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        EXECUTE IMMEDIATE  'UPDATE VACCINE_STORAGE set '|| col_name || '=''' || col_val ||  ''' where  VACCINE_STORAGE_FACILITY_ID=' || VACCINE_STORAGE_FACILITY_ID; 
COMMIT;
EXCEPTION WHEN others then
dbms_output.put_line('Error while inserting data into VACCINE_STORAGE Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end;
/

execute UPDATE_VACCINE_STORAGE_TABLE(801, 'STREET', 'Tremont st');


SET SERVEROUT ON;
------------------------------------------------VACCINE_CENTER UPDATE-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UPDATE_VACCINE_CENTER_TABLE(VACCINE_CENTER_ID in NUMBER, column_name in VARCHAR2, column_val in VARCHAR2)
AS
col_name VARCHAR2(30):=column_name;
col_val VARCHAR2(100):=column_val;
update_query VARCHAR2(500);
BEGIN
  

        update_query := 'UPDATE VACCINE_CENTER set '|| col_name || '=''' || col_val ||  ''' where VACCINE_CENTER_ID=' || VACCINE_CENTER_ID; 
        DBMS_OUTPUT.PUT_LINE(update_query);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        EXECUTE IMMEDIATE  'UPDATE VACCINE_CENTER set '|| col_name || '=''' || col_val ||  ''' where  VACCINE_CENTER_ID=' || VACCINE_CENTER_ID; 
COMMIT;
EXCEPTION WHEN others then
dbms_output.put_line('Error while inserting data into VACCINE_CENTER Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end;
/

execute UPDATE_VACCINE_CENTER_TABLE(1001, 'VACCINE_CENTER_STREET', 'Blv St');

SET SERVEROUT ON;
------------------------------------------------UNIVERSITY UPDATE-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UPDATE_UNIVERSITY_TABLE(UNIVERSITY_ID in NUMBER, column_name in VARCHAR2, column_val in VARCHAR2)
AS
col_name VARCHAR2(25):=column_name;
col_val VARCHAR2(100):=column_val;
update_query VARCHAR2(500);
BEGIN
  
        update_query := 'UPDATE UNIVERSITY set '|| col_name || '=''' || col_val ||  ''' where UNIVERSITY_ID=' || UNIVERSITY_ID; 
        DBMS_OUTPUT.PUT_LINE(update_query);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
        EXECUTE IMMEDIATE  'UPDATE UNIVERSITY set '|| col_name || '=''' || col_val ||  ''' where UNIVERSITY_ID=' || UNIVERSITY_ID; 
COMMIT;
EXCEPTION WHEN others then
dbms_output.put_line('Error while inserting data into UNIVERSITY Table');
rollback;
dbms_output.put_line('Error: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end;
/

execute UPDATE_UNIVERSITY_TABLE(1, 'UNIVERSITY_ZIP_CODE', 02121);

