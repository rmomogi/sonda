# frozen_string_literal: true

RSpec.configure do |config|
  config.swagger_root = "#{Rails.root}/swagger"

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Baby Sonda API V1',
        version: 'v1',
        description: <<~END
          Uma sonda exploradora da NASA pousou em marte. O pouso se deu em uma área retangular, na qual a sonda pode navegar usando uma interface web. 
          
          A posição da sonda é representada pelo seu eixo x e y, e a direção que ele está apontado pela letra inicial, sendo as direções válidas:
          * E - Esquerda
          * D - Direita
          * C - Cima
          * B - Baixo

          A sonda aceita três comandos:
          * GE - girar 90 graus à esquerda
          * GD - girar 90 graus à direta
          * M - movimentar. Para cada comando M a sonda se move uma posição na direção à qual sua face está apontada.
        END
      },
      basePath: '/api/v1'
    }
  }

  config.swagger_format = :yaml
end
