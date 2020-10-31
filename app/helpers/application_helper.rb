module ApplicationHelper
    include SessionsHelper

    def navigation
        out = []
        if current_user
            out << link_to(current_user.name, user_path(current_user), class: "nav-link text-white")
            out << link_to("Log out", logout_path, method: :delete, class: "nav-link text-white")
            out << link_to("Delete my account", user_path(current_user), method: :delete, data: { confirm: 'Are you sure?' },class: "nav-link text-danger")
        else
            out << link_to("Login", login_path, class: "nav-link text-white")
            out << link_to("Sign up", sign_up_path, class: "nav-link text-white")
        end
        out.join().html_safe
    end

    def require_user
        if current_user.nil?
            redirect_to login_path
            flash[:danger] = "Please log in first!"
        end
    end

    def charge_params
        params.require(:charge).permit(:name, :amount)
    end

    def group_params
        params.require(:group).permit(:name, :image)
    end

    def groups_params
        params.require(:charge).permit(:group_id)
    end

    def external
        charges = []
        current_user.charges.each do |charge|
            if charge.groups.empty?
                charges << charge
            end
        end
        charges
    end

    def total
        t = 0
        current_user.charges.each do |c|
            t += c.amount
        end
        t
    end

    def total_ex
        tx = 0
        external.each do |x|
            tx += x.amount
        end
        tx
    end

    def total_g(group)
        g = 0
        group.charges.each do |x|
            g += x.amount
        end
        g
    end

    def first_assign(groups, charge)
        if !groups.empty? && charge.groups.first.image.exists?
            image_tag groups.first.image.url, class: "rounded-circle"
        end
    end
end
