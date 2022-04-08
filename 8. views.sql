-- vaccine count based on vaccine brands

create or replace view vaccine_manufacturer_shot_count 
as 
select vaccine_brand, count(*) as number_of_doses_given
from immunization_details
group by vaccine_brand
order by number_of_doses_given desc;

select * from vaccine_manufacturer_shot_count;


-- user vaccination status

create or replace view user_vaccination_status
as
select u.first_name || ' ' || u.last_name name, u.university_id, (CASE WHEN COUNT(im.vaccination_status) = 2 THEN 'Fully Vaccinated' ELSE (CASE WHEN COUNT(im.vaccination_status) = 1 THEN 'Partially Vaccinated' ELSE 'Unvaccinated' END) END) AS Vaccination_Status
FROM immunization_details im
full join users u on im.user_id = u.user_id
group by u.user_id, u.first_name, u.last_name, u.university_id
ORDER BY vaccination_status;

select * from user_vaccination_status;


-- vaccination status count
create or replace view vaccination_status_count
as 
select us.vaccination_status, count(*) as num_people
from user_vaccination_status us
group by us.vaccination_status;

select * from vaccination_status_count;


-- user medical hsitory
create or replace view user_expanded_medical_record_view
as
select med.user_id, u.first_name || ' ' || u.last_name name, u.date_of_birth, u.gender, u.university_id, med.respiratory_distress, med.allergy, med.high_blood_pressure, med.fever, med.date_of_appointment, med.comments
from user_medical_record med
left join users u on med.user_id = u.user_id
ORDER BY med.date_of_appointment;

SELECT * FROM user_expanded_medical_record_view;

