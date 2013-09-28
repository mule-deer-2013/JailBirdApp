require 'spec_helper'

describe Group do

  context "validation" do
    it { should validate_presence_of :name }
    it { should allow_mass_assignment_of :name }
  end

  context "association" do
    it { should belong_to :user }
    it { should have_and_belong_to_many :contacts }
  end

end