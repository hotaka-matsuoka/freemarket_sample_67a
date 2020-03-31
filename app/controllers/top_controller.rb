class TopController < ApplicationController
  def index
    @test = Test.new
  end
end