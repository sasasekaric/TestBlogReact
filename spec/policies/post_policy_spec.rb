require 'rails_helper'

RSpec.describe PostPolicy do
  subject { PostPolicy.new(current_user, post) }

  let(:user) { create(:user) }
  let(:post) { create(:post, title: 'Some title', user: user) }

  context "as a visitor" do
    let(:current_user) { nil }

    it { should permit_action(:index) }
    it { should permit_action(:show) }
    it { should permit_action(:new) }
    it { should permit_action(:create) }
    it { should forbid_action(:destroy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:update) }

  end

  context "as loged in user with own post" do
    let(:current_user) { user }

    it { should permit_action(:index) }
    it { should permit_action(:new) }
    it { should permit_action(:destroy) }
    it { should permit_action(:edit) }
    it { should permit_action(:show) }
    it { should permit_action(:create) }
    it { should permit_action(:update) }

  end

  context "as loged in user with other post" do
    let(:current_user) { create(:user) }

    it { should forbid_action(:destroy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:update) }

  end

  context "as loged in user with featured post" do
    let(:post) { create(:post, title: 'Title', user: user, featured: true) }
    let(:current_user) { user }

    it { should forbid_action(:destroy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:update) }

  end

end
