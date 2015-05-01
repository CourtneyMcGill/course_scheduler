require 'rails_helper'

RSpec.describe StudentCoursesController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      s=Student.create!
      get :index, :student_id=>s.id
      expect(response.status).to eq(200)
    end

    it "renders the index template and all courses by default" do
      s=Student.create!
      x, y = Course.create!, Course.create!
      expect(Course).to receive(:all) { [x,y] }
      get :index, :student_id=>s.id
      expect(response).to render_template(:index)
      expect(assigns(:courses)).to match_array([x,y])
    end
  end

  describe "add student to a course" do
    it "should show success flash message and redirect to index on success" do
      s=Student.create!
      c=Course.create!
      expect(Student).to receive(:find){s}
      expect(Course).to receive(:find){c}
      expect(s.courses).to receive(:<<).with(c)
      post :create, {:student_id=>s.id,:course_id=>c.id}
      expect(response).to redirect_to(student_courses_path)
    end
  end

  describe "remove student from course" do
    it "should delete association and redirect to same page" do
      s=Student.create!
      c=Course.create!
      expect(Student).to receive(:find).with("1"){s}
      expect(Course).to receive(:find).with("1"){c}
      expect(s.courses).to receive(:delete).with(c){c}
      @request.env['HTTP_REFERER']='/'
      delete :destroy, {:student_id=>s.id,:id=>c.id}
      expect(response).to redirect_to('/')
    end
  end
end
