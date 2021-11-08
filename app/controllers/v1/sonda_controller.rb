# frozen_string_literal: true

module V1
  class SondaController < ApplicationController
    rescue_from Exceptions::SondaMoveNotPermitted, with: :show_errors

    def index
      resource.reset
      render_position
    end

    def show
      render_position
    end

    def move
      resource.execute(params_move)
      render_position
    end

    private

    def show_errors
      render json: { erro: 'Um movimento inválido foi detectado, infelizmente a sonda ainda não possui a habilidade de #vvv' }, status: 500
    end

    def render_position
      render json: resource.position
    end

    def params_move
      params.require(:sonda)
    end

    def resource
      SondaService.instance
    end
  end
end
