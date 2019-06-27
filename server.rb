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
  @pub_key = 'A3VSYKHFVVD6KPRIT4VF'
  event = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=baking&token=#{@pub_key}")
  JSON.parse(event)
  @events = event['events']

  @events.take(9).each do |i|
    [i]['name']['text']
    [i]['description']['text']
    [i]['url']
    [i]['start']['timezone']
    [i]['start']['local']
    [i]['logo']
  end


  erb :events
end
