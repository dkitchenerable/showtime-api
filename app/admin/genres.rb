ActiveAdmin.register Genre do

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name
end
