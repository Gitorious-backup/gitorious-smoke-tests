class ProjectPage
  include Page

  def create_repository(name)
    click_link "Projects"
    click_link "Add project"

    fill_in 'project_title', with: name
    click_button "Save"
    click_button "Create repository"

    using_wait_time 3 * Capybara.default_wait_time do
      find(".gts-current-repo-url").value
    end
  end
end

def project_page
  ProjectPage.new
end

