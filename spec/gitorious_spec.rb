require 'spec_helper'

feature 'Gitorious' do

  scenario 'Logging in, creating project & repository, pushing' do
    name = gen_name
    key = KeyPair.generate

    login_page.login

    keys_page.upload_public_key(key)

    origin = project_page.create_repository(name)

    git = Git.new(name, origin, key)
    git.clone
    git.configure_user
    git.add_file(foo: 'a new file')
    git.push

    repository_page.open(name)
    repository_page.should_include_file('foo')
  end

end
