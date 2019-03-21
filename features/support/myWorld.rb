module MyWorld
  require 'logger'

  def settings
    @settings ||= Settings.new
  end

  def article
  	@article ||= Article.new
  end

  def user
    @user ||= User.new
  end

  def csspathes_websitebasics
    @websitebasics ||= Csspathes_Websitebasics.new
  end

  def websitebasics
    return {:pathes => csspathes_websitebasics, :data => article}
  end

  def csspathes_search
    @search ||= Csspathes_Search.new
  end

  def search
    return {:pathes => csspathes_search, :data => article}
  end

  def csspathes_directorder
    @directorder ||= Csspathes_Directorder.new
  end

  def directorder
    return {:pathes => csspathes_directorder, :data => article}
  end

  def csspathes_productcart
    @productcart ||= Csspathes_Productcart.new
  end

  def productcart
    return {:pathes => csspathes_productcart, :data => article}
  end

  def csspathes_productpage
    @productpage ||= Csspathes_Productpage.new
  end

  def productpage
    return {:pathes => csspathes_productpage, :data => article}
  end

  def csspathes_account
    @account ||= Csspathes_Account.new
  end

  def account
    return {:pathes => csspathes_account, :data => user}
  end

  def csspathes_checkout
    @checkout ||= Csspathes_Checkout.new
  end

  def checkout
    return {:pathes => csspathes_checkout, :pathes_account => csspathes_account, :data => user}
  end

  def url_functions
    @url_functions ||=UrlFunctions.new
  end

  def shopware
    @shopware ||=ShopwareApi.new
  end

  def jsfunctions
    @jsfunctions ||= Jsfunctions.new
  end

  def logger
    @logger ||= Logger.new(STDOUT)
  end

  def emarsys_api
    @emarsys_api ||=Emarsys_api.new
  end
end

World(MyWorld)
World(MyFunctions)
