class Git < Struct.new(:name, :origin)
  def clone
    `git clone #{origin} #{path}
     cd #{path}
     git config user.email test@gitorious.org
     git config user.name "Gitorious Smoke Test"`
  end

  def path(*parts)
    ["tmp", name].concat(parts).join("/")
  end

  def add_file(files = {})
    files.each do |file, contents|
      File.write(path(file), contents)
    end
    `cd #{path}
     git add --all
     git commit -m "Add files"`
  end

  def push
    `cd #{path}
     git push origin master`
  end
end
