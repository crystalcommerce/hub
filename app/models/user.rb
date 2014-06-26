class User
  include Virtus.model(strict: true)

  attribute :id, Integer
  attribute :name, String
  attribute :email, String

  def crystalcommerce_email?
    email.end_with?("@crystalcommerce.com")
  end
end
