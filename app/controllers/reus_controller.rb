require "Reus_Denunciados"
class ReusController < ApplicationController
  def listareus

    @lista_reus = ReusDenunciados.lista_reus_denunciados

  end

end
