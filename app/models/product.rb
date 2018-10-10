class Product < ApplicationRecord
    has_and_belongs_to_many :types, :join_table => "products_types"
    mount_uploader :image_url, ImageUploader
    validates_processing_of :image_url

    private
    def image_size_validation
        errors[:image_url] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
    IMAGE_ONLINE_LINK = "http"

    #scope
    scope :newest, -> {order(updated_at: :desc)}
    
end
