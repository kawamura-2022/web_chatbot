class Dblib # ファイル名とclass名は一緒にする必要がある
  def insert(content) # content をDBに格納するメソッド
    require 'pg'
    begin
      # DB へ接続
      conn = PG::connect(:host => "docker_db",
                        :user => "postgres",
                        :password => "password",
                        :dbname => "myapp_development",
                        :port =>"5432")
      # p "ConnectionSuccess"
    rescue => error
      p "ConnectionError"
      p error
    end

    begin
      sql = "INSERT INTO post (content, created_at, update_date)VALUES('#{content}', current_timestamp, current_timestamp);"
      result = conn.exec(sql)
    ensure
      conn.finish
    end
  end
end
