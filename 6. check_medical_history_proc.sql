SET SERVEROUT ON;

CREATE OR REPLACE PROCEDURE check_user_medical_record (
    email_id              IN VARCHAR2,
    apt_date  IN DATE
)
AS
    respiratory_distress NUMBER;
    allergy              NUMBER;
    high_blood_pressure  NUMBER;
    fever                NUMBER;
uid NUMBER;
count_users NUMBER;
BEGIN

  SELECT distinct user_id into uid from users where email = email_id;
         dbms_output.put_line('============================================= USER ID ======================================' ||uid);
          dbms_output.put_line('SELECT count(*) into count_users from USER_MEDICAL_RECORD where USER_ID = ' ||uid || ' and DATE_OF_APPOINTMENT=' ||apt_date);
  SELECT count(*) into count_users from USER_MEDICAL_RECORD where USER_ID = uid and trunc(DATE_OF_APPOINTMENT)=apt_date;
        dbms_output.put_line('============================================= USER COUNT ======================================' ||count_users);
        
  SELECT RESPIRATORY_DISTRESS into respiratory_distress from USER_MEDICAL_RECORD where USER_ID = uid and trunc(DATE_OF_APPOINTMENT)=apt_date;
        dbms_output.put_line('============================================= RESPIRATORY_DISTRESS ======================================' ||respiratory_distress);
        
  SELECT ALLERGY into allergy from USER_MEDICAL_RECORD where USER_ID = uid and trunc(DATE_OF_APPOINTMENT)=apt_date;
        dbms_output.put_line('============================================= ALLERGY ======================================' ||allergy);
        
  SELECT HIGH_BLOOD_PRESSURE into high_blood_pressure from USER_MEDICAL_RECORD where USER_ID = uid and trunc(DATE_OF_APPOINTMENT)=apt_date;
        dbms_output.put_line('============================================= HIGH_BLOOD_PRESSURE ======================================' ||high_blood_pressure);
        
  SELECT FEVER into fever from USER_MEDICAL_RECORD where USER_ID = uid and trunc(DATE_OF_APPOINTMENT)=apt_date;
        dbms_output.put_line('============================================= FEVER ======================================' ||fever);        
     
    IF count_users > 0 and respiratory_distress = 0 AND allergy = 0 AND high_blood_pressure = 0 AND fever = 0
    THEN
        UPDATE user_medical_record
        SET
            comments = 'Eligible'
        WHERE
                user_id = uid AND trunc(date_of_appointment) = apt_date;
            dbms_output.put_line('Eligible');
                

    ELSIF count_users > 0 and (respiratory_distress = 1 OR allergy = 1 OR high_blood_pressure = 1 OR fever = 1 ) THEN
        UPDATE user_medical_record
        SET
            comments = 'NOT Eligible'
        WHERE
                user_id = uid AND trunc(date_of_appointment) = apt_date;
            dbms_output.put_line('Not eligible');
            
            
    else dbms_output.put_line('User Medical Record Not present in the table. Please add medical record.');

    END IF;
EXCEPTION WHEN OTHERS
THEN
       dbms_output.put_line(SQLERRM);
       ROLLBACK;    
END;
/

--john
EXEC check_user_medical_record('john.k@gmail.com','01-JAN-21');
EXEC check_user_medical_record('john.k@gmail.com','16-JAN-21');

--deepak
EXEC check_user_medical_record('d.j@gmail.com','27-FEB-21');
EXEC check_user_medical_record('d.j@gmail.com','07-FEB-21');
