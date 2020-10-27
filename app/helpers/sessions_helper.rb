module SessionsHelper

    def navigation
        out = []
        if current_user
            out << link_to(current_user.name, user_path(current_user), class: "nav-link text-white")
            out << link_to("Log out", logout_path, method: :delete, class: "nav-link text-white")
        else
            out << link_to("Log In", login_path, class: "nav-link text-white")
            out << link_to("Sign Up", sign_up_path, class: "nav-link text-white")
        end
        out.join().html_safe
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def log_out
        @current_user = nil
        session[:user_id] = nil
    end
    
    def user_check
        if current_user
            flash[:alert] = "You are already logged in!"
            redirect_to root_path
        end
    end

end
