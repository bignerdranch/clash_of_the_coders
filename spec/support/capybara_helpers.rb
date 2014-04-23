module ClashOfTheCoders::CapybaraHelpers
  def dom_id(item)
    klass = item.class.name.downcase
    "##{klass}_#{item.id}"
  end

  def expect_team_to_have(team: nil, content: nil)
    within(dom_id(team)) do
      expect(page).to have_content(content)
    end
  end

  def expect_team_to_not_have(team: nil, content: nil)
    within(dom_id(team)) do
      expect(page).to_not have_content(content)
    end
  end

  def find_rel(rel)
    find("[rel~='#{rel}']")
  end
end
