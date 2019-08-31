class AddressesController < TelphonesController
  def new
    @active = ["is-active","is-active","",""]
    @prefectures = Identification.new
  end
  def create
  end
end
