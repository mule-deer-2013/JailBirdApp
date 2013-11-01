require 'spec_helper'

describe Contact do

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :phone_number }
  it { should allow_mass_assignment_of :user_id }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone_number }
    it { should validate_uniqueness_of(:phone_number).case_insensitive }
    it { should_not allow_value("5555555").for(:phone_number) }
    it { should allow_value("19098638577").for(:phone_number) }
  end

  context 'associations' do
    it { should belong_to :user }
    it { should have_many(:groups).through(:contacts_groups) }
  end

  context 'creation' do
    let!(:contact) { FactoryGirl.build(:contact) }

    it "should not allow incorrectly formatted phone numbers" do
      contact.phone_number = "6789"
      expect{contact.save}.not_to change{Contact.count}
    end

    it "should allow correctly formatted phone numbers" do
      contact.phone_number = "19283747677"
      expect{contact.save}.to change{Contact.count}.by(1)
    end

    it "should allow editting of phone numbers" do
      contact.save
      contact.phone_number = "207-841-4568"
      contact.save
      expect(contact.phone_number).to eq "+12078414568"
    end

    it "should allow editing of names" do
      contact.save
      contact.name = "elaine"
      contact.save
      expect(contact.name).to eq "elaine"
    end
  end
end
