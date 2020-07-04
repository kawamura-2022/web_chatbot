class Dblib # ファイル名とclass名は一緒にする必要がある
  def connect_db()
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
    return conn
  end

  def insert(content) # content をDBに格納するメソッド
    conn = connect_db()
    begin
      sql = "INSERT INTO post (content, created_at, update_date)VALUES('#{content}', current_timestamp, current_timestamp);"
      result = conn.exec(sql)
    ensure
      conn.finish
    end
  end

  def ai_insert(content) # content をDBに格納するメソッド (AIの発言)
    conn = connect_db()
    begin
      sql = "INSERT INTO ai_post (content, created_at, update_date)VALUES('#{content}', current_timestamp, current_timestamp);"
      result = conn.exec(sql)
    ensure
      conn.finish
    end
  end

  def select_comment() # 叩くと，DBに格納されているAIの最新のコメントが取得できる
    conn = connect_db()
    begin
      sql = "SELECT content FROM ai_post ORDER BY post_id DESC;" # IDの降順で取得つまり最新のAIコメントを取得
      result = conn.exec(sql)
    ensure
      conn.finish
    end
    return result[0]['content']
  end

  def call_extractor(content) # contentを入力すると，エクストラクターAPIを呼び出して，IBISを返す
      require 'net/http'
      require 'uri'
      require 'json'
      # require './app/lib/config'
      # API 呼び出し
      conn = connect_db()
      begin
        sql = "SELECT content FROM private_key WHERE name='extractor_url';"
        result = conn.exec(sql)
      ensure
        conn.finish
      end
      url = result[0]['content']

      lis_content = Array.new([content])
      params = {'input' => lis_content}

      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 5
      http.read_timeout = 125
      req = Net::HTTP::Post.new(uri.path)
      req["Content-Type"] = "application/json"
      req.body = params.to_json # hash --> JSON

      res = http.request(req)
      p res.code, res.msg, res.body

      result = JSON.parse(res.body) # JSON --> hash
      # p result['output'][0]['class']# IBISが出力されるはず
      return result['output'][0]['class'] # "issue" or "idea" or "pros_and_cons"
  end

  def get_aicomment(content)
      ibis = call_extractor(content)
      puts ibis
      if ibis == "issue" then
        return "これはissueですね！"
      elsif ibis == "idea" then
        return "これはideaですね！"
      elsif ibis == "pros_and_cons" then
        return "これはpro/conですね！"
      else
        return "これはなんですか？！"
      end
  end

end
