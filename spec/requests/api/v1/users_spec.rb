require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get api_v1_users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:user_params) { { user: attributes_for(:user) } }

    it "creates a new user" do
      expect {
        post api_v1_users_path, params: user_params
      }.to change(User, :count).by(1)
    end

    it "returns http created" do
      post api_v1_users_path, params: user_params
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /show" do
    let(:user) { create(:user) }

    it "returns http success" do
      get api_v1_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /update" do
    let(:user) { create(:user) }
    let(:new_attributes) { { user: { name: "New Name" } } }

    it "updates the requested user" do
      put api_v1_user_path(user), params: new_attributes
      user.reload
      expect(user.name).to eq("New Name")
    end

    it "returns http success" do
      put api_v1_user_path(user), params: new_attributes
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    let!(:user) { create(:user) }

    it "destroys the requested user" do
      expect {
        delete api_v1_user_path(user)
      }.to change(User, :count).by(-1)
    end

    it "returns http no content" do
      delete api_v1_user_path(user)
      expect(response).to have_http_status(:no_content)
    end
  end
end
