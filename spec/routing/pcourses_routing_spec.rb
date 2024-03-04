require "rails_helper"

RSpec.describe PcoursesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pcourses").to route_to("pcourses#index")
    end

    it "routes to #new" do
      expect(get: "/pcourses/new").to route_to("pcourses#new")
    end

    it "routes to #show" do
      expect(get: "/pcourses/1").to route_to("pcourses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pcourses/1/edit").to route_to("pcourses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pcourses").to route_to("pcourses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pcourses/1").to route_to("pcourses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pcourses/1").to route_to("pcourses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pcourses/1").to route_to("pcourses#destroy", id: "1")
    end
  end
end
