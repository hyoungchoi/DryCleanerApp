class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :drycleaner
  has_many :items
end
