require 'rails_helper'

RSpec.describe Student, type: :model do
  context "the sorted_by method" do
    it "should exist" do
      expect(Student).to respond_to(:sorted_by)
    end
    it "should call the right underlying ActiveRecord method to sort" do
      expect(Student).to receive(:order).with("LOWER(first)")
      Student.sorted_by("first")
    end
    it "should sort by name if a bad column name is given" do
      expect(Student).to receive(:order).with("LOWER(last)")
      Student.sorted_by("asdfasdfasdf")
    end
  end

  context "the search method" do
    it "should exist" do
      expect(Student).to respond_to(:search)
    end
    it "should call the right underlying ActiveRecord method to search" do
      expect(Student).to receive(:where).with("sid like ?","%1%"){}
      Student.search("1")
    end
  end
end
