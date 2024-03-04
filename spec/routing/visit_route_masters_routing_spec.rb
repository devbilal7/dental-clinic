require "rails_helper"

RSpec.describe VisitRouteMastersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/visit_route_masters").to route_to("visit_route_masters#index")
    end

    it "routes to #new" do
      expect(get: "/visit_route_masters/new").to route_to("visit_route_masters#new")
    end

    it "routes to #show" do
      expect(get: "/visit_route_masters/1").to route_to("visit_route_masters#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/visit_route_masters/1/edit").to route_to("visit_route_masters#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/visit_route_masters").to route_to("visit_route_masters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/visit_route_masters/1").to route_to("visit_route_masters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/visit_route_masters/1").to route_to("visit_route_masters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/visit_route_masters/1").to route_to("visit_route_masters#destroy", id: "1")
    end
  end
end
