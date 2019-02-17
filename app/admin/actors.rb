ActiveAdmin.register Actor do

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    actions
  end

  filter :first_name
  filter :last_name

end
