require "sinatra"
require "httparty"
require "./mailer.rb"
require "action_mailer"

def send_email(rec)
  Newsletter.email(rec).deliver_now
end

get "/results" do
  @email = params[:search]
  send_email(@email)
  erb :results
end

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
  event = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=baking&token=#{@pub_key}", format: :plain)
  event_hash = JSON.parse event, symbolize_names: true
  events = event_hash.dig(:events)

  eventName = []
  eventDesc = []
  eventDate = []
  eventTime = []
  eventImage = []

  1..9.times do |i|
    event_api = events[i]
    eventName << event_api.dig(:name, :text)
    eventDesc << event_api.dig(:description, :text)
    eventDate << event_api.dig(:start, :timezone)
    eventTime << event_api.dig(:start, :local)
    eventImage << event_api.dig(:logo, :original, :url)

  end

  @event_name = eventName
  @event_desc = eventDesc
  @event_date = eventDate
  @event_time = eventTime
  @event_image = eventImage


  erb :events
end
