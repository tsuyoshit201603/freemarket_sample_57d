class CreditsController < ApplicationController
  def new
    @active = ["is-active","is-active","is-active",""]
    @year = [*19..30]
    @month = [*1..12]
  end
end
