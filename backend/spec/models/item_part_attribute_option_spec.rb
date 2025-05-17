require 'rails_helper'

RSpec.describe ItemPartAttributeOption, type: :model do
  describe "associations" do
    it { should belong_to(:item_part_attribute) }

    it {
      should have_many(:source_rules)
        .class_name('Rule')
        .with_foreign_key(:source_option_id)
        .dependent(:destroy)
    }

    it {
      should have_many(:target_rules)
        .class_name('Rule')
        .with_foreign_key(:target_option_id)
    }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }

    it {
      should validate_numericality_of(:price)
        .is_greater_than_or_equal_to(0)
    }
  end

  describe "#rules" do
    it "returns both source and target rules" do
      option = create(:item_part_attribute_option)
      target = create(:item_part_attribute_option)

      source_rule = create(:rule, rule_type: :compatibility, source_option: option, target_option: target)
      target_rule = create(:rule, rule_type: :compatibility, source_option: target, target_option: option)

      expect(option.rules).to include(source_rule, target_rule)
    end
  end
end
