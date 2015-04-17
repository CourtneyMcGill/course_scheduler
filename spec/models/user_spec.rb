require 'rails_helper'

@request.env["devise.mapping"] = Devise.mappings[:user]
RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
