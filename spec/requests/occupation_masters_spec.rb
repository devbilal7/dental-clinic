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

RSpec.describe "/occupation_masters", type: :request do
  
  # OccupationMaster. As you add validations to OccupationMaster, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      OccupationMaster.create! valid_attributes
      get occupation_masters_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      occupation_master = OccupationMaster.create! valid_attributes
      get occupation_master_url(occupation_master)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_occupation_master_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      occupation_master = OccupationMaster.create! valid_attributes
      get edit_occupation_master_url(occupation_master)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new OccupationMaster" do
        expect {
          post occupation_masters_url, params: { occupation_master: valid_attributes }
        }.to change(OccupationMaster, :count).by(1)
      end

      it "redirects to the created occupation_master" do
        post occupation_masters_url, params: { occupation_master: valid_attributes }
        expect(response).to redirect_to(occupation_master_url(OccupationMaster.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new OccupationMaster" do
        expect {
          post occupation_masters_url, params: { occupation_master: invalid_attributes }
        }.to change(OccupationMaster, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post occupation_masters_url, params: { occupation_master: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested occupation_master" do
        occupation_master = OccupationMaster.create! valid_attributes
        patch occupation_master_url(occupation_master), params: { occupation_master: new_attributes }
        occupation_master.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the occupation_master" do
        occupation_master = OccupationMaster.create! valid_attributes
        patch occupation_master_url(occupation_master), params: { occupation_master: new_attributes }
        occupation_master.reload
        expect(response).to redirect_to(occupation_master_url(occupation_master))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        occupation_master = OccupationMaster.create! valid_attributes
        patch occupation_master_url(occupation_master), params: { occupation_master: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested occupation_master" do
      occupation_master = OccupationMaster.create! valid_attributes
      expect {
        delete occupation_master_url(occupation_master)
      }.to change(OccupationMaster, :count).by(-1)
    end

    it "redirects to the occupation_masters list" do
      occupation_master = OccupationMaster.create! valid_attributes
      delete occupation_master_url(occupation_master)
      expect(response).to redirect_to(occupation_masters_url)
    end
  end
end
