select DISTINCT pv.visit_date as missing_date
from person_visits pv
left join (SELECT DISTINCT spv.visit_date, spv.person_id  FROM person_visits spv WHERE spv.person_id = 1 OR spv.person_id = 2) fpv on fpv.visit_date = pv.visit_date 
where fpv.visit_date is null
ORDER BY missing_date