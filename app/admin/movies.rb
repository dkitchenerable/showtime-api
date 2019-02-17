ActiveAdmin.register Movie do

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  filter :title

end
