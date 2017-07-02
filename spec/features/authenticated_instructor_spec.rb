require 'rails_helper'

describe 'An authenticated instructor' do
  it 'can see their class page' do
    cohort = Cohort.create(name: "1706-B")
    user   = User.create(name: "Sal", role: "instructor")
    CohortUser.create(user: user, cohort: cohort, role: "instructor")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit instructor_dashboard_path(user)

    expect(page).to have_content("Sal")
    expect(page).to have_content("1706-B")
  end

  it 'can create a new project' do
    cohort = Cohort.create(name: "1706-B")
    user   = User.create(name: "Sal", role: "instructor")
    CohortUser.create(user: user, cohort: cohort, role: "instructor")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit instructor_dashboard_path(user)
    click_on "Create New Project"
    fill_in 'project[name]', with: "Credit Check"
    click_on 'Create Project'

    expect(current_path).to eq(instructor_dashboard_path(user))
    expect(Project.last.name).to eq("Credit Check")
  end
end
