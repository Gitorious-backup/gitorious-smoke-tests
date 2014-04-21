class RepositoryPage
  include Page

  def open(name)
    visit "/#{name}/#{name}"
  end

  def should_include_file(*files)
    files.each do |file_name|
      expect(page).to have_content(file_name)
    end
  end
end

def repository_page
  RepositoryPage.new
end
