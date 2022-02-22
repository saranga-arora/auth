class ApplicationController < ActionController::Base
    before_action :current_user #before every action, this method will happen:

    def current_user 
        if session["user_id"] #if logged in
            @current_user = User.find(session["user_id"])
        end 
    end 

end
