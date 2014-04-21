class KeysPage
  include Page

  def upload_public_key
    visit "/~test/keys/new"

    key = KeyPair.generate

    fill_in "ssh_key_key", with: key.public
    click_button "Save"
  end
end

def keys_page
  KeysPage.new
end
