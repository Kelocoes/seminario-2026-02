-- 01_schema.sql
-- Esquema base de la app de rutinas. Ejecutar en Supabase: SQL Editor.
-- Orden de ejecucion: 01_schema.sql -> 02_policies.sql -> 03_seed.sql

-- Catalogo de ejercicios (equivale a availableExercises en mock_data.dart)
create table if not exists public.exercises (
  id               bigint generated always as identity primary key,
  name             text not null unique,
  type             text not null,
  duration_minutes integer not null check (duration_minutes > 0),
  created_at       timestamptz not null default now()
);

-- Rutinas
create table if not exists public.routines (
  id          bigint generated always as identity primary key,
  name        text not null,
  description text not null default '',
  created_at  timestamptz not null default now()
);

-- Relacion muchos a muchos: una rutina tiene varios ejercicios
create table if not exists public.routine_exercises (
  routine_id  bigint not null references public.routines (id) on delete cascade,
  exercise_id bigint not null references public.exercises (id) on delete restrict,
  primary key (routine_id, exercise_id)
);

create index if not exists routine_exercises_exercise_idx
  on public.routine_exercises (exercise_id);
