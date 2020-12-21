class User < ApplicationRecord
    has_many :projects, dependent: :destroy
    before_save :downcase_email
    
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true    
     has_secure_password
     validates :password, presence: true
     
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    def feed
        Project.where("user_id = ?", id )
    end 
    
    private
    
        def downcase_email
            self.email.downcase
        end 
    
end