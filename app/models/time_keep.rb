class TimeKeep < ApplicationRecord
    belongs_to :user
    
    validates :year, presence: true, numericality: { only_integer: true }
    validates :month, presence: true, numericality: { only_integer: true }
    validates :day, presence: true, numericality: { only_integer: true }
    
    class << self
    # 今日のタイムカードを取得する
      def today(user)
        date = Date.today
        condition = { user: user, year: date.year, month: date.month, day: date.day }
        self.find_by(condition) || self.new(condition)
      end
    end 
end
