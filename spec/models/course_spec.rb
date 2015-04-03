require 'rails_helper'

RSpec.describe Course, type: :model do
  context "the sorted_by method" do
    it "should exist" do
      expect(Course).to respond_to(:sorted_by)
    end

    it "should call the right underlying ActiveRecord method to sort"
      expect(Course).to receive(:order).with("course_name")
      Course.sorted_by("course_name")
    end

    it "should sort by name if a bad column name is given"
      expect(Course).to receive(:order).with("course_name")
      Course.sorted_by("asdfasdfasdf")
    end
end
