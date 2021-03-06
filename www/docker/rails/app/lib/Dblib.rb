class Dblib # ファイル名とclass名は一緒にする必要がある
  def initialize()
    # DB接続
    @conn = connect_db()
  end

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
    sql = "INSERT INTO post (content, created_at, update_date)VALUES('#{content}', current_timestamp, current_timestamp);"
    result = @conn.exec(sql)
  end

  def ai_insert(content) # content をDBに格納するメソッド (AIの発言)
    sql = "INSERT INTO ai_post (content, created_at, update_date)VALUES('#{content}', current_timestamp, current_timestamp);"
    result = @conn.exec(sql)
  end

  def select_comment() # 叩くと，DBに格納されているAIの最新のコメントが取得できる
    sql = "SELECT content FROM ai_post ORDER BY post_id DESC;" # IDの降順で取得つまり最新のAIコメントを取得
    result = @conn.exec(sql)
    return result[0]['content']
  end

  def select_user_comment() # 叩くと，DBに格納されているAIの最新のコメントが取得できる
    sql = "SELECT content FROM post ORDER BY post_id DESC;" # IDの降順で取得つまり最新のAIコメントを取得
    result = @conn.exec(sql)
    return result[0]['content']
  end

  def call_extractor(content) # contentを入力すると，エクストラクターAPIを呼び出して，IBISを返す
      require 'net/http'
      require 'uri'
      require 'json'
      # require './app/lib/config'
      #URL呼び出し
      sql = "SELECT content FROM private_key WHERE name='extractor_url';"
      result = @conn.exec(sql)
      url = result[0]['content']

      lis_content = Array.new([content])
      params = {'input' => lis_content}

      # API 呼び出し
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

  def get_template(ibis)
    sql = "SELECT * FROM comment_template WHERE class='#{ibis}';"
    templates = @conn.exec(sql)
    template = templates[rand(templates.count)]['content'] # classのテンプレートをランダムに取得
    return template
  end

  def get_aicomment(content)
      ibis = call_extractor(content)
      puts ibis # "issue" or "idea" or "pros_and_cons"
      return get_template(ibis)
  end

  def db_close()
    @conn.finish
  end

end
