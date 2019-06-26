require "sinatra"
require "httparty"

get "/" do
  erb :about
end

get "/cookies" do
  erb :cookies
end

get "/muffins" do
  erb :muffins
end

get "/cakes" do
  erb :cakes
end

get "/events" do
  erb :events
end
