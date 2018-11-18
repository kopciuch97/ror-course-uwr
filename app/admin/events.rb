ActiveAdmin.register Event do
  permit_params :name, :content, :city, :date, :status, :image

  form partial: 'form'

  show do
    attributes_table do
      row :name
      row :city
      row :content
      row :date
      row :image do |ad|
        if ad.image.attached?
          image_tag url_for(ad.image)
        end
      end
    end
  end
end
