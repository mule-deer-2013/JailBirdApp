require 'spec_helper'

describe User do

  it { should allow_mass_assignment_of :username }
  it { should allow_mass_assignment_of :email }
  it { should_not allow_mass_assignment_of :password }

	context 'validations' do
		it { should validate_presence_of :email }
		it { should validate_presence_of :username }
		it { should validate_presence_of :password }
		it { should validate_uniqueness_of :email }
	end

  context 'associations' do
    it { should have_many :contacts }
    it { should have_many :groups }
  end

end
