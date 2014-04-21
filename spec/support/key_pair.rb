class KeyPair < Struct.new(:name)
  def self.generate
    name = SecureRandom.hex
    `ssh-keygen -f tmp/#{name} -P ''`
    new(name)
  end

  def public
    File.read("tmp/#{name}.pub")
  end
end
