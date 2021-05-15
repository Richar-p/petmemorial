require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it { should_not respond_to :new }
  it { should_not respond_to :edit }
  it { should_not respond_to :show }
  it { should_not respond_to :destroy }
  it { should respond_to :index }
  it { should respond_to :create }

  describe 'index' do
    it '#index' do
      get :index
      expect(response).to render_template :index
    end
  end
end
