require "rails_helper"

RSpec.describe ProsthodonticMastersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/prosthodontic_masters").to route_to("prosthodontic_masters#index")
    end

    it "routes to #new" do
      expect(get: "/prosthodontic_masters/new").to route_to("prosthodontic_masters#new")
    end

    it "routes to #show" do
      expect(get: "/prosthodontic_masters/1").to route_to("prosthodontic_masters#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/prosthodontic_masters/1/edit").to route_to("prosthodontic_masters#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/prosthodontic_masters").to route_to("prosthodontic_masters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/prosthodontic_masters/1").to route_to("prosthodontic_masters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/prosthodontic_masters/1").to route_to("prosthodontic_masters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/prosthodontic_masters/1").to route_to("prosthodontic_masters#destroy", id: "1")
    end
  end
end
