CREATE INDEX immunization_vaccine_brand_idx ON IMMUNIZATION_DETAILS (VACCINE_BRAND);

CREATE INDEX immunization_vaccination_status_idx ON IMMUNIZATION_DETAILS (vaccination_status);

CREATE INDEX users_name_idx ON USERS (last_name, first_name); 
