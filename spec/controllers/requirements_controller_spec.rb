require 'rails_helper'

RSpec.describe RequirementsController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template and sorts by name by default" do
      x, y = Requirement.create!, Requirement.create!
      expect(Requirement).to receive(:sorted_by).with("name") { [x,y] }
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:requirements)).to match_array([x,y])
    end
  end

  describe "GET #show" do
    it "routes correctly" do
      expect(Requirement).to receive(:find).with("1") { p }
      get :show, id: 1
      r = Requirement.new
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(Requirement).to receive(:find).with("1") { p }
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "routes correctly" do
      expect(Requirement).to receive(:find).with("1"){ p }
      get :edit, id: 1
      r = Requirement.new
      expect(response.status).to eq(200)
    end

    it "renders the edit template" do
      expect(Requirement).to receive(:find).with("1"){ p }
      get :edit, id: 1
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #new" do
    it "routes correctly" do
      expect(Requirement).to receive(:new)
      get :new
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      expect(Requirement).to receive(:new)
      get :new
      expect(response).to render_template(:new)
    end
  end



  describe "create new course" do
    it "should show failure flash message and redirect to new on failure" do
      r=Requirement.new
      expect(Requirement).to receive(:new).and_return(r)
      expect(r).to receive(:save).and_return(nil)
      post :create, {:requirement=>{"name"=>"Comp Sci"}}
      expect(response).to redirect_to(new_requirement_path)
    end

    it "should show success flash message and redirect to index on success" do
      r=Requirement.create!
      expect(Requirement).to receive(:new).and_return(r)
      expect(r).to receive(:save).and_return(true)
      post :create, {:requirement=>{"name"=>"Comp Sci"}}
      expect(response).to redirect_to(requirement_courses_path(r))
    end
  end

  describe "update requirement" do
    it "should show success flash message and show on success" do
      r=Requirement.create!
      expect(Requirement).to receive(:find).with("1"){r}
      expect(r).to receive(:update){r}
      put :update, {id:1,:requirement=>{"name"=>"Math"}}
      expect(response).to redirect_to(requirement_path)
    end
  end

  describe "delete requirement" do
    it "should delete and redirect" do
      r=Requirement.new
      expect(Requirement).to receive(:find).with("1"){r}
      expect(r).to receive(:destroy){r}
      delete :destroy, id:1
      expect(response).to redirect_to(requirements_path)
    end
  end
end
