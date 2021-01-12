class Recipe < ApplicationRecord
    belongs_to :user 
    has_many :reviews 
    has_many :users, through: :reviews 
    has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

	has_many :steps, dependent: :destroy
	accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true


    has_attached_file :recipe_img, styles: { recipe_index: "250x350>", recipe_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :recipe_img, content_type: /\Aimage\/.*\z/

validates :title, presence: true
validates :description, presence: true


end
