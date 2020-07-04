require "Dblib.rb"
class HomeController < ApplicationController
  def top

  end
  def create
    @user_comment = params[:content] # (str) : userの投稿コメントを受け取る
    dblib = Dblib.new()
    dblib.insert(@user_comment) # DBへ格納
    @ai_comment = dblib.get_aicomment(@user_comment) # (str) : ibis判定 -> コメント選択
    dblib.ai_insert(@ai_comment) # DBへ格納
    redirect_to("/")
  end

end
