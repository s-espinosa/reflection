require 'rails_helper'

describe 'When a user visits /' do
  it 'they see a welcome page' do
    visit '/'

    expect(page).to have_content("Log in with GitHub")
  end
end
