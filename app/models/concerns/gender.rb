module Gender
  extend ActiveSupport::Concern

  included do
    enum gender: { :male => 1, :female => 2 }
  end
end
