--=========================================================
-- File: normalize_olympics.sql
-- Date Created: 2021-05-02
-- Purpose: create olympics database and normalize data downloaded from kaggle.com
--=========================================================

-- create database
CREATE DATABASE olympics;

-- create schema for staging the raw data
CREATE SCHEMA staging;

-- create table for the main data 
CREATE TABLE staging.data
(
    id integer,
    name varchar,
    sex varchar,
    age varchar,
    height varchar,
    weight varchar,
    team varchar,
    noc varchar,
    games varchar,
    year integer,
    season varchar,
    city varchar,
    sport varchar,
    event varchar,
    medal varchar
)

-- create table for the noc regions
CREATE TABLE staging.noc_regions (
    noc varchar,
    region varchar,
    notes VARCHAR
)

-- data imported with psql shell using \copy command

-- preview data
SELECT * FROM staging.data LIMIT 5;
SELECT * FROM staging.noc_regions LIMIT 5;

-- the columns height, weight, age and medal contain 'NA' values
-- convert them to NULL
UPDATE staging.data 
SET height = NULL
WHERE height = 'NA';

UPDATE staging.data 
SET weight = NULL
WHERE weight = 'NA';

UPDATE staging.data 
SET age = NULL
WHERE age = 'NA';

UPDATE staging.data 
SET medal = NULL
WHERE medal = 'NA';

