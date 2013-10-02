require 'spec_helper'

describe User do

	context 'associations' do
		it { should have_many :contacts }
		it { should have_many :groups }
	end

	context 'attribute accessible' do
		it { should allow_mass_assignment_of :email }
		it { should allow_mass_assignment_of :password_confirmation }
		it { should allow_mass_assignment_of :password }
		it { should allow_mass_assignment_of :uid }
		it { should allow_mass_assignment_of :provider }
	end
	
end