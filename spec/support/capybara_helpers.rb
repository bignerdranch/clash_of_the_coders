module ClashOfTheCoders::CapybaraHelpers
  def dom_id(item)
    klass = item.class.name.downcase
    "##{klass}_#{item.id}"
  end

  def find_rel(rel)
    find("[rel~='#{rel}']")
  end
end
