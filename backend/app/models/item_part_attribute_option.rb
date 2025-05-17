class ItemPartAttributeOption < ApplicationRecord
  belongs_to :item_part_attribute

  # Relacions amb rules
  has_many :source_rules, class_name: 'Rule', foreign_key: 'source_option_id', dependent: :destroy
  has_many :target_rules, class_name: 'Rule', foreign_key: 'target_option_id'

  # Validacions
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Mètode per obtenir totes les regles relacionades amb la opció
  def rules
    Rule.where("source_option_id = ? OR target_option_id = ?", self.id, self.id)
  end
end