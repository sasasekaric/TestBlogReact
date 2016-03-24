require 'rails_helper'

RSpec.describe PostPolicy do
  subject { PostPolicy.new(current_user, post) }
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  context "being a visitor" do
    let(:current_user) { nil }

    it { should permit_action(:index) }
    it { should permit_action(:show) }
    it { should forbid_action(:new) }
    it { should forbid_action(:destroy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:create) }
    it { should forbid_action(:update) }
  end

  # context "being an loged in user" do
  #   let(:current_user) { sign_in(create(:user)) }

  #   it { should permit_action(:index) }
  #   it { should permit_action(:new) }
  #   it { should permit_action(:destroy) }
  #   it { should permit_action(:edit) }
  #   it { should permit_action(:show) }
  #   it { should permit_action(:create) }
  #   it { should permit_action(:update) }
  # end
end
