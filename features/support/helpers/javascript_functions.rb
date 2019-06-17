#Here are all javascript-functions that are saved in ruby variables
class Jsfunctions
  attr_accessor :disableStylesheet, :refreshPage

  def initialize

    @disableStylesheet="document.styleSheets[0].disabled = !document.styleSheets[0].disabled;"

    @refreshPage="location.reload();"    
  end
end
