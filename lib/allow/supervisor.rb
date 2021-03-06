module Allow::Supervisor
  extend self

  @@groups = {
    manage:   [:index, :show, :new, :create, :edit, :update, :destroy],
    see:      [:index, :show],
    view:     [:index, :show]
  }

  def check_permission(user, action, resource = nil, controller_params = nil)
    user.roles_list.any? do |role|
      role.allowed?(user, action, resource, controller_params)
    end
  end

  def groups
    @@groups
  end
end
