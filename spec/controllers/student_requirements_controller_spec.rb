require 'rails_helper'

RSpec.describe StudentRequirementsController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      s=Student.create!
      get :index, :student_id=>s.id
      expect(response.status).to eq(200)
    end

    it "renders the index template and all requirements by default" do
      s=Student.create!
      x, y = Requirement.create!, Requirement.create!
      expect(Requirement).to receive(:all) { [x,y] }
      get :index, :student_id=>s.id
      expect(response).to render_template(:index)
      expect(assigns(:requirements)).to match_array([x,y])
    end
  end

  describe "add student to a course" do
    it "should show success flash message and redirect to index on success" do
      s=Student.create!
      r=Requirement.create!
      expect(Student).to receive(:find){s}
      expect(Requirement).to receive(:find){r}
      expect(s.requirements).to receive(:<<).with(r)
      post :create, {:student_id=>s.id,:requirement_id=>r.id}
      expect(response).to redirect_to(student_requirements_path)
    end
  end

  describe "remove student from requirement" do
    it "should delete association and redirect to same page" do
      s=Student.create!
      r=Requirement.create!
      expect(Student).to receive(:find).with("1"){s}
      expect(Requirement).to receive(:find).with("1"){r}
      expect(s.requirements).to receive(:delete).with(r){r}
      @request.env['HTTP_REFERER']='/'
      delete :destroy, {:student_id=>s.id,:id=>r.id}
      expect(response).to redirect_to('/')
    end
  end
end
