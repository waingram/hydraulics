class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  # validates :customer_id, :agency_id, :uniqueness => true
  validates :address_1, :country, :city, :presence => true
  validates :last_name, :first_name, :person_name_format => true, :allow_nil => true
  validates :city, :city_format => true, :allow_nil => true
  validates :phone, :phone_format => true, :allow_nil => true
            
  # Validate data that could be coming in from the request form such that < and > are not
  # allowed in the text to prevent cross site scripting.
end