SET SERVEROUT ON;

create or replace PROCEDURE book_apt(email_id in VARCHAR2, apt_date in date, vac_mnf_name in VARCHAR2)
AS
  uid NUMBER;
  count_users NUMBER;
  cnt NUMBER;
  status varchar(10);
  prev_status VARCHAR(20);
    date_diff NUMBER;
    vac_name varchar(20);
BEGIN
      dbms_output.put_line('======================================');
--        dbms_output.put_line('SELECT distinct user_id into uid from users where email = '||email_id);

  SELECT distinct user_id into uid from users where email = email_id;
--        dbms_output.put_line('============================================= USER ID ======================================' ||uid);


      SELECT count(*) into count_users from IMMUNIZATION_DETAILS where user_id = uid;
--        dbms_output.put_line('============================================= USER COUNT ======================================' ||count_users);
     
     
 if count_users=0 then insert into APPOINTMENT(DATE_OF_APPOINTMENT,APPOINTMENT_STATUS,USER_ID,VACCINE_MNF_NAME) values(apt_date, LOWER('booked'),uid, lower(vac_mnf_name));
  dbms_output.put_line('++++++++++++++++++++++      first appointment booked                ++++++++++++++++++');




ELSIF count_users=1
then
            SELECT ( TO_DATE(apt_date) - TO_DATE(DOSE_DATE) ) INTO date_diff
            FROM   IMMUNIZATION_DETAILS
            where USER_ID=uid;
            
            select distinct VACCINE_BRAND into vac_name from IMMUNIZATION_DETAILS where user_id = uid;

--            dbms_output.put_line('============================================= date_diff ======================================' ||date_diff);
            if(date_diff >= 15 and lower(vac_name)=lower(vac_mnf_name))
            then
            insert into APPOINTMENT(DATE_OF_APPOINTMENT,APPOINTMENT_STATUS,USER_ID,VACCINE_MNF_NAME) values(apt_date, LOWER('booked'),uid, lower(vac_mnf_name));
      dbms_output.put_line('++++++++++++++++++++++      second appointment booked                ++++++++++++++++++');
            else
            dbms_output.put_line('Difference between dose 1 and 2 is less than 14 days or vaccine provider is different.');
            end if;
            

ELSIF count_users>=2 
then 
dbms_output.put_line('User already fully vaccinated.');
end if;
COMMIT;
EXCEPTION WHEN OTHERS
THEN
       dbms_output.put_line(SQLERRM);
       ROLLBACK;
END;
/



exec book_apt('john.k@gmail.com','01-JAN-21', 'JJ');
exec book_apt('john.k@gmail.com','02-JAN-21', 'JJ');
exec book_apt('john.k@gmail.com','16-JAN-21', 'JJ');


exec book_apt('d.j@gmail.com','07-FEB-21', 'Moderna');
exec book_apt('d.j@gmail.com','07-FEB-21', 'Pfizer');
exec book_apt('d.j@gmail.com','27-FEB-21', 'Moderna');
exec book_apt('d.j@gmail.com','15-MAR-21', 'Moderna');

