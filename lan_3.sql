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
SELECT * FROM star;
prompt ]]>
prompt </task>

prompt <task n="2.2">
prompt <![CDATA[
SELECT proper_names, spectral_class,s_mass 
FROM star 
WHERE distance <= 30;
prompt ]]>
prompt </task>

prompt <task n="2.3">
prompt <![CDATA[
SELECT planet.planet_names, orbit.orbital_period,planet.planet_poi
FROM (planet JOIN orbit
ON planet.planet_id = orbit.planet_id)
WHERE 
planet.planet_poi LIKE '%gas giant%'
AND
(orbit.orbital_period BETWEEN 500 AND 5000)
ORDER BY orbit.orbital_period
;
prompt ]]>
prompt </task>

prompt <task n="2.4">
prompt <![CDATA[
SELECT star.proper_names, planet.planet_names, orbit.orbital_period, orbit.periastron, orbit.apastron
FROM planet 
JOIN orbit
ON planet.planet_id = orbit.planet_id
JOIN star
ON 
orbit.star_id = star.star_id
WHERE star.spectral_class IS NULL
ORDER BY star.proper_names, orbit.orbital_period
;
prompt ]]>
prompt </task>

prompt <task n="2.5">
prompt <![CDATA[
SELECT  star.proper_names, star.s_mass, star.stage, orbit.orbital_period
FROM star
left JOIN orbit
ON 
orbit.star_id = star.star_id
ORDER BY star.s_mass DESC, star.proper_names
;
prompt ]]>
prompt </task>

prompt <task n="2.6">
prompt <![CDATA[
SELECT star.proper_names, star.spectral_class, COUNT(orbit.star_id) AS planet_count
FROM star
LEFT JOIN orbit
ON orbit.star_id = star.star_id 
GROUP BY star.proper_names, star.spectral_class 
ORDER BY planet_count DESC, star.proper_names ASC
;
prompt ]]>
prompt </task>

prompt <task n="2.7">
prompt <![CDATA[
SELECT star.proper_names, star.spectral_class, COUNT(orbit.star_id) AS planet_count
FROM star
LEFT JOIN orbit
ON orbit.star_id = star.star_id 
HAVING COUNT(orbit.star_id) <= 3 
GROUP BY star.proper_names, star.spectral_class
ORDER BY star.proper_names ASC
;
prompt ]]>
prompt </task>

prompt <task n="2.8">
prompt <![CDATA[
SELECT  star.proper_names,
        star.distance,
        star.s_mass,
        orbit.planet_id,
        orbit.orbital_period,
        star.star_poi
FROM star
LEFT JOIN orbit
ON orbit.star_id = star.star_id 
WHERE (star.stage = 'bh' OR star.stage = 'psr' OR star.stage = 'ns') 
AND orbit.orbital_period <=  100
ORDER BY star.proper_names ASC, orbit.orbital_period ASC
;
prompt ]]>
prompt </task>

prompt <task n="3.1">
prompt <![CDATA[

prompt ]]>
prompt </task>
prompt </tasks>