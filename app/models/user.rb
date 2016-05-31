class User
  def files
    client.folder_items(shared_root.id, fields: [:tags, :name, :content_modified_at, :shared_link, :description]).map do |file|
      expand_folder file
    end
  end

  def file(id)
    client.file(id)
  end

  def shared_root
    client.folder_from_path '/BigVoice'
  end

  def client
    @client ||= Boxr::Client.new access_token.access_token
  end

  def access_token
    @access_token ||= Boxr::get_user_token ENV['PUBLIC_BOX_USER_ID']
  end

  def expand_folder(object)
    return object if object.type != 'folder'
    object.merge items: client.folder_items(object.id, fields: [:tags, :name, :content_modified_at, :shared_link, :description])
  end
end
