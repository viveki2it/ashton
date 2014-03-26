class Letting < ActiveRecord::Base
  has_many :photos, :as => :imageable
end
