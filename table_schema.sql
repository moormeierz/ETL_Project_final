-- Create tables and import data

CREATE TABLE "happiness_csv" (
    "country_name" VARCHAR   NOT NULL,
    "happy_score" DECIMAL   NOT NULL,
    "gdp_per_capita" DECIMAL   NOT NULL,
    "social_support" DECIMAL   NOT NULL,
    "life_expectancy" DECIMAL   NOT NULL,
    "generosity" DECIMAL   NOT NULL,
    "perception_of_corruption" DECIMAL   NOT NULL,
    CONSTRAINT "pk_happiness_csv" PRIMARY KEY (
        "country_name"
     )
);

CREATE TABLE "country_info_API" (
    "country_name" VARCHAR   NOT NULL,
    "region" VARCHAR   NOT NULL,
    "subregion" VARCHAR   NOT NULL,
    "area" DECIMAL   NOT NULL,
    CONSTRAINT "pk_country_info_API" PRIMARY KEY (
        "country_name"
     )
);

CREATE TABLE "economic_csv" (
    "country_name" VARCHAR,
    "world_rank" VARCHAR,
    "population" DECIMAL,
    "total_gdp" VARCHAR,
    "inflation" DECIMAL,
    "unemployment" DECIMAL,
    CONSTRAINT "pk_economic_csv" PRIMARY KEY (
        "country_name"
     )
);

-- Assign keys

ALTER TABLE "happiness_csv" ADD CONSTRAINT "fk_happiness_csv_country_name" FOREIGN KEY("country_name")
REFERENCES "economic_csv" ("country_name");

ALTER TABLE "country_info_API" ADD CONSTRAINT "fk_country_info_API_country_name" FOREIGN KEY("country_name")
REFERENCES "happiness_csv" ("country_name");

ALTER TABLE "economic_csv" ADD CONSTRAINT "fk_economic_csv_country_name" FOREIGN KEY("country_name")
REFERENCES "country_info_API" ("country_name");

