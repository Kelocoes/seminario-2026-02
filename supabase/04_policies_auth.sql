-- 04_policies_auth.sql
-- Semana 15: de "anon" a "authenticated".
-- Ejecutar en Supabase: SQL Editor (despues de 01, 02 y 03).
-- Quita las politicas abiertas a anonimos y crea las equivalentes solo para
-- usuarios con sesion. El script se puede ejecutar varias veces.

-- 1. Quitar las politicas abiertas a anonimos
drop policy if exists "demo: leer ejercicios"        on public.exercises;
drop policy if exists "demo: leer rutinas"           on public.routines;
drop policy if exists "demo: crear rutinas"          on public.routines;
drop policy if exists "demo: leer rutina-ejercicio"  on public.routine_exercises;
drop policy if exists "demo: crear rutina-ejercicio" on public.routine_exercises;

-- 2. Quitar las nuevas (por si se re-ejecuta)
drop policy if exists "autenticados: leer ejercicios"        on public.exercises;
drop policy if exists "autenticados: leer rutinas"           on public.routines;
drop policy if exists "autenticados: crear rutinas"          on public.routines;
drop policy if exists "autenticados: leer rutina-ejercicio"  on public.routine_exercises;
drop policy if exists "autenticados: crear rutina-ejercicio" on public.routine_exercises;

-- 3. Crear las equivalentes, solo para usuarios con sesion
create policy "autenticados: leer ejercicios"
  on public.exercises for select to authenticated using (true);

create policy "autenticados: leer rutinas"
  on public.routines for select to authenticated using (true);
create policy "autenticados: crear rutinas"
  on public.routines for insert to authenticated with check (true);

create policy "autenticados: leer rutina-ejercicio"
  on public.routine_exercises for select to authenticated using (true);
create policy "autenticados: crear rutina-ejercicio"
  on public.routine_exercises for insert to authenticated with check (true);
