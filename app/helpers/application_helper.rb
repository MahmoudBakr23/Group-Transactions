module ApplicationHelper
    include SessionsHelper
    
    def require_user
        if current_user.nil?
            redirect_to login_path
            flash[:alert] = "Please log in first!"
        end
    end

end
