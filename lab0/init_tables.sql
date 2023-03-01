CREATE TABLE IF NOT EXISTS Species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS Animals (
    id SERIAL PRIMARY KEY,
    species INTEGER REFERENCES Species (id) NOT NULL,
    smartness INTEGER CHECK (smartness >= 0)
);


CREATE TABLE IF NOT EXISTS Humans (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL, 
    animal_id INTEGER REFERENCES Animals (id) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Actions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE, 
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Plans (
    id SERIAL PRIMARY KEY,
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

CREATE TABLE IF NOT EXISTS PlanToActions (
    plan_id INTEGER REFERENCES Plans (id),
    action_id INTEGER REFERENCES Actions (id),
    PRIMARY KEY (plan_id, action_id)
);

CREATE TABLE IF NOT EXISTS PlansToAnimals (
    plan_id INTEGER REFERENCES Plans (id),
    animal_id INTEGER REFERENCES Animals (id),
    PRIMARY KEY (plan_id, animal_id)
);w