require 'spec_helper'

feature 'Gitorious' do
  scenario 'Logging in' do
    user = 'test'
    password = 'testtest'

    gitorious.login(user, password)
    gitorious.upload_public_key
    name = gen_name
    origin = gitorious.create_repository(name)

    git = Git.new(name, origin)
    git.clone
    git.add_file(foo: 'a new file')
    git.push

    repository_page.open(name)
    repository_page.should_include_file('foo')
  end
end

def gen_name
  SecureRandom.hex
end

def gitorious
  Gitorious.new
end

class Gitorious
  include Page
  attr_accessor :user

  def login(user, password)
    visit '/login'
    fill_in 'email', with: user
    fill_in 'password', with: password
    click_button 'Log in'
  end

  def upload_public_key
    visit "/~test/keys/new"

    key = KeyPair.generate

    fill_in "ssh_key_key", with: key.public
    click_button "Save"
  end

  def create_repository(name)
    click_link "Projects"
    click_link "Add project"

    fill_in 'project_title', with: name
    click_button "Save"
    click_button "Create repository"

    using_wait_time 15 do
      find(".gts-current-repo-url").value
    end
  end
end
