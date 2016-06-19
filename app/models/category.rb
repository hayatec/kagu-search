class Category < ActiveRecord::Base
    
    validates :browsenode_id , length: { maximum: 20 } , presence: true
    validates :category_name , length: { maximum: 50 } , presence: true
    has_many :items, dependent: :destroy
end
