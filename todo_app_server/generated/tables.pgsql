--
-- Class Todo as table todo
--

CREATE TABLE todo (
  "id" serial,
  "title" text NOT NULL,
  "des" text NOT NULL,
  "isComplete" boolean NOT NULL
);

ALTER TABLE ONLY todo
  ADD CONSTRAINT todo_pkey PRIMARY KEY (id);


