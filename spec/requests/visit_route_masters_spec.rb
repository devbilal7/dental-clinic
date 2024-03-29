require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/visit_route_masters", type: :request do
  
  # VisitRouteMaster. As you add validations to VisitRouteMaster, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      VisitRouteMaster.create! valid_attributes
      get visit_route_masters_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      visit_route_master = VisitRouteMaster.create! valid_attributes
      get visit_route_master_url(visit_route_master)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_visit_route_master_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      visit_route_master = VisitRouteMaster.create! valid_attributes
      get edit_visit_route_master_url(visit_route_master)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new VisitRouteMaster" do
        expect {
          post visit_route_masters_url, params: { visit_route_master: valid_attributes }
        }.to change(VisitRouteMaster, :count).by(1)
      end

      it "redirects to the created visit_route_master" do
        post visit_route_masters_url, params: { visit_route_master: valid_attributes }
        expect(response).to redirect_to(visit_route_master_url(VisitRouteMaster.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new VisitRouteMaster" do
        expect {
          post visit_route_masters_url, params: { visit_route_master: invalid_attributes }
        }.to change(VisitRouteMaster, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post visit_route_masters_url, params: { visit_route_master: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested visit_route_master" do
        visit_route_master = VisitRouteMaster.create! valid_attributes
        patch visit_route_master_url(visit_route_master), params: { visit_route_master: new_attributes }
        visit_route_master.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the visit_route_master" do
        visit_route_master = VisitRouteMaster.create! valid_attributes
        patch visit_route_master_url(visit_route_master), params: { visit_route_master: new_attributes }
        visit_route_master.reload
        expect(response).to redirect_to(visit_route_master_url(visit_route_master))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        visit_route_master = VisitRouteMaster.create! valid_attributes
        patch visit_route_master_url(visit_route_master), params: { visit_route_master: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested visit_route_master" do
      visit_route_master = VisitRouteMaster.create! valid_attributes
      expect {
        delete visit_route_master_url(visit_route_master)
      }.to change(VisitRouteMaster, :count).by(-1)
    end

    it "redirects to the visit_route_masters list" do
      visit_route_master = VisitRouteMaster.create! valid_attributes
      delete visit_route_master_url(visit_route_master)
      expect(response).to redirect_to(visit_route_masters_url)
    end
  end
end
