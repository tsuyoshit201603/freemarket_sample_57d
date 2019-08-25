class TestsController < ApplicationController
  def index
    @test = Test.new
    @tests = Test.all
  end

  def create
    @test = Test.create(image)
  end

  private

  def image
    params.require(:test).permit(:image)
  end

end