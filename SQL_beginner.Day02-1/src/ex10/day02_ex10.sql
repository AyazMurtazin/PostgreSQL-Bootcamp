SELECT spr.name AS person_name1,
	fpr.name AS person_name2,
	fpr.address AS common_address
FROM person fpr 
CROSS JOIN person spr
WHERE fpr.address = spr.address
	AND fpr < spr 
ORDER BY person_name1, person_name2, common_address