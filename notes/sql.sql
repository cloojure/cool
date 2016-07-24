-- Sample SQL syntax on postgres:

-----------------------------------------------------------------------------
$ create table test as
    select
        i as id,
        now() - random() * '5 years'::interval as ts,
        (random() * 100000000)::int4 as number,
        repeat('x', (10 + 40 * random())::int4) as txt
    from
        generate_series(1, 10000000) i;
SELECT 10000000
 
$ alter table test add primary key (id);
ALTER TABLE

-----------------------------------------------------------------------------
$ create table test as
SELECT passenger_count,
       EXTRACT(year from pickup_datetime) as year,
       round(trip_distance) distance,
       count(*) trips
FROM trips
GROUP BY passenger_count,
         year,
         distance
ORDER BY year,
         trips desc;
