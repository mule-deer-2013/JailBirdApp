require 'spec_helper'

describe Group do

  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :contacts }
  it { should allow_mass_assignment_of :name }

  context 'creation' do
    let! (:group) { FactoryGirl.create(:group) }
    let! (:group1) { FactoryGirl.create(:group) }
    let! (:group2) { FactoryGirl.create(:group) }
  end
end
