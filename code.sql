
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



