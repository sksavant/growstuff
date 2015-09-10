require 'rails_helper'

feature 'New Members list RSS feed' do
  scenario 'The recently_joined index feed exists' do
    visit members_path(format: 'rss', sort: 'recently_joined')
    expect(page.status_code).to equal 200
  end

  scenario 'The alphabetical index feed exists' do
    visit members_path(format: 'rss')
    expect(page.status_code).to equal 200
  end

  scenario 'The recently_joined index title is what we expect' do
    visit members_path(format: 'rss', sort: 'recently_joined')
    expect(page).to have_content "Recent members (#{ENV['GROWSTUFF_SITE_NAME']})"
  end

  scenario 'The alphabatical index title is what we expect' do
    visit members_path(format: 'rss')
    expect(page).to have_content "Alphabetical members (#{ENV['GROWSTUFF_SITE_NAME']})"
  end

end
