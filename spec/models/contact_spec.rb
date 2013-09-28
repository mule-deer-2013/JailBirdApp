require 'spec_helper'

describe Contact do

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :phone_number }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone_number }
    it { should validate_uniqueness_of :phone_number }
  end

  context 'associations' do
    it { should belong_to :user }
    it { should have_and_belong_to_many :groups }
  end

  context 'creation' do
    let! (:contact) { FactoryGirl.build(:contact) }

    it "should only allow correctly formatted phone numbers" do
      contact.phone_number = "6789"
      expect{contact.save}.not_to change{Contact.count}.by(1)
    end

    it "should allow correctly formatted phone numbers" do
      expect{contact.save}.to change{Contact.count}.by(1)
    end

    it "should allow editting of phone numbers" do
      contact.save
      contact.phone_number = "0123456789"
      contact.save
      expect(contact.phone_number).to eq "0123456789"
    end

    it "should allow editing of names" do
      contact.save
      contact.name = "elaine"
      contact.save
      expect(contact.name).to eq "elaine"
    end
  end
end
