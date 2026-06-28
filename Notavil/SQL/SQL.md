#  SQL Triggers and Functions for Supabase
## IMPORTANT: Run one by one, in order!



## =======================================================
## create users table query
DROP TABLE IF EXISTS public.users;

CREATE TABLE public.users (
  id uuid REFERENCES auth.users (id) NOT NULL PRIMARY KEY,
  email text NULL,
  first_name text NULL,
  last_name text NULL,

  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
) TABLESPACE pg_default;

## =======================================================


## =======================================================
## trigger to automatically insert a user into the public.users table

create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.users (id, email, first_name, last_name, created_at)
  values (
    new.id, 
    new.email, 
    new.raw_user_meta_data->>'first_name', 
    new.raw_user_meta_data->>'last_name',  
    new.created_at
  );
  
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_auth_user_created on auth.users;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
  
## =======================================================



