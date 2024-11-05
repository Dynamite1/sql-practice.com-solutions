Q17.Show all columns for patient_id 542's most recent admission_date.
		SELECT *
	FROM admissions
	GROUP BY patient_id
	HAVING
	  patient_id = 542
	  AND max(admission_date)
	
Q16. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

		SELECT
		  DAY(admission_date) AS day_number,
		  COUNT(*) AS number_of_admissions
		FROM admissions
		GROUP BY day_number
		ORDER BY number_of_admissions DESC

Q15.Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

		SELECT
		  (MAX(weight) - MIN(weight)) AS weight_delta
		FROM patients
		WHERE last_name = 'Maroni';


Q14.Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

		SELECT
		  province_id,
		  SUM(height) AS sum_height
		FROM patients
		GROUP BY province_id
		HAVING sum_height >= 7000
	
	
Q13.We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane

	SELECT
  CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS new_name_format
FROM patients
ORDER BY first_name DESC;
	
	
	
	
Q12. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
	
	SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;




Q11. Show all allergies ordered by popularity. Remove NULL values from query.
				SELECT
			  allergies,
			  COUNT(*) AS total_diagnosis
			FROM patients
			WHERE
			  allergies IS NOT NULL
			GROUP BY allergies
			ORDER BY total_diagnosis DESC


Q10, Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor"

		SELECT first_name, last_name, 'Patient' as role FROM patients
	    union all
	select first_name, last_name, 'Doctor' from doctors;


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



