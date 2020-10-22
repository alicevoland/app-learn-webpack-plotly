class StaticPagesController < ApplicationController

  
   def get_data
      @values = [[1,2,3,4,5, 1], ["Family", "Love", "Work", "Etc 1", "Etc 2", "Family"]]
      render json: @values
   end

  def test
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

end
