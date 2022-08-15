SELECT
	celebrations.name AS "Name",
	celebrations.date AS "Date"
FROM public.celebrations
LEFT JOIN public.celebrations_country_links ON celebrations_country_links.celebration_id = celebrations.id
LEFT JOIN public.countries ON countries.id = celebrations_country_links.country_id;
