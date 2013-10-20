require 'spec_helper'

describe UsersController do
  describe "GET 'show'" do
    render_views

    let!(:user) do
      User.create(
        name: 'Billy',
        twitter_account: 'billy'
      )
    end

    it 'returns http success' do
      get 'show', id: user.id

      expect(response).to be_success
    end

    it 'loads the user' do
      get 'show', id: user.id

      expect(assigns(:user)).to eq user
    end

    it 'renders the show template' do
      get 'show', id: user.id

      expect(response).to render_template('show')
    end

    it 'throws exception whe user is not found' do
      expect { get 'show', id: 'blablabla' }
        .to raise_error ActiveRecord::RecordNotFound
    end
  end
end
