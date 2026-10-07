-- Run this file in the SQL Editor of your own Supabase project.
-- The client may read records, but only this RPC can create a record.
begin;

create table if not exists public.classsense_locations (
  id text primary key
);
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null check (char_length(btrim(display_name)) between 2 and 60)
);
create table if not exists public.ventilation_records (
  id uuid primary key default gen_random_uuid(),
  location_id text not null references public.classsense_locations(id),
  user_id uuid references auth.users(id) on delete set null,
  display_name text not null check (char_length(btrim(display_name)) between 2 and 60),
  co2_ppm integer not null check (co2_ppm between 400 and 1600),
  is_demo boolean not null default true check (is_demo = true),
  created_at timestamptz not null default now(),
  request_id uuid not null,
  unique (user_id, request_id)
);
create index if not exists ventilation_records_location_time
  on public.ventilation_records (location_id, created_at desc);

insert into public.classsense_locations (id) values
  ('C1.1.139'),
  ('C1.1.140'),
  ('C1.1.141'),
  ('C1.1.142'),
  ('C1.1.143'),
  ('C1.1.155'),
  ('C1.1.156'),
  ('C1.1.163'),
  ('C1.1.164'),
  ('C1.1.165'),
  ('C1.1.168'),
  ('C1.1.221P'),
  ('C1.1.222P'),
  ('C1.1.223P'),
  ('C1.1.224P'),
  ('C1.1.225P'),
  ('C1.1.226P'),
  ('C1.1.227P'),
  ('C1.1.228P'),
  ('C1.1.229P'),
  ('C1.1.230P'),
  ('C1.1.231P'),
  ('C1.1.232P'),
  ('C1.1.233P'),
  ('C1.1.234P'),
  ('C1.1.235P'),
  ('C1.1.238K'),
  ('C1.1.239K'),
  ('C1.1.240K'),
  ('C1.1.241K'),
  ('C1.1.242K'),
  ('C1.1.244K'),
  ('C1.1.245K'),
  ('C1.1.246'),
  ('C1.1.248'),
  ('C1.1.250'),
  ('C1.1.251L'),
  ('C1.1.252L'),
  ('C1.1.253L'),
  ('C1.1.254L'),
  ('C1.1.255P'),
  ('C1.1.256P'),
  ('C1.1.260P'),
  ('C1.1.261'),
  ('C1.1.262'),
  ('C1.1.263'),
  ('C1.1.264'),
  ('C1.1.265'),
  ('C1.1.266'),
  ('C1.1.267'),
  ('C1.1.268'),
  ('C1.1.269'),
  ('C1.1.270'),
  ('C1.1.271'),
  ('C1.1.272'),
  ('C1.1.273'),
  ('C1.1.318K'),
  ('C1.1.320'),
  ('C1.1.321'),
  ('C1.1.322'),
  ('C1.1.323'),
  ('C1.1.324L'),
  ('C1.1.325'),
  ('C1.1.326L'),
  ('C1.1.327'),
  ('C1.1.328L'),
  ('C1.1.329'),
  ('C1.1.330'),
  ('C1.1.332'),
  ('C1.1.333'),
  ('C1.1.334L'),
  ('C1.1.335'),
  ('C1.1.336'),
  ('C1.1.337'),
  ('C1.1.338'),
  ('C1.1.341P'),
  ('C1.1.342P'),
  ('C1.1.343P'),
  ('C1.1.344P'),
  ('C1.1.346P'),
  ('C1.1.347P'),
  ('C1.1.348K'),
  ('C1.1.349P'),
  ('C1.1.350P'),
  ('C1.1.352K'),
  ('C1.1.353P'),
  ('C1.1.354K'),
  ('C1.1.355P'),
  ('C1.1.357K'),
  ('C1.1.358K'),
  ('C1.1.360K'),
  ('C1.1.361K'),
  ('C1.1.365P'),
  ('C1.1.366P'),
  ('C1.2.121K'),
  ('C1.2.122K'),
  ('C1.2.123K'),
  ('C1.2.124K'),
  ('C1.2.129'),
  ('C1.2.133'),
  ('C1.2.135'),
  ('C1.2.136'),
  ('C1.2.137P'),
  ('C1.2.138L'),
  ('C1.2.139'),
  ('C1.2.221P'),
  ('C1.2.222P'),
  ('C1.2.223K'),
  ('C1.2.224P'),
  ('C1.2.225P'),
  ('C1.2.226P'),
  ('C1.2.227P'),
  ('C1.2.228P'),
  ('C1.2.229P'),
  ('C1.2.230P'),
  ('C1.2.231K'),
  ('C1.2.232P'),
  ('C1.2.233L'),
  ('C1.2.234K'),
  ('C1.2.237L'),
  ('C1.2.239K'),
  ('C1.2.240K'),
  ('C1.2.241K'),
  ('C1.2.242K'),
  ('C1.2.243K'),
  ('C1.2.245'),
  ('C1.2.246'),
  ('C1.2.248L'),
  ('C1.2.249L'),
  ('C1.2.250L'),
  ('C1.2.251L'),
  ('C1.2.252K'),
  ('C1.2.254'),
  ('C1.2.255'),
  ('C1.2.319'),
  ('C1.2.320'),
  ('C1.2.321'),
  ('C1.2.323'),
  ('C1.2.324'),
  ('C1.2.325'),
  ('C1.2.326'),
  ('C1.2.327'),
  ('C1.2.328'),
  ('C1.2.329'),
  ('C1.2.330'),
  ('C1.2.331'),
  ('C1.2.332'),
  ('C1.2.334'),
  ('C1.2.335'),
  ('C1.2.336'),
  ('C1.2.337'),
  ('C1.2.338'),
  ('C1.2.339'),
  ('C1.2.340'),
  ('C1.2.344'),
  ('C1.2.346'),
  ('C1.2.352'),
  ('C1.2.354'),
  ('C1.2.358'),
  ('C1.2.359'),
  ('C1.2.360'),
  ('C1.2.362'),
  ('C1.2.363'),
  ('C1.2.364'),
  ('C1.2.365'),
  ('C1.2.366'),
  ('C1.2.367'),
  ('C1.2.368'),
  ('C1.2.369'),
  ('C1.2.370'),
  ('C1.2.371'),
  ('C1.2.374'),
  ('C1.2.375'),
  ('C1.2.376'),
  ('C1.3.121'),
  ('C1.3.125'),
  ('C1.3.126'),
  ('C1.3.128'),
  ('C1.3.129'),
  ('C1.3.130'),
  ('C1.3.168'),
  ('C1.3.187'),
  ('C1.3.188'),
  ('C1.3.221K'),
  ('C1.3.222P'),
  ('C1.3.223P'),
  ('C1.3.224P'),
  ('C1.3.225P'),
  ('C1.3.226P'),
  ('C1.3.227P'),
  ('C1.3.228K'),
  ('C1.3.229P'),
  ('C1.3.230P'),
  ('C1.3.231P'),
  ('C1.3.232P'),
  ('C1.3.233P'),
  ('C1.3.234K'),
  ('C1.3.235L'),
  ('C1.3.236P'),
  ('C1.3.237P'),
  ('C1.3.240P'),
  ('C1.3.241P'),
  ('C1.3.243P'),
  ('C1.3.244P'),
  ('C1.3.246'),
  ('C1.3.247P'),
  ('C1.3.248P'),
  ('C1.3.249K'),
  ('C1.3.250K'),
  ('C1.3.251K'),
  ('C1.3.252K'),
  ('C1.3.253K'),
  ('C1.3.254L'),
  ('C1.3.255L'),
  ('C1.3.257P'),
  ('C1.3.258P'),
  ('C1.3.259P'),
  ('C1.3.260P'),
  ('C1.3.261P'),
  ('C1.3.262P'),
  ('C1.3.263P'),
  ('C1.3.264L'),
  ('C1.3.266P'),
  ('C1.3.267P'),
  ('C1.3.318P'),
  ('C1.3.319P'),
  ('C1.3.321P'),
  ('C1.3.322P'),
  ('C1.3.323K'),
  ('C1.3.324K'),
  ('C1.3.327K'),
  ('C1.3.328'),
  ('C1.3.331P'),
  ('C1.3.337'),
  ('C1.3.338'),
  ('C1.3.339'),
  ('C1.3.340'),
  ('C1.3.341'),
  ('C1.3.342'),
  ('C1.3.343'),
  ('C1.3.344'),
  ('C1.3.345'),
  ('C1.3.346'),
  ('C1.3.352'),
  ('C1.3.353'),
  ('C1.3.354'),
  ('C1.3.355'),
  ('C1.3.356'),
  ('C1.3.357P'),
  ('C1.3.358P'),
  ('C1.3.359P'),
  ('C1.3.360K'),
  ('C1.3.361'),
  ('C1.3.362P'),
  ('C1.3.365L'),
  ('C1.3.366L'),
  ('C1.3.367K'),
  ('C1.3.370L'),
  ('gym'),
  ('assembly-hall'),
  ('open-space'),
  ('library'),
  ('coworking'),
  ('dining-hall')
