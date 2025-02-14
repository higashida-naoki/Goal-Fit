class Exercise < ApplicationRecord
  def self.search_for(content, method)
    if method == 'perfect'
      Exercise.where(name: content)
    elsif method == 'forward'
      Exercise.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Exercise.where('name LIKE ?', '%' + content)
    else
      Exercise.where('name LIKE ?', '%' + content + '%')
    end
  end
end
