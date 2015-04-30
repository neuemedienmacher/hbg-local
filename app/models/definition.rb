# Internal dictionary: Definitions for certain words get automatically
# infused into the texts of other models.
class Definition < ActiveRecord::Base
  # Validations
  validates :key, presence: true, uniqueness: true, length: { maximum: 50 },
                  exclusion: { in: %w(dfn class JS tooltip) }
  validates :explanation, presence: true, length: { maximum: 500 }

  # Methods

  # Infuses from the list of all definitions into the given string
  def self.infuse string
    select(:id, :key).find_each do |definition|
      regex = /\b(#{definition.key})\b/i
      if string.match regex
        string.gsub! regex,
                     "<dfn class='JS-tooltip' data-id='#{definition.id}'>"\
                     '\1</dfn>'
      end
    end
    string
  end
end