Q9.Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.

	SELECT
  city,
  COUNT(*) AS num_patients
FROM patients
GROUP BY city
ORDER BY num_patients DESC, city asc; 

Q8. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.			
				SELECT
			  patient_id,
			  diagnosis
			FROM admissions
			GROUP BY
			  patient_id,
			  diagnosis
			HAVING COUNT(*) > 1;		



Q7. Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
	
			SELECT
		  first_name,
		  last_name,
		  allergies
		FROM patients
		WHERE
		  allergies IN ('Penicillin', 'Morphine')
		ORDER BY
		  allergies,
		  first_name,
		  last_name;


Q6.Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.

			SELECT 
		  SUM(Gender = 'M') as male_count, 
		  SUM(Gender = 'F') AS female_count
		FROM patients
	
		select 
		  sum(case when gender = 'M' then 1 end) as male_count,
		  sum(case when gender = 'F' then 1 end) as female_count 
		from patients;

Q5. Display every patient's first_name.
Order the list by the length of each name and then by alphabetically.
	SELECT first_name FROM patients
order by len(first_name ), first_name 


Q4. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table.

  SELECT p.patient_id,p.first_name, p.last_name
FROM patients p 
	join admissions a
on p.patient_id=a.patient_id
where diagnosis ="Dementia"
  
Q3. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
  
  SELECT patient_id, first_name FROM patients
where first_name like 's%s'and len(first_name)>=6
  
    
Q2. Show unique first names from the patients table which only occurs once in the list.
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
                        
                         SELECT first_name
                        FROM patients
                        GROUP BY first_name
                        HAVING COUNT(first_name) = 1



01. Q-Show unique birth years from patients and order them by ascending.
  
              SELECT
              	distinct(year (birth_date)) as Birth_Year 
              FROM patients
              order by Birth_Year asc	



