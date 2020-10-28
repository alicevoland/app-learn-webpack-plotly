class StaticPagesController < ApplicationController
  def get_data
    @values = [['Finances', 'Carrière', 'Environnement', 'Loisirs', 'Développement personnel', 'Conjoint / Couple', 'Amis / Famille', 'Santé / Vitalité', 'Finances'],
               [1, 2, 3, 4, 5, 1, 3, 4, 1],
               [4, 5, 1, 3, 1, 2, 3, 4, 1]]
    render json: @values
  end

  def test
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
