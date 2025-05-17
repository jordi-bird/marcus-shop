require 'rails_helper'

RSpec.describe Rule, type: :model do
  describe "associations" do
    it { should belong_to(:source_option).class_name('ItemPartAttributeOption') }
    it { should belong_to(:target_option).class_name('ItemPartAttributeOption').optional }
    #it { should belong_to(:target_part).class_name('ItemPart').optional }
  end

  describe "validations" do
    it { should validate_presence_of(:rule_type) }

    context "when rule_type is price_modifier" do
      subject { build(:rule, rule_type: :price_modifier) }

      it { should validate_presence_of(:value) }
      it { should validate_presence_of(:operation) }
    end
  end

  describe "custom validation: target presence" do
    it "is invalid without target_option" do
      rule = build(:rule, rule_type: :compatibility, target_option: nil)
      expect(rule).not_to be_valid
      expect(rule.errors[:base]).to include("Compatibility/Incompatibility rules require a target_option")
    end
  end
end