create table if not exists users (
  id serial primary key,
  email text unique not null,
  password text not null
);

create table if not exists sessions (
  session text primary key,
  id integer not null references users(id)
);
