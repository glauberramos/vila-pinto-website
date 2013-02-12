ActiveAdmin.register Project do
  actions  :index, :destroy, :edit, :update, :new, :create
  config.clear_sidebar_sections! # remove filter sidebar
  config.paginate = false

  scope :children_and_teenagers, :default => true
  scope :community

  index :download_links => false do
    column :name
    column :category do |project|
      translate_category(project.category)
    end
    column :visible do |project|
      t(project.visible)
    end
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :category, :as => :select, :collection => project_category_options
      f.input :visible
      f.input :description
    end
    f.actions
  end
end