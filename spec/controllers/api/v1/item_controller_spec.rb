require 'rails_helper'

describe Api::V1::ItemsController, type: :controller do
  describe "get index" do

    before {
      @user = User.create!(email: 'a@a.com', password: '12345678')
      @list = @user.lists.create!(title: 'Title')
      @item = @list.items.create!(title: 'item title')
    }

    # subject { get :index, list_id: @list.id }

    it 'respond with success' do
      get :index, list_id: @list.id
      expect(response).to be_success
    end

    it "returns a list of a lists items" do
      get :index, list_id: @list.id
      expect(JSON.parse(response.body).first['title']).to eq(@list.items.first.title)
    end
  end


  describe "post create" do
    context 'for an existing user' do
      let(:user){ User.create(email: 'a@a.com', password: '12345678') }
      let(:list) { user.lists.create(title: 'Title')  }

      it 'creates a list for the user' do
        expect do
          post :create, list_id: list.id, item: {title: 'whatever'}
        end.to change(list.items, :count).by(1)
      end
    end
  end


end
