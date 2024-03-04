require "rails_helper"

RSpec.describe OccupationMastersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/occupation_masters").to route_to("occupation_masters#index")
    end

    it "routes to #new" do
      expect(get: "/occupation_masters/new").to route_to("occupation_masters#new")
    end

    it "routes to #show" do
      expect(get: "/occupation_masters/1").to route_to("occupation_masters#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/occupation_masters/1/edit").to route_to("occupation_masters#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/occupation_masters").to route_to("occupation_masters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/occupation_masters/1").to route_to("occupation_masters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/occupation_masters/1").to route_to("occupation_masters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/occupation_masters/1").to route_to("occupation_masters#destroy", id: "1")
    end
  end
end
