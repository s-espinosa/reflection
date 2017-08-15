require 'rails_helper'

describe 'An authenticated instructor' do
  it 'can see their class page' do
    cohort = Cohort.create(name: "1706-B")
    user   = cohort.instructor_users.create(name: "Sal", role: "instructor")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit instructor_dashboard_path(user)

    expect(page).to have_content("Sal")
    expect(page).to have_content("1706-B")
  end

  it 'can create a new project' do
    cohort = Cohort.create(name: "1706-B")
    user   = cohort.instructor_users.create(name: "Sal", role: "instructor")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit instructor_dashboard_path(user)
    click_on "Create New Project"
    fill_in 'project[name]', with: "Credit Check"
    click_on 'Create Project'

    expect(current_path).to eq(instructor_dashboard_path(user))
    expect(Project.last.name).to eq("Credit Check")
  end

  it 'can assign a project' do
    cohort = Cohort.create(name: "1706-B")
    user   = cohort.instructor_users.create(name: "Sal", role: "instructor")
    cohort.student_users.create(name: "Sam", role: "student")
    cohort.student_users.create(name: "Mike", role: "student")
    Project.create(name: "Credit Check")
    Project.create(name: "BattleShip")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit instructor_dashboard_path(user)
    click_on "Assign Project"
    select "Credit Check", from: "assignment[project_id]"
    check "Mike"
    click_on "Create Assignment"

    expect(current_path).to eq(instructor_dashboard_path(user))
    expect(page).to have_content("Credit Check")
  end
end
