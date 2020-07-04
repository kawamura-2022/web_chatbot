CREATE TABLE IF NOT EXISTS POST(
  post_id SERIAL NOT NULL,
  content TEXT NOT NULL,
  created_at timestamp with time zone,
  update_date timestamp with time zone,
  PRIMARY KEY (post_id)
);
CREATE TABLE IF NOT EXISTS AI_POST(
  post_id SERIAL NOT NULL,
  content TEXT NOT NULL,
  created_at timestamp with time zone,
  update_date timestamp with time zone,
  PRIMARY KEY (post_id)
);
