INSERT INTO Species (name) VALUES ('Human');
INSERT INTO Species (name) VALUES ('Dog');
INSERT INTO Species (name) VALUES ('Cat');
INSERT INTO Species (name) VALUES ('Bird');
INSERT INTO Species (name) VALUES ('Fish');
INSERT INTO Species (name) VALUES ('Raptor');

INSERT INTO Animals (species, smartness) VALUES (1, 10);
INSERT INTO Animals (species, smartness) VALUES (2, 5);
INSERT INTO Animals (species, smartness) VALUES (3, 3);
INSERT INTO Animals (species, smartness) VALUES (4, 1);
INSERT INTO Animals (species, smartness) VALUES (5, 1);
INSERT INTO Animals (species, smartness) VALUES (6, 10);

INSERT INTO Humans (name, animal_id) VALUES ('John', 1);
INSERT INTO Humans (name, animal_id) VALUES ('Jane', 2);

INSERT INTO Actions (name, description) VALUES ('Eat', 'Eat food');
INSERT INTO Actions (name, description) VALUES ('Sleep', 'Sleep');
INSERT INTO Actions (name, description) VALUES ('Play', 'Play with toys');
INSERT INTO Actions (name, description) VALUES ('Bark', 'Bark');
INSERT INTO Actions (name, description) VALUES ('Meow', 'Meow');
INSERT INTO Actions (name, description) VALUES ('Tweet', 'Tweet');
INSERT INTO Actions (name, description) VALUES ('Swim', 'Swim');
INSERT INTO Actions (name, description) VALUES ('Fly', 'Fly');
INSERT INTO Actions (name, description) VALUES ('Hunt', 'Hunt');

INSERT INTO Plans (start_time, end_time) VALUES ('2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO Plans (start_time) VALUES ('2018-01-01 00:00:00');

INSERT INTO PlanToActions (plan_id, action_id) VALUES (1, 1);
INSERT INTO PlanToActions (plan_id, action_id) VALUES (1, 2);
INSERT INTO PlanToActions (plan_id, action_id) VALUES (1, 3);
INSERT INTO PlanToActions (plan_id, action_id) VALUES (2, 4);

INSERT INTO PlansToAnimals (plan_id, animal_id) VALUES (1, 1);
INSERT INTO PlansToAnimals (plan_id, animal_id) VALUES (1, 2);
