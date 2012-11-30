class MessagesController < ApplicationController
  protect_from_forgery :except => :send_message

  before_filter :allow_cross_origin_access

  def index
  end

  def messages
    # if msg_type == text
      from_phone = "+19177467506"
      to = params[to]
      msg_text = params[msg_text]
      client = Twilio::REST::Client.new(TW_SID, TW_TOK)
      @message = client.account.sms.messages.create({:from => from_phone, :to => to, :body => msg_text })
    # elsif msg_type == email

    # else msg_type == twitter

    # end
  end

  # respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @messages }
  # end

  private
    def allow_cross_origin_access
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Origin'] = 'POST, GET, OPTIONS'
    end # this last line allows anyone to post, get, etc.... allowed us to post/get pirate names
end