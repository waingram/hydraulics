class BillingAddress < ActiveRecord::Base
  
  #------------------------------------------------------------------
  # relationships
  #------------------------------------------------------------------
  belongs_to :customer
  belongs_to :agency
  
  #------------------------------------------------------------------
  # validation
  #------------------------------------------------------------------
  validates :customer_id, :agency_id, :uniqueness => true
  validates :last_name, :first_name, :person_name_format => true, :allow_nil => true
  validates :city, :city_format => true, :allow_nil => true
  validates :phone, :phone_format => true, :allow_nil => true
            
  # Validate data that could be coming in from the request form such that < and > are not
  # allowed in the text to prevent cross site scripting.
  validates :organization, :address_1, :address_2, :state, :country, :post_code, :xss => true
  
  # Validating presence of continued association with valid external data
  validates :customer, 
            :presence => {
              :if => 'self.customer_id', 
              :message => "association with this Customer is no longer valid because the Customer object no longer exists."
            }
  validates :agency, 
            :presence => {
              :if => 'self.agency_id', 
              :message => "association with this Agency is no longer valid because the Agency object no longer exists."
            }
  #------------------------------------------------------------------
  # callbacks
  #------------------------------------------------------------------

  #------------------------------------------------------------------
  # public class methods
  #------------------------------------------------------------------

  # Returns a string containing a brief, general description of this
  # class/model.
  def BillingAddress.class_description
    return "Billing Address represents billing information for a Customer or Agency."
  end
  
  #------------------------------------------------------------------
  # public instance methods
  #------------------------------------------------------------------
  

end
