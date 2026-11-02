-- 02_policies.sql
-- Row Level Security. Con RLS activo y sin politicas, la API no deja leer ni escribir.
--
-- SOLO PARA EL EJERCICIO DE CLASE: el login aun no esta implementado, por lo que
-- se abre el acceso al rol "anon" (cualquiera con la llave publishable).
-- Cuando exista autenticacion, reemplazar por politicas "to authenticated"
-- con una columna user_id (auth.uid() = user_id).

alter table public.exercises         enable row level security;
alter table public.routines          enable row level security;
alter table public.routine_exercises enable row level security;

-- Se recrean las politicas para que el script se pueda ejecutar varias veces
drop policy if exists "demo: leer ejercicios"        on public.exercises;
drop policy if exists "demo: leer rutinas"           on public.routines;
drop policy if exists "demo: crear rutinas"          on public.routines;
drop policy if exists "demo: leer rutina-ejercicio"  on public.routine_exercises;
drop policy if exists "demo: crear rutina-ejercicio" on public.routine_exercises;

-- Ejercicios: catalogo de solo lectura para la app
create policy "demo: leer ejercicios"
  on public.exercises for select to anon using (true);

-- Rutinas: listar y crear (editar y borrar quedan fuera del alcance)
create policy "demo: leer rutinas"
  on public.routines for select to anon using (true);
create policy "demo: crear rutinas"
  on public.routines for insert to anon with check (true);

-- Ejercicios de cada rutina: listar y crear
create policy "demo: leer rutina-ejercicio"
  on public.routine_exercises for select to anon using (true);
create policy "demo: crear rutina-ejercicio"
  on public.routine_exercises for insert to anon with check (true);
