require 'rails_helper'

describe Api::V1::ListsController, type: :controller do
  describe "get index" do
    before do
      @user = User.create(email: 'a@a.com', password: '12345678')
      @user.lists.create(title: 'Title')
    end

    it 'respond with success' do
      get :index, user_id: @user.id
      expect(response).to be_success
    end

    it "returns a list of a user's lists" do
      get :index, user_id: @user.id
      expect(JSON.parse(response.body).first['title']).to eq(@user.lists.first.title)
    end
  end


  describe "post create" do
    context 'for an existing user' do
      let(:user){ User.create(email: 'a@a.com', password: '12345678') }

      it 'creates a list for the user' do
        expect do
          post :create, user_id: user.id, list: {title: 'whatever'}
        end.to change(user.lists, :count).by(1)
      end
    end
  end


end
