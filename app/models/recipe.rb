class Recipe < ApplicationRecord
    belongs_to :user 


    has_attached_file :recipe_img, styles: { recipe_index: "250x350>", recipe_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :recipe_img, content_type: /\Aimage\/.*\z/
end
