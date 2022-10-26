DO $$
DECLARE
  r RECORD;
  next_date DATE;
  celebration_id INTEGER;
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
    WHERE date_part('year', celebrations.date) = date_part('year', current_date)
      AND celebrations.is_recurrent = true
      AND celebrations.published_at IS NOT NULL
  )
  LOOP
    next_date := r.date + interval '1 year';

    IF NOT EXISTS (
      SELECT FROM public.celebrations
      LEFT JOIN public.celebrations_country_links ON celebrations_country_links.celebration_id = celebrations.id
      LEFT JOIN public.countries ON countries.id = celebrations_country_links.country_id
      LEFT JOIN public.celebrations_state_links ON celebrations_state_links.celebration_id = celebrations.id
      LEFT JOIN public.states ON states.id = celebrations_state_links.state_id
      LEFT JOIN public.celebrations_city_links ON celebrations_city_links.celebration_id = celebrations.id
      LEFT JOIN public.cities ON cities.id = celebrations_city_links.city_id
      WHERE celebrations.name = r.name
        AND celebrations.date = next_date
        AND coalesce(celebrations.is_business_day::text, '') = coalesce(r.is_business_day::text, '')
        AND coalesce(countries.id::text, '') = coalesce(r.country_id::text, '')
        AND coalesce(states.id::text, '') = coalesce(r.state_id::text, '')
        AND coalesce(cities.id::text, '') = coalesce(r.city_id::text, '')
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
      ) RETURNING id INTO celebration_id;

      IF r.country_id IS NOT NULL
      THEN
        INSERT INTO public.celebrations_country_links (country_id, celebration_id)
        VALUES (r.country_id, celebration_id);
      END IF;

      IF r.state_id IS NOT NULL
      THEN
        INSERT INTO public.celebrations_state_links (state_id, celebration_id)
        VALUES (r.state_id, celebration_id);
      END IF;

      IF r.city_id IS NOT NULL
      THEN
        INSERT INTO public.celebrations_city_links (city_id, celebration_id)
        VALUES (r.city_id, celebration_id);
      END IF;
    END IF;
  END LOOP;
END $$;
