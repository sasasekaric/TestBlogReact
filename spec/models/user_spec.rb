require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user)  {build(:user)}

  it 'should have valid factory' do
    expect(user).to be_valid
  end

  it { should have_many(:posts).dependent(:destroy) }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  it { should validate_presence_of :password }

end
