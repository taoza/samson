require_relative 'hash_kuber_selector'

module SamsonKubernetes
  class Engine < Rails::Engine
  end
end

Samson::Hooks.view :project_tabs_view, 'kubernetes_project/project_tab'
Samson::Hooks.view :admin_menu, 'kubernetes_project/admin_menu'

Samson::Hooks.callback :deploy_group_permitted_params do
  { cluster_deploy_group_attributes: [:id, :kubernetes_cluster_id, :namespace] }
end

Samson::Hooks.callback :edit_deploy_group do |deploy_group|
  deploy_group.build_cluster_deploy_group unless deploy_group.cluster_deploy_group
end

