require 'rails_helper'

RSpec.describe ApplicationPolicy do
  subject { ApplicationPolicy.new(current_user, post) }
  let(:post) { create(:post) }
  context 'by default' do
    let(:current_user) { nil }
    it { should permit_action(:index) }
    it { should permit_action(:show) }
    it { should forbid_action(:new) }
    it { should forbid_action(:create) }
    it { should forbid_action(:destroy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:update) }
  end

end
