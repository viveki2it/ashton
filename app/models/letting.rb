class Letting < ActiveRecord::Base
  has_many :photos, :as => :imageable
  
  scope :location, ->(loc) {
    unless loc.blank?
      where(:town => loc) 
    end
  }
  scope :status, ->(sts) {
    unless sts.blank?
      where(:publish_as => sts) 
    end
  }
  scope :property, ->(ty) {
    unless ty.blank?
      where(:property_catogery => ty) 
    end
  }
 
  scope :rooms, ->(room) {
    unless room.blank?
      where(:bedroom_count => room) 
    end
  }
  scope :price, ->(min, max) {
    unless min.blank? and max.blank?
      where("price BETWEEN ? AND ?", min, max)
    end
  }
end
