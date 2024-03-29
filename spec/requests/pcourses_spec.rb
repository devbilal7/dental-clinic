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

RSpec.describe "/pcourses", type: :request do
  
  # Pcourse. As you add validations to Pcourse, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Pcourse.create! valid_attributes
      get pcourses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pcourse = Pcourse.create! valid_attributes
      get pcourse_url(pcourse)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pcourse_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      pcourse = Pcourse.create! valid_attributes
      get edit_pcourse_url(pcourse)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pcourse" do
        expect {
          post pcourses_url, params: { pcourse: valid_attributes }
        }.to change(Pcourse, :count).by(1)
      end

      it "redirects to the created pcourse" do
        post pcourses_url, params: { pcourse: valid_attributes }
        expect(response).to redirect_to(pcourse_url(Pcourse.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pcourse" do
        expect {
          post pcourses_url, params: { pcourse: invalid_attributes }
        }.to change(Pcourse, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pcourses_url, params: { pcourse: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested pcourse" do
        pcourse = Pcourse.create! valid_attributes
        patch pcourse_url(pcourse), params: { pcourse: new_attributes }
        pcourse.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the pcourse" do
        pcourse = Pcourse.create! valid_attributes
        patch pcourse_url(pcourse), params: { pcourse: new_attributes }
        pcourse.reload
        expect(response).to redirect_to(pcourse_url(pcourse))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        pcourse = Pcourse.create! valid_attributes
        patch pcourse_url(pcourse), params: { pcourse: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pcourse" do
      pcourse = Pcourse.create! valid_attributes
      expect {
        delete pcourse_url(pcourse)
      }.to change(Pcourse, :count).by(-1)
    end

    it "redirects to the pcourses list" do
      pcourse = Pcourse.create! valid_attributes
      delete pcourse_url(pcourse)
      expect(response).to redirect_to(pcourses_url)
    end
  end
end
