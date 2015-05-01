require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template and sorts by name by default" do
      x, y = Course.create!, Course.create!
      expect(Course).to receive(:sorted_by).with("name") { [x,y] }
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:courses)).to match_array([x,y])
    end
  end

  describe "GET #show" do
    it "routes correctly" do
      expect(Course).to receive(:find).with("1") { p }
      get :show, id: 1
      c = Course.new
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(Course).to receive(:find).with("1") { p }
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "routes correctly" do
      expect(Course).to receive(:find).with("1"){ p }
      get :edit, id: 1
      c = Course.new
      expect(response.status).to eq(200)
    end

    it "renders the edit template" do
      expect(Course).to receive(:find).with("1"){ p }
      get :edit, id: 1
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #new" do
    it "routes correctly" do
      expect(Course).to receive(:new)
      get :new
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      expect(Course).to receive(:new)
      get :new
      expect(response).to render_template(:new)
    end
  end



  describe "create new course" do
    it "should show failure flash message and redirect to new on failure" do
      c=Course.new
      expect(Course).to receive(:new).and_return(c)
      expect(c).to receive(:save).and_return(nil)
      post :create, {:course=>{"crn"=>"10111","course_name"=>"COSC_480","title"=>"Cloud Computing","instructor"=>"Sommers","days"=>"MWF","starts"=>"120","ends"=>235,"building_room"=>"Lawrence 105","credits"=>"1.0"}}
      expect(response).to redirect_to(new_course_path)
    end

    it "should show success flash message and redirect to index on success" do
      c=Course.new
      expect(Course).to receive(:new).and_return(c)
      expect(c).to receive(:save).and_return(true)
      post :create, {:course=>{"crn"=>"10111","course_name"=>"COSC_480","title"=>"Cloud Computing","instructor"=>"Sommers","days"=>"MWF","starts"=>"120","ends"=>235,"building_room"=>"Lawrence 105","credits"=>"1.0"}}
      expect(response).to redirect_to(courses_path)
    end
  end

  describe "update course" do
    it "should show success flash message and show on success" do
      r=Course.create!
      expect(Course).to receive(:find).with("1"){r}
      expect(r).to receive(:update){r}
      put :update, {id:1,:course=>{"crn"=>"10112"}}
      expect(response).to redirect_to(course_path)
    end
  end

 describe "delete course" do
    it "should delete and redirect" do
      c=Course.new
      expect(Course).to receive(:find).with("1"){c}
      expect(c).to receive(:destroy){c}
      delete :destroy, id:1
      expect(response).to redirect_to(courses_path)
    end
  end
end
