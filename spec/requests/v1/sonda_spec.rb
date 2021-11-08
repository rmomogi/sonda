# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Sonda API', type: :request do
  path '/v1/sonda' do
    get 'Initialize sonda' do
      tags :sonda
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
      tags :sonda
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
      tags :sonda
      produces 'application/json'
      consumes 'application/json'

      parameter name: :sonda, in: :body, schema: {
        type: :object,
        properties: {
          movimentos: { type: :array }
        },
        required: ['movimentos']
      }

      response '200', 'Get position after commands' do
        schema type: :object,
               properties: {
                 x: { type: :integer },
                 y: { type: :integer },
                 face: { type: :string }
               },
               required: %w[x y face]

        let(:sonda) do
          {
            movimentos: %w[GE M M M GD M M]
          }
        end

        run_test!
      end

      response '500', 'Sonda failed' do
        schema type: :object,
               properties: {
                 erro: { type: :string }
               },
               required: %w[erro]

        let(:sonda) do
          {
            movimentos: %w[M M M M M M]
          }
        end

        run_test!
      end
    end
  end
end
