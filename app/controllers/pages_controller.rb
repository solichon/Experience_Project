class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @title = "A cool Home"
  end

  def about
    @title = "A cool Home"
  end
end
