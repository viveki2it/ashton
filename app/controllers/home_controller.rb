class HomeController < ApplicationController
  def index
    
  end
  
  def contact_us
    unless request.get?
      if !params[:fname].to_s.blank? and !params[:email].to_s.blank?
        if AdminMailer.send_contact(params[:fname], params[:email], params[:website], params[:message]).deliver
          flash[:notice] = "Your contact sent successfully."
          params[:fname] = params[:email] = params[:website] = params[:message] = " "
        else
          flash[:error] = "contact sending failed. Please try again."
        end
      else
        flash[:error] = "Name and Email cann't blank. Please try again."
      end
    end
  end
end
