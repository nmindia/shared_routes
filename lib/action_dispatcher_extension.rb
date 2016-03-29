class ActionDispatch::Routing::Mapper
  def draw(file_name)
    instance_eval(File.read(file_name))
  end
end
