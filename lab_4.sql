set echo off
set verify off
alter session set NLS_DATE_FORMAT='YYYY-MM-DD';
set serveroutput on
set feedback off

prompt <tasks>

prompt <task n="1.1">
prompt <![CDATA[

prompt ]]>
prompt </task>

prompt <task n="2.1">
prompt <![CDATA[

prompt ]]>
prompt </task>

prompt <task n="3.1">
prompt <![CDATA[
INSERT INTO star (proper_names, distance, s_mass, spectral_class, stage, comfort_zone)
VALUES ('Deneb, Alpha Cygni, 50 Cygni, Arided', 2615, 19, 'A2', 'spgt', 258);
prompt ]]>
prompt </task>

prompt <task n="3.2">
prompt <![CDATA[
UPDATE star
SET spectral_class = 'M9',
    s_mass=0.087
WHERE proper_names = 'TRAPPIST-1';
prompt ]]>
prompt </task>

prompt <task n="3.3">
prompt <![CDATA[
UPDATE star
SET comfort_zone = comfort_zone *1.15
WHERE spectral_class LIKE 'A%';
prompt ]]>
prompt </task>

prompt <task n="3.4">
prompt <![CDATA[
UPDATE planet
SET planet.planet_poi=  CONCAT(planet.planet_poi,' The planet is on a circular orbit.')
WHERE planet.planet_id IN 
(SELECT orbit.planet_id
FROM planet JOIN orbit
ON orbit.planet_id = planet.planet_id
WHERE
orbit.apastron = orbit.periastron
);
prompt ]]>
prompt </task>

prompt <task n="3.5">
prompt <![CDATA[
DELETE FROM orbit
WHERE orbit.orbit_id IN (
    SELECT orbit.orbit_id 
    FROM star LEFT JOIN orbit
    ON star.star_id = orbit.star_id
    WHERE star.proper_names = '55 Cancri A, 55 Cnc A'
);
prompt ]]>
prompt </task>

prompt <task n="3.6">
prompt <![CDATA[
INSERT INTO orbit (star_id, planet_id, orbital_period, periastron, apastron)
VALUES  ((
SELECT star_id
FROM star
WHERE proper_names = '55 Cancri B, 55 Cnc B'),
(SELECT planet_id
FROM planet
WHERE planet_names = '55 Cancri d, 55 Cnc d, Lipperhey'),
/* orbital period*/ 153.04,
/*periastron*/      0.411,
/*apastron*/        0.64);
prompt ]]>
prompt </task>
prompt </tasks>