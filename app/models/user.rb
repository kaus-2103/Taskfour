class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true
    before_create :set_status_to_active
    def update_last_login_time
      update_attribute(:last_login_at, Time.current)
    end
    private

    def set_status_to_active
      self.status = "Active"
  end
end
