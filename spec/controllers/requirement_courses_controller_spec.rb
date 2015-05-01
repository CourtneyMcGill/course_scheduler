require 'rails_helper'

RSpec.describe RequirementCoursesController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      r=Requirement.create!
      get :index, :requirement_id=>r.id
      expect(response.status).to eq(200)
    end

    it "renders the index template and all courses by default" do
      r=Requirement.create!
      x, y = Course.create!, Course.create!
      expect(Course).to receive(:all) { [x,y] }
      get :index, :requirement_id=>r.id
      expect(response).to render_template(:index)
      expect(assigns(:courses)).to match_array([x,y])
    end
  end

  describe "add course to a requirement" do
    it "should show success flash message and redirect to index on success" do
      r=Requirement.create!
      c=Course.create!
      expect(Requirement).to receive(:find){r}
      expect(Course).to receive(:find){c}
      expect(r.courses).to receive(:<<).with(c)
      post :create, {:requirement_id=>r.id,:course_id=>c.id}
      expect(response).to redirect_to(requirement_courses_path)
    end
  end

  describe "remove course from requirement" do
    it "should delete association and redirect to same page" do
      r=Requirement.create!
      c=Course.create!
      expect(Requirement).to receive(:find).with("1"){r}
      expect(Course).to receive(:find).with("1"){c}
      expect(r.courses).to receive(:delete).with(c){c}
      @request.env['HTTP_REFERER']='/'
      delete :destroy, {:requirement_id=>r.id,:id=>c.id}
      expect(response).to redirect_to('/')
    end
  end
end

