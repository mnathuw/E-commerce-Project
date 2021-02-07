class CallbackController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: params["hub.challenge"] if params["hub.verify_token"] == "asd"
  end

  def received_data
    therequest = request.body.read
    data = JSON.parse(therequest)
    enteries = data["entry"]
    enteries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging["sender"]["id"]
        text = messaging["sender"]["text"]
        myjson = {
          "recipient": {
            "id": sender.to_s
          },
          "message":   {
            "text": "hello, world!"
          }
        }
        puts HTTP.post(url, json: myjson)
      end
    end
    render "received_data"
  end

  def url
    "https://graph.facebook.com/v9.0/me/messages?access_token=EAAFW5QO8BjMBAM35jZAyDcDPK1sS3ZA6NagrA7zTOvJJQi60bfBZCuI9Hk0ZB1rZByZBUerk0OQFeumFLVJXv44yaF8eBUYkIS6mRZBekNZAY72JTHQUaYqzW6xFZAKthfiEiEZCeZCl100lTWFeZCtHrtZArVlGY23kIImFfL0GJQDjffQZDZD"
  end
end
