module ClashOfTheCoders::NavigationHelpers
  def visit_new_team_page
    visit root_path
    click_teams_link
    click_new_team_link
  end

  def visit_scoreboard_page
    visit root_path
    click_scoreboard_link
  end

  def visit_scorecard_page
    visit root_path
    click_scorecard_link
  end

  private

  def click_scorecard_link
    find_rel(I18n.t('rel.scorecard')).click
  end

  def click_teams_link
    find_rel(I18n.t('rel.all_teams')).click
  end

  def click_new_team_link
    find_rel(I18n.t('rel.new_team')).click
  end

  def click_scoreboard_link
    find_rel(I18n.t('rel.scoreboard')).click
  end
end
