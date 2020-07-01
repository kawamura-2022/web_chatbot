require "Dblib.rb"
class HomeController < ApplicationController
  def top
  end
  def create
    Dblib.new().insert(params[:content])
    redirect_to("/")
  end

end
