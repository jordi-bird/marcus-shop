class Rule < ApplicationRecord
    belongs_to :source_option, class_name: 'ItemPartAttributeOption'
    belongs_to :target_option, class_name: 'ItemPartAttributeOption'
  
    # Enum per al tipus de regla amb valor per defecte
    enum :rule_type, {
      compatibility: 'compatibility',
      incompatibility: 'incompatibility',
      price_modifier: 'price_modifier'
    }, default: 'compatibility' # Valor per defecte (si no es proporciona cap valor)
  
    # Enum per a les operacions de modificadors de preu
    enum :operation, {
      add: 'add',
      multiply: 'multiply'
    }, prefix: :operation
  
    # Validacions
    validates :rule_type, presence: true
    validates :value, presence: true, if: :price_modifier?
    validates :operation, presence: true, if: :price_modifier?
    validates :value, numericality: { greater_than: 0 }, if: -> { price_modifier? && operation_multiply? }

    # Validació personalitzada per assegurar la presència del target
    validate :target_presence_for_relevance
  
    private
  
    def target_presence_for_relevance
      if compatibility? || incompatibility?
        #if target_option.nil? && target_part.nil?
        if target_option.nil? 
          errors.add(:base, "Compatibility/Incompatibility rules require a target_option")
        end
      elsif price_modifier?
        if target_option.nil?
          errors.add(:target_option, "must be present for price_modifier rules")
        end
      end
    end
  end
  