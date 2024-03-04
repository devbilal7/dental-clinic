require "rails_helper"

RSpec.describe DentistAggregationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dentist_aggregations").to route_to("dentist_aggregations#index")
    end

    it "routes to #new" do
      expect(get: "/dentist_aggregations/new").to route_to("dentist_aggregations#new")
    end

    it "routes to #show" do
      expect(get: "/dentist_aggregations/1").to route_to("dentist_aggregations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dentist_aggregations/1/edit").to route_to("dentist_aggregations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dentist_aggregations").to route_to("dentist_aggregations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dentist_aggregations/1").to route_to("dentist_aggregations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dentist_aggregations/1").to route_to("dentist_aggregations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dentist_aggregations/1").to route_to("dentist_aggregations#destroy", id: "1")
    end
  end
end
