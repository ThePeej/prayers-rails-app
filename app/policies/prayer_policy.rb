class PrayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def author?
    user == record.author
  end

end