on conflict (id) do nothing;

alter table public.classsense_locations enable row level security;
alter table public.profiles enable row level security;
alter table public.ventilation_records enable row level security;

drop policy if exists locations_read on public.classsense_locations;
create policy locations_read on public.classsense_locations
  for select to anon, authenticated using (true);
drop policy if exists profiles_read_own on public.profiles;
create policy profiles_read_own on public.profiles
  for select to authenticated using (id = (select auth.uid()));
drop policy if exists records_read on public.ventilation_records;
create policy records_read on public.ventilation_records
  for select to authenticated using ((select auth.uid()) is not null);

revoke all on public.classsense_locations, public.profiles, public.ventilation_records
  from public, anon, authenticated;
grant usage on schema public to anon, authenticated;
grant select on public.classsense_locations to anon, authenticated;
grant select (id, display_name) on public.profiles to authenticated;
-- Do not expose account IDs, request IDs or emails in the shared history.
grant select (id, location_id, display_name, co2_ppm, is_demo, created_at)
  on public.ventilation_records to authenticated;

create or replace function public.classsense_create_profile()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare
  name text;
begin
  name := left(btrim(coalesce(new.raw_user_meta_data->>'display_name', '')), 60);
  if char_length(name) < 2 then name := 'User'; end if;
  insert into public.profiles (id, display_name) values (new.id, name)
    on conflict (id) do nothing;
  return new;
end;
$$;
revoke all on function public.classsense_create_profile() from public, anon, authenticated;
drop trigger if exists classsense_new_user on auth.users;
create trigger classsense_new_user after insert on auth.users
  for each row execute function public.classsense_create_profile();

-- Backfill accounts created before this schema was installed.
insert into public.profiles (id, display_name)
select id, case
  when char_length(btrim(coalesce(raw_user_meta_data->>'display_name', ''))) >= 2
    then left(btrim(raw_user_meta_data->>'display_name'), 60)
  else 'User' end
from auth.users on conflict (id) do nothing;

create or replace function public.record_ventilation(
  p_location_id text, p_co2_ppm integer, p_request_id uuid
)
returns jsonb language plpgsql security definer set search_path = ''
as $$
declare
  current_user_id uuid := auth.uid();
  author_name text;
  saved public.ventilation_records%rowtype;
begin
  if current_user_id is null then
    raise exception 'Sign in required' using errcode = '42501';
  end if;
  if p_request_id is null then
    raise exception 'Request ID required' using errcode = '22023';
  end if;
  -- A retry of the same request returns its original acknowledgement.
  select * into saved from public.ventilation_records
    where user_id = current_user_id and request_id = p_request_id;
  if found then
    if saved.location_id <> p_location_id or saved.co2_ppm <> p_co2_ppm then
      raise exception 'Request ID was already used' using errcode = '22023';
    end if;
    return jsonb_build_object('id', saved.id, 'location_id', saved.location_id,
      'display_name', saved.display_name, 'co2_ppm', saved.co2_ppm,
      'is_demo', saved.is_demo, 'created_at', saved.created_at);
  end if;
  if p_co2_ppm is null or p_co2_ppm < 1000 or p_co2_ppm > 1600 then
    raise exception 'A High demo reading is required' using errcode = '22023';
  end if;
  if not exists (select 1 from public.classsense_locations where id = p_location_id) then
    raise exception 'Location does not exist' using errcode = '22023';
  end if;
  select display_name into author_name from public.profiles where id = current_user_id;
  if author_name is null then
    raise exception 'Profile not found' using errcode = '42501';
  end if;
  insert into public.ventilation_records
    (location_id, user_id, display_name, co2_ppm, is_demo, request_id)
  values (p_location_id, current_user_id, author_name, p_co2_ppm, true, p_request_id)
    on conflict (user_id, request_id) do nothing;
  select * into saved from public.ventilation_records
    where user_id = current_user_id and request_id = p_request_id;
  if saved.location_id <> p_location_id or saved.co2_ppm <> p_co2_ppm then
    raise exception 'Request ID was already used' using errcode = '22023';
  end if;
  return jsonb_build_object('id', saved.id, 'location_id', saved.location_id,
    'display_name', saved.display_name, 'co2_ppm', saved.co2_ppm,
    'is_demo', saved.is_demo, 'created_at', saved.created_at);
end;
$$;
revoke all on function public.record_ventilation(text, integer, uuid) from public, anon, authenticated;
grant execute on function public.record_ventilation(text, integer, uuid) to authenticated;

commit;
