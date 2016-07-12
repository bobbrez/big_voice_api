class Directory
  TYPE_ORDER = [:region, :current_op, :past_op, nil]

  attr_reader :tree

  def initialize(tree = {})
    @tree = tree
  end

  def id
    tree[:id]
  end

  def name
    tree[:name]
  end

  def content_modified_at
    tree[:content_modified_at]
  end

  def description
    tree[:description]
  end

  def cover_image
    @cover_image ||= tree.items.find { |item| item[:tags].include? 'cover-image' }
  end

  def cover_image_url
    return nil unless cover_image
    cover_image[:shared_link][:download_url]
  end

  def item_count
    tree[:items].count
  end

  def type
    return :region if tree[:tags].include? 'region'
    return :current_op if tree[:tags].include? 'current_op'
    return :past_op if tree[:tags].include? 'past_op'
  end

  def <=>(other)
    return 0 if self == other
    return name <=> other.name if type == other.type
    TYPE_ORDER.index(type) <=> TYPE_ORDER.index(other.type)
  end

  def as_json(options = nil)
    return {} if tree.blank?

    {
      id: id,
      name: name,
      content_modified_at: content_modified_at,
      description: description,
      cover_image_url: cover_image_url,
      item_count: item_count,
      type: type
    }
  end
end
