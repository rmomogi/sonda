# frozen_string_literal: true

require 'swagger_helper'

describe 'Sonda API', swagger_doc: 'v1/swagger.yaml' do
  include JsonHelpers

  path '/v1/sonda' do
    get 'Initialize sonda' do
      tags :Sonda
      produces 'application/json'

      response '200', 'Reset position' do
        schema type: :object,
               properties: {
                 x: { type: :integer },
                 y: { type: :integer },
                 face: { type: :string }
               },
               required: %w[x y face]

        let(:x) { 0 }
        let(:y) { 0 }
        let(:face) { 'C' }

        run_test!
      end
    end
  end

  path '/v1/sonda/show' do
    get 'Sonda informations' do
      tags :Sonda
      produces 'application/json'

      response '200', 'Get position' do
        schema type: :object,
               properties: {
                 x: { type: :integer },
                 y: { type: :integer },
                 face: { type: :string }
               },
               required: %w[x y face]

        let(:x) { 0 }
        let(:y) { 0 }
        let(:face) { 'C' }

        run_test!
      end
    end
  end

  path '/v1/sonda/move' do
    post 'Sonda commands' do
      tags :Sonda
      produces 'application/json'
      consumes 'application/json'

      parameter name: :params, in: :body, schema: {
        type: :object,
        description: 'The commands payload',
        example: {
          movimentos: ['GE', 'M', 'M', 'M', 'GD', 'M', 'M']
        },
        properties: {
          movimentos: { type: 'array', items: {
            type: 'string',
            example: 'GD'
          } }
        },
        required: ['movimentos']
      }

      let(:params) do
        {
          movimentos: %w[GE M M M GD M M]
        }
      end

      response '200', 'Get position after commands' do
        schema type: :object,
               properties: {
                 x: { type: :integer },
                 y: { type: :integer },
                 face: { type: :string }
               },
               required: %w[x y face]
        run_test!
      end

      response '500', 'Sonda failed' do
        schema type: :object,
               properties: {
                 erro: { type: :string, example: 'Um movimento inválido foi detectado, infelizmente a sonda ainda não possui a habilidade de #vvv'  }
               },
               required: %w[erro]

        let(:sonda) do
          {
            movimentos: %w[M M M M M M]
          }
        end

        run_test! do |_response|
          expect(json_response[:errors]).to eq [
            { erro: 'Um movimento inválido foi detectado, infelizmente a sonda ainda não possui a habilidade de #vvv' }
          ]
        end
      end
    end
  end
end
