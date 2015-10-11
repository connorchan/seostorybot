class Headline
  
  def initialize(h, b)
    @headlinetype, @body = h, b
  end
  
  def getType
    @headlinetype
  end
  
  def getText
    @body
  end
  
  def setType=(type)
    @headlinetype = type
  end
  
  def setText=(text)
    @body = text
  end
  
end