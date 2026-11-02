-- 03_seed.sql
-- Datos base (equivalen a mock_data.dart). Se puede ejecutar varias veces.

insert into public.exercises (name, type, duration_minutes) values
  ('Sentadillas',             'Fuerza',       15),
  ('Flexiones de pecho',      'Fuerza',       10),
  ('Burpees',                 'Cardio',       12),
  ('Plancha abdominal',       'Core',          8),
  ('Zancadas con salto',      'Cardio',       10),
  ('Estiramientos dinámicos', 'Flexibilidad',  5)
on conflict (name) do nothing;

-- Rutinas iniciales (solo si la tabla esta vacia, para no duplicarlas)
do $$
begin
  if not exists (select 1 from public.routines) then
    insert into public.routines (name, description) values
      ('Pierna y Glúteo',     'Enfoque en tren inferior con ejercicios de alta intensidad.'),
      ('Torso y Fuerza',      'Trabajo integral de pecho, espalda y core.'),
      ('Cardio HIIT Express', 'Sesión rápida para elevar pulsaciones y quemar calorías.');

    insert into public.routine_exercises (routine_id, exercise_id)
    select r.id, e.id
    from (values
      ('Pierna y Glúteo',     'Sentadillas'),
      ('Pierna y Glúteo',     'Zancadas con salto'),
      ('Torso y Fuerza',      'Flexiones de pecho'),
      ('Torso y Fuerza',      'Plancha abdominal'),
      ('Cardio HIIT Express', 'Burpees'),
      ('Cardio HIIT Express', 'Estiramientos dinámicos')
    ) as v (routine_name, exercise_name)
    join public.routines  r on r.name = v.routine_name
    join public.exercises e on e.name = v.exercise_name;
  end if;
end $$;
