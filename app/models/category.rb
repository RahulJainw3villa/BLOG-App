class Category < ApplicationRecord
    has_many :blogs 
    # validates :attribute, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
    
    validates :category, uniqueness: true
end
