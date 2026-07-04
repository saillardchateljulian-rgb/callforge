-- ============================================
-- CallForge — schéma Supabase
-- À coller dans : Supabase → SQL Editor → Run
-- ============================================

-- Contacts (les 608 artisans)
create table if not exists public.contacts (
  id        bigint primary key,
  nom       text not null,
  metier    text default '',
  telephone text default '',
  email     text default '',
  ville     text default '',
  adresse   text default ''
);

-- Journal des appels
create table if not exists public.calls (
  id         text primary key,
  contact_id bigint,
  ts         bigint not null,
  outcome    text not null,
  duration   integer default 0,
  notes      text default '',
  recall_at  bigint,
  nom        text default '',
  metier     text default '',
  telephone  text default '',
  ville      text default '',
  recording  text
);

-- Sécurité : accès uniquement aux utilisateurs connectés
alter table public.contacts enable row level security;
alter table public.calls    enable row level security;

drop policy if exists "auth full access contacts" on public.contacts;
create policy "auth full access contacts" on public.contacts
  for all to authenticated using (true) with check (true);

drop policy if exists "auth full access calls" on public.calls;
create policy "auth full access calls" on public.calls
  for all to authenticated using (true) with check (true);

-- Bucket privé pour les enregistrements audio
insert into storage.buckets (id, name, public)
values ('recordings', 'recordings', false)
on conflict (id) do nothing;

drop policy if exists "auth rw recordings" on storage.objects;
create policy "auth rw recordings" on storage.objects
  for all to authenticated
  using (bucket_id = 'recordings')
  with check (bucket_id = 'recordings');
