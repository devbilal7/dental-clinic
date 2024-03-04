require "rails_helper"

RSpec.describe ContractTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contract_types").to route_to("contract_types#index")
    end

    it "routes to #new" do
      expect(get: "/contract_types/new").to route_to("contract_types#new")
    end

    it "routes to #show" do
      expect(get: "/contract_types/1").to route_to("contract_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/contract_types/1/edit").to route_to("contract_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contract_types").to route_to("contract_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contract_types/1").to route_to("contract_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contract_types/1").to route_to("contract_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contract_types/1").to route_to("contract_types#destroy", id: "1")
    end
  end
end
