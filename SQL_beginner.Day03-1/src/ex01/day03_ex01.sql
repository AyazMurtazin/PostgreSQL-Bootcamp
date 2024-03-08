WITH mnpo AS (SELECT menu_id FROM person_order)
SELECT id as menu_id FROM menu mn LEFT JOIN mnpo ON mnpo.menu_id = mn.id
WHERE mnpo.menu_id IS null
ORDER BY menu_id