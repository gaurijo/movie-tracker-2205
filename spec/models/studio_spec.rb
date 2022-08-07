require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many :movies }
    it { should have_many(:movie_actors).through(:movies) }
    it { should have_many(:actors).through(:movie_actors) }
  end
end