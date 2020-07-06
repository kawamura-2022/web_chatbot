require "Dblib.rb"
class HomeController < ApplicationController
  def top

  end

  def create
    @user_comment = params[:content] # (str) : userの投稿コメントを受け取る
    dblib = Dblib.new() # DBを扱うクラス，DBへ接続
    dblib.insert(@user_comment) # ユーザーのコメントをDBへ格納
    @ai_comment = dblib.get_aicomment(@user_comment) # (str) : ibis判定 -> コメント選択
    dblib.ai_insert(@ai_comment) # AIのコメントをDBへ格納
    dblib.db_close() # DBの接続を終了させる
    redirect_to("/")
  end

  def rails_db
    user_comment = params[:comment]
    dblib = Dblib.new() # DBを扱うクラス，DBへ接続
    dblib.insert(user_comment) # ユーザーのコメントをDBへ格納
    ai_comment = dblib.get_aicomment(user_comment) # (str) : ibis判定 -> コメント選択
    dblib.ai_insert(ai_comment) # AIのコメントをDBへ格納
    dblib.db_close() # DBの接続を終了させる
    render json: {"ai_comment" => ai_comment}
  end

end
