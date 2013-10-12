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
		it { should allow_mass_assignment_of :remember_me }
		it { should allow_mass_assignment_of :phone_number }
		it { should allow_mass_assignment_of :jailbird_pin }
	end

	context 'validations' do
		it { should validate_uniqueness_of :phone_number }
		it { should ensure_length_of(:jailbird_pin).is_equal_to(4) }
		it { should_not allow_value("5555555").for(:phone_number) }
		it { should allow_value("19098638577").for(:phone_number) }
	end
	
end