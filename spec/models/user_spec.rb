require 'rails_helper'

RSpec.describe User, type: :model do
  context "the from_omniauth" do
    it "should exist" do
      expect(User).to respond_to(:from_omniauth)
    end
  end
end
