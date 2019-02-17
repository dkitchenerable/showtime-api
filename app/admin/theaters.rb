ActiveAdmin.register Theater do

  index do
    selectable_column
    id_column
    column :name
    column :zipcode
    actions
  end

  filter :name
  filter :zipcode

end
