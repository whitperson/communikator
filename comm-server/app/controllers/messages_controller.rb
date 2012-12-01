class MessagesController < ApplicationController
  before_filter :allow_cross_origin_access

  def index
  end

  def create
    msg_type = params[:msg_type]
    to = params[:to]
    msg_text = params[:msg_text]

    case params[:msg_type]
    when 'text'
      from_phone = "+19177467506"
      client = Twilio::REST::Client.new(TW_SID, TW_TOK)
      client.account.sms.messages.create({:from => from_phone, :to => to, :body => msg_text })
    when 'email'
      Emails.email(to, msg_text).deliver
    when 'twitter'
      Twitter.update("#{to} #{msg_text}")
    end

    render :json => params
  end

  # respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @messages }
  # end

  private
    def allow_cross_origin_access
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    end # this last line allows anyone to post, get, etc.... allowed us to post/get pirate names
end

