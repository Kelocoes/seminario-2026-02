-- 05_storage.sql
-- Semana 15: Supabase Storage. Ejecutar en el SQL Editor despues de 04.
-- Requisito: crear el bucket publico "fotos" y subir las 3 imagenes de
-- supabase/fotos/ a la raiz del bucket (sin carpetas).
-- El bucket publico permite VER las imagenes sin politicas adicionales.
-- Se puede ejecutar varias veces.

-- 1. Columna con la ruta de la imagen dentro del bucket
alter table public.routines add column if not exists foto_path text;

-- 2. Una imagen por cada rutina inicial
update public.routines set foto_path = 'pierna.png' where name = 'Pierna y Glúteo';
update public.routines set foto_path = 'torso.png'  where name = 'Torso y Fuerza';
update public.routines set foto_path = 'cardio.png' where name = 'Cardio HIIT Express';
