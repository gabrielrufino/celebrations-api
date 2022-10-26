DO $$
DECLARE
  r record;
  next_date date;
BEGIN
  FOR r IN (
    SELECT
      celebrations.name,
	    celebrations.date,
	    celebrations.is_business_day,
      countries.id AS country_id,
      states.id AS state_id,
      cities.id AS city_id
    FROM public.celebrations
    LEFT JOIN public.celebrations_country_links ON celebrations_country_links.celebration_id = celebrations.id
    LEFT JOIN public.countries ON countries.id = celebrations_country_links.country_id
    LEFT JOIN public.celebrations_state_links ON celebrations_state_links.celebration_id = celebrations.id
    LEFT JOIN public.states ON states.id = celebrations_state_links.state_id
    LEFT JOIN public.celebrations_city_links ON celebrations_city_links.celebration_id = celebrations.id
    LEFT JOIN public.cities ON cities.id = celebrations_city_links.city_id
    WHERE celebrations.is_recurrent = true
    AND celebrations.published_at IS NOT NULL
    ORDER BY
      countries.name NULLS FIRST,
      states.name NULLS FIRST,
      cities.name NULLS FIRST,
      celebrations.date
    LIMIT 1
  )
  LOOP
    next_date := r.date + interval '1 year';

    IF NOT EXISTS (
		SELECT FROM public.celebrations
		WHERE celebrations.date = next_date
		AND name = r.name
	)
    THEN
      INSERT INTO public.celebrations (
        name,
        date,
        is_business_day,
        is_recurrent
      ) VALUES (
        r.name,
        next_date,
        r.is_business_day,
        true
      );
    END IF;
  END LOOP;
END $$;
