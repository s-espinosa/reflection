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

  it 'can only see their own assignments' do
    user_1 = User.create(name: "Sal")
    user_2 = User.create(name: "Ali")
    user_2.assigned_projects.create(name: "Credit Check")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit user_path(user_2)

    expect(page).to_not have_content("Credit Check")
  end

  it 'can see a reflection' do
    student = User.create(name: "Sam")
    credit = student.assigned_projects.create(name: "Credit Check")
    credit.prompts.create(prompt: "What did you learn from this project?")
    credit.prompts.create(prompt: "What did you struggle with this project?")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)

    visit user_path(student)
    click_on "Create"

    expect(page).to have_content("What did you learn from this project?")
    expect(page).to have_content("What did you struggle with this project?")
  end

  it 'can create a reflection' do
    student = User.create(name: "Sam")
    credit = student.assigned_projects.create(name: "Credit Check")
    credit.prompts.create(prompt: "What did you learn from this project?")
    credit.prompts.create(prompt: "What did you struggle with this project?")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)

    visit user_path(student)
    click_on "Create"

    fill_in "questions[#{credit.prompts.first.id}]", with: "first"
    fill_in "questions[#{credit.prompts.second.id}]", with: "second"
    click_on "Create"

    expect(Response.first.response).to eq("first")
    expect(Response.second.response).to eq("second")
    expect(page).to_not have_content("Create")
    expect(page).to have_content("Update")
  end

  it 'can update a reflection' do
    student  = User.create(name: "Sam")
    credit   = student.assigned_projects.create(name: "Credit Check")
    prompt_1 = credit.prompts.create(prompt: "What did you learn from this project?")
    prompt_2 = credit.prompts.create(prompt: "What did you struggle with this project?")
    student.responses.create(prompt: prompt_1, project: credit, response: "first")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)

    visit user_path(student)
    click_on "Update"

    fill_in "questions[#{credit.prompts.second.id}]", with: "second"
    click_on "Update"

    expect(Response.find_by(prompt: prompt_1).response).to eq("first")
    expect(Response.find_by(prompt: prompt_2).response).to eq("second")
    expect(page).to_not have_content("Create")
    expect(page).to have_content("Update")
  end
end
