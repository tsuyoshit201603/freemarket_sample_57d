class TestsController < ApplicationController
  def index
    @test = Test.new
  end

  def create
    Test.create(image)
  end

  private

  def image
    params.require(:test).permit(:)
  end

end