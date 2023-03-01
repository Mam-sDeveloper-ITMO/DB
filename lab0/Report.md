#### «Национальный исследовательский университет ИТМО»
### Информационные системы и базы данных
## Лабораторная работа 1
## Вариант 31301
### Бутвин Михаил, P3130
### 2023

<div style="clear: both; page-break-after: always;"></div>


## Текст задания

1. На основе предложенной предметной области (текста) составить ее описание. Из полученного описания выделить сущности, их атрибуты и связи.
2. Составить инфологическую модель.
3. Составить даталогическую модель. При описании типов данных для атрибутов должны использоваться типы из СУБД PostgreSQL.
4. Реализовать даталогическую модель в PostgreSQL. При описании и реализации даталогической модели должны учитываться ограничения целостности, которые характерны для полученной предметной области.
5. Заполнить созданные таблицы тестовыми данными.

> Но сейчас, глядя в окно, Ву был обеспокоен. Рапторы слишком долго занимались одним и тем же. Они достаточно умны, а чем умнее животное, тем скорее ему надоедают однообразные действия. Умные животные способны составлять планы, и...
<div style="clear: both; page-break-after: always;"></div>

## Описание предметной области

Предметная область представляет процесс охоты рапторов на человека.  

## Сущности, атрибуты и связи

### Сущности

> **Стержневые:**
> 1. Human - люди
> 2. Animal - животные 
> 3. Action - действия (смотреть, беспокоиться, искать и тд)
> 4. Plan - план из нескольких действий

> **Характеристики:**
> 1. Species - виды животных

> **Ассоциации:**
> 1. AnimalsToPlans - связь животных и планов действий
> 2. PlansToActions - связь планов и действий

<div style="clear: both; page-break-after: always;"></div>

### Атрибуты

> **Human**:
> - Name  
> - Animal instance

> **Animal**:
> - Biological species
> - Smartness
 
> **Species**:
> - Species name

> **Action**:
> - Action name
> - Action description

> **Plan**:
> - Start time
> - End time

> **AnimalsToPlans**:
> - Animal instance
> - Plan instance

> **PlansToActions**:
> - Plan instance
> - Action instance

### Связи

> `Human-Animal` - Связь 1:1. Каждому человеку соответствует единственный экземпляр животного, каждому животному может соответствовать не более одного человека

> `Animal-Species` - Связь M:1. Одному животному соответствует один вид, могут быть животные одного вида

> `Animal-Plan` - Связь M:М. Каждому животному соответствует несколько (или 0) его планов, один план может соответствовать нескольким животным (при работе сообща, например)

> `Plan-Action` - Связь M:М. Каждому плану соответствует несколько входящих в него видов действий (хотя бы одно), в разным планах могут быть одни виды действий

<div style="clear: both; page-break-after: always;"></div>

### Инфологическая модель

![Инфологическая модель](assets/Entity%20Relationship%20Model.svg)

<div style="clear: both; page-break-after: always;"></div>

### Даталогическая модель

![Даталогическая модель](assets/Data%20Model.svg)

<div style="clear: both; page-break-after: always;"></div>

### Реализация даталогической модели в PostgreSQL

```sql
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
);
```

<div style="clear: both; page-break-after: always;"></div>

## Вывод

В ходе выполнения лабораторной работы была составлена инфологическая и даталогическая модели предметной области, а также реализована даталогическая модель в СУБД PostgreSQL.
