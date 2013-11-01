require 'spec_helper'

describe Group do

	context "mass assignment" do
		it { should allow_mass_assignment_of :name }
	end

  context "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :user_id }
    it { should validate_uniqueness_of(:favorite).scoped_to(:user_id) }
  end

  context "association" do
    it { should belong_to :user }
    it { should have_many(:contacts).through(:contacts_group) }
  end

end