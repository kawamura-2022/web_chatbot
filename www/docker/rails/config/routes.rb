Rails.application.routes.draw do
  get "/" => "home#top"
  post "/home/create" => "home#create"
  get "/rails_db" => "home#rails_db"
end
