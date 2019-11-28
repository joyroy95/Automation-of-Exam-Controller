module NamedObject
  def to_s
    id.to_s + ': ' + name.titleize
  end
end
