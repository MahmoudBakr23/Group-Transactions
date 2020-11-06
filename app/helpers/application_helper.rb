module ApplicationHelper
  include SessionsHelper

  def navigation
    out = []
    if current_user
      out << link_to(current_user.name, user_path(current_user), class: 'nav-link text-white')
      out << link_to('Log out', logout_path, method: :delete, class: 'nav-link text-white')
      out << link_to('Delete my account', user_path(current_user), method: :delete, data: { confirm: 'Are you sure?' }, class: 'nav-link text-danger')
    else
      out << link_to('Login', login_path, class: 'nav-link text-white')
      out << link_to('Sign up', sign_up_path, class: 'nav-link text-white')
    end
    out.join.html_safe
  end

  def require_user
    if current_user.nil?
      redirect_to login_path
      flash[:danger] = 'Please log in first!'
    end
  end

  def groups_params
    params.require(:charge).permit(:group_id)
  end

  def external
    charges = []
    current_user.charges.each do |charge|
      charges << charge if charge.groups.empty?
    end
    charges
  end

  def total
    current_user.charges.sum { |c| c.amount }
  end

  def total_ex
    external.sum { |ex| ex.amount }
  end

  def total_g(group)
    group.charges.sum { |gc| gc.amount }
  end

  def first_assign(groups, charge)
    image_tag groups.first.image.url, class: 'rounded-circle' if !groups.empty? && charge.groups.first.image.exists?
  end

  def authorized_user(user, obj)
    output = []
    if user.groups.include?(obj)
      output << link_to('Update', edit_group_path(obj), class: 'btn btn-primary mr-2')
      output << link_to('Delete', group_path(obj), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger')
    elsif user.charges.include?(obj)
      output << link_to('Update', edit_charge_path(obj), class: 'btn btn-primary mr-2')
      output << link_to('Delete', charge_path(obj), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger')
    end
    output.join.html_safe
  end

  def external_mark(charge)
    if external.include?(charge)
      link_to("#{charge.name} (external)", charge_path(charge), class: 'text-secondary')
    else
      link_to(charge.name, charge_path(charge), class: 'text-secondary')
    end
  end
end
