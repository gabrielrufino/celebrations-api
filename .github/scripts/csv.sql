SELECT
	celebrations.name AS "Name",
	to_char(celebrations.date, 'YYYY-MM-DD') AS "Date",
	CASE
		WHEN celebrations.is_business_day = true THEN 'Y'
		WHEN celebrations.is_business_day = false THEN 'N'
		ELSE null
	END AS "Business day",
	countries.name AS "Country",
	countries.code AS "Country code",
	states.name AS "State",
	cities.name AS "City",
	CASE
		WHEN celebrations.is_recurrent THEN 'Y'
		ELSE 'N'
	END AS "Recurrent"
FROM public.celebrations
LEFT JOIN public.celebrations_country_links ON celebrations_country_links.celebration_id = celebrations.id
LEFT JOIN public.countries ON countries.id = celebrations_country_links.country_id
LEFT JOIN public.celebrations_state_links ON celebrations_state_links.celebration_id = celebrations.id
LEFT JOIN public.states ON states.id = celebrations_state_links.state_id
LEFT JOIN public.celebrations_city_links ON celebrations_city_links.celebration_id = celebrations.id
LEFT JOIN public.cities ON cities.id = celebrations_city_links.city_id
WHERE celebrations.published_at IS NOT NULL
ORDER BY
	countries.name NULLS FIRST,
	states.name NULLS FIRST,
	cities.name NULLS FIRST,
	celebrations.date;
