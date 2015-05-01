require 'rails_helper'

RSpec.describe Requirement, type: :model do
  context "the sorted_by method" do
    it "should exist" do
      expect(Requirement).to respond_to(:sorted_by)
    end
    it "should call the right underlying ActiveRecord method to sort" do
      expect(Requirement).to receive(:order).with("name")
      Requirement.sorted_by("name")
    end
  end

  context "the search method" do
    it "should exist" do
      expect(Requirement).to respond_to(:search)
    end
    it "should call the right underlying ActiveRecord method to search" do
      expect(Requirement).to receive(:where).with("name like ?","%Math%"){}
      Requirement.search("Math")
    end
  end
end

