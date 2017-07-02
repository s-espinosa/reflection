require 'rails_helper'

describe "An authenticated user" do
  it "can see their own show page" do
    user = User.create(name: "Sal")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Sal")
  end

  it "can see a list of their assignments" do
    user = User.create(name: "Sal")
    user.assigned_projects.create(name: "Credit Check")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Credit Check")
  end
end
