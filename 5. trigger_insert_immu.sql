SET SERVEROUT ON;

create or replace trigger get_vaccinated
after insert on appointment
REFERENCING
            NEW AS new
            OLD AS old
for each row
declare
    eligibilty_flag VARCHAR2(15);
begin 
-- check medical history comment 


select COMMENTS into eligibilty_flag from user_medical_record where user_id=:new.user_id  and trunc(date_of_appointment)=:new.DATE_OF_APPOINTMENT;
if eligibilty_flag = 'Eligible' then
INSERT INTO IMMUNIZATION_DETAILS
(VACCINE_BRAND, DOSE_DATE, VACCINATION_STATUS, USER_ID)
VALUES
(
:new.VACCINE_MNF_NAME,
:new.DATE_OF_APPOINTMENT,
'completed',
:new.USER_ID
);

--UPDATE appointment
--SET
--    APPOINTMENT_STATUS = 'completed'
--WHERE
--    user_id = uid and DATE_OF_APPOINTMENT=:new.DATE_OF_APPOINTMENT;

        dbms_output.put_line('Appointment has been cancelled.');
dbms_output.put_line('============================================= USER has been VACCINATED successfully!!  ======================================' ||uid);


else
--        UPDATE appointment
--        SET
--            APPOINTMENT_STATUS = 'cancelled'
--        WHERE
--            user_id = uid and DATE_OF_APPOINTMENT=:new.DATE_OF_APPOINTMENT;
        
                dbms_output.put_line('User vaccination cannot be done at the moment');
end if;
end;
/





