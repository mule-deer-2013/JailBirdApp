require_relative '../spec_helper'

describe Contact do

  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone_number }

  context 'creation' do 
    let! (:contact) { FactoryGirl.build(:contact) }

    it "should only allow correctly formatted phone numbers" do 
      contact.phone_number = "6789"
      expect{contact.save}.not_to change{Contact.count}.by(1)
    end

    it "should allow correctly formatted phone numbers" do 
      p contact.phone_number
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
