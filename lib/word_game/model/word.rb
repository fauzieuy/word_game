class Word
  attr_accessor = :type
  TYPES = ['fruits']

  def initialize(params = {})
    @type = params.fetch(:type, TYPES.sample)
  end

  def get_data
    File.read("directory/#{@type}.txt").lines.map{|d| d.strip.downcase}
  end

end
