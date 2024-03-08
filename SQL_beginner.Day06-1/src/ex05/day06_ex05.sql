COMMENT ON TABLE person_discounts
IS 'This is a person_discounts table which contains info about discounts between persons and pizzerias';
COMMENT ON COLUMN person_discounts.id
IS 'Unique discounts identifier';
COMMENT ON COLUMN person_discounts.person_id
IS 'Unique person identifier from person_order';
COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'Unique pizzeria identifier from person_order';
COMMENT ON COLUMN person_discounts.discount
IS 'discount persent from 0 to 100 for person in pizzeria which depends from order count';