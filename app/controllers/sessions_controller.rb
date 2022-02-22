class SessionsController < ApplicationController

    def new 
    end 

    def create
        entered_email = params["email"]
        entered_password = params["password"] 
        
        #check if there is user with that email in database
        @user = User.find_by({email: entered_email}) #expecting just one value
        
        #now, if email matches, check the password
        if @user
            if BCrypt::Password.new(@user.password) == entered_password
                session["user_id"] = @user.id
                flash[:notice] = "Welcome!"
                redirect_to "/companies" #send to companies if password matches
            else 
                flash[:notice] = "Password is incorrect."
                redirect_to "/sessions/new" #send back to login page if password doesn't match
            end
        else 
            flash[:notice] = "No user with that email address."
            redirect_to "/sessions/new" #send back to login page if no email in database
        end 
    end

    def destroy
        session["user_id"] = nil
        flash[:notice] = "You have been logged out"
        redirect_to "/sessions/new"
    end 


end
