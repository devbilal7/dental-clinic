require "rails_helper"

RSpec.describe DhAggregationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dh_aggregations").to route_to("dh_aggregations#index")
    end

    it "routes to #new" do
      expect(get: "/dh_aggregations/new").to route_to("dh_aggregations#new")
    end

    it "routes to #show" do
      expect(get: "/dh_aggregations/1").to route_to("dh_aggregations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dh_aggregations/1/edit").to route_to("dh_aggregations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dh_aggregations").to route_to("dh_aggregations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dh_aggregations/1").to route_to("dh_aggregations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dh_aggregations/1").to route_to("dh_aggregations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dh_aggregations/1").to route_to("dh_aggregations#destroy", id: "1")
    end
  end
end
