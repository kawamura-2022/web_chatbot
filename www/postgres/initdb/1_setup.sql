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
INSERT INTO POST(
  content
)
VALUES(
  ' '
);
INSERT INTO AI_POST(
  content
)
VALUES(
  ' '
);

CREATE TABLE IF NOT EXISTS COMMENT_TEMPLATE(
  id SERIAL NOT NULL,
  class TEXT NOT NULL,
  content TEXT NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO COMMENT_TEMPLATE(
  class, content
)
VALUES
  ('issue', 'いいですね，すごーい！'),('issue', 'なるほど，すごい着眼点ですね！'),('issue', '天才ですか，，？'),
  ('idea', 'よくそんなこと思いつきますね！'),('idea', 'なるほど！勉強になります！'),('idea', 'ええっ！斬新！'),
  ('pros_and_cons', '私もそう思います！'),('pros_and_cons', '間違いないですね！'),('pros_and_cons', 'おっしゃる通りです！')
;
