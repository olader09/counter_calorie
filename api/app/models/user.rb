class User < ApplicationRecord
    after_create :create_list
    validates :email, presence: true, uniqueness: { case_sensitive: true }
    has_one :list
    has_secure_password

  
    def self.from_token_request(request)
      email = request.params&.[]('auth')&.[]('email')
      find_by email: email
    end

    protected

    def create_list
      List.create(user_id: id, value_cal: 0)
    end

  end
  