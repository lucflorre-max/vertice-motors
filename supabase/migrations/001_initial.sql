create extension if not exists "pgcrypto";

create type public.user_role as enum ('admin','manager','agent');
create type public.user_status as enum ('pending','active','blocked');
create type public.vehicle_status as enum ('draft','available','reserved','sold');
create type public.lead_status as enum ('new','contacted','qualified','won','lost');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null unique,
  full_name text,
  role public.user_role not null default 'agent',
  status public.user_status not null default 'pending',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.vehicles (
  id uuid primary key default gen_random_uuid(),
  name text not null, brand text not null, model text not null,
  year int not null check(year between 1950 and 2100),
  mileage int not null default 0 check(mileage >= 0),
  price numeric(12,2) not null check(price >= 0),
  category text not null, transmission text not null default 'Automático',
  fuel text not null default 'Flex', color text not null default '',
  description text, cover_url text, featured boolean not null default false,
  status public.vehicle_status not null default 'draft',
  created_by uuid references public.profiles(id),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table public.leads (
  id uuid primary key default gen_random_uuid(), name text not null,
  phone text not null, email text, source text not null default 'site',
  subject text not null, vehicle_id uuid references public.vehicles(id) on delete set null,
  status public.lead_status not null default 'new', notes text,
  assigned_to uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table public.financing_requests (
  id uuid primary key default gen_random_uuid(), lead_id uuid references public.leads(id) on delete cascade,
  vehicle_id uuid references public.vehicles(id) on delete set null,
  desired_entry numeric(12,2), desired_term int, monthly_income numeric(12,2),
  status text not null default 'new', notes text,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table public.audit_logs (
  id bigint generated always as identity primary key, user_id uuid references public.profiles(id),
  action text not null, entity text not null, entity_id text, metadata jsonb not null default '{}',
  created_at timestamptz not null default now()
);

create or replace function public.handle_new_user() returns trigger language plpgsql security definer set search_path=public as $$
begin insert into public.profiles(id,email,full_name) values(new.id,new.email,coalesce(new.raw_user_meta_data->>'full_name','')); return new; end; $$;
create trigger on_auth_user_created after insert on auth.users for each row execute procedure public.handle_new_user();

create or replace function public.is_active_staff() returns boolean language sql stable security definer set search_path=public as $$
  select exists(select 1 from profiles where id=auth.uid() and status='active');
$$;
create or replace function public.is_manager() returns boolean language sql stable security definer set search_path=public as $$
  select exists(select 1 from profiles where id=auth.uid() and status='active' and role in ('admin','manager'));
$$;
create or replace function public.is_admin() returns boolean language sql stable security definer set search_path=public as $$
  select exists(select 1 from profiles where id=auth.uid() and status='active' and role='admin');
$$;

alter table profiles enable row level security;
alter table vehicles enable row level security;
alter table leads enable row level security;
alter table financing_requests enable row level security;
alter table audit_logs enable row level security;

create policy "public reads available vehicles" on vehicles for select using(status='available' or public.is_active_staff());
create policy "staff manages vehicles" on vehicles for all using(public.is_active_staff()) with check(public.is_active_staff());
create policy "public creates leads" on leads for insert to anon, authenticated with check(true);
create policy "staff reads leads" on leads for select using(public.is_active_staff());
create policy "staff updates leads" on leads for update using(public.is_active_staff());
create policy "public creates financing" on financing_requests for insert to anon, authenticated with check(true);
create policy "staff manages financing" on financing_requests for all using(public.is_active_staff()) with check(public.is_active_staff());
create policy "user reads own profile" on profiles for select using(id=auth.uid() or public.is_manager());
create policy "managers approve staff" on profiles for update using(public.is_manager()) with check(public.is_manager());
create policy "admin manages roles" on profiles for all using(public.is_admin()) with check(public.is_admin());
create policy "staff reads audit" on audit_logs for select using(public.is_manager());
create policy "staff creates audit" on audit_logs for insert with check(public.is_active_staff() and user_id=auth.uid());

create index vehicles_status_idx on vehicles(status);
create index leads_status_created_idx on leads(status,created_at desc);
create index financing_status_idx on financing_requests(status);
