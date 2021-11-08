# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sonda, type: :models do
  let(:subject) { described_class.new }

  describe '.start!' do
    before do
      subject.start!
    end

    it { expect(subject.x).to be_zero }
    it { expect(subject.y).to be_zero }
  end

  describe '.move!' do
    context 'axis X' do
      context 'when move 1 position' do
        before do
          subject.move!
        end

        it 'return position X is incremented' do
          expect(subject.x).to eq 1
          expect(subject.y).to eq 0
        end
      end

      context 'when move 7 positions' do
        before do
          (0..2).each { |_x| subject.move! }
          subject.change_direction('GE')
          (0..2).each { |_x| subject.move! }
          subject.change_direction('GE')
          (0..2).each { |_x| subject.move! }
          subject.change_direction('GE')
          subject.move!
        end

        it 'return position X is incremented' do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 2
        end
      end

      context 'when move 5 positions' do
        before do
          (0..3).each { |_x| subject.move! }
        end

        it 'return raise error' do
          expect { subject.move! }.to raise_error(Exceptions::SondaMoveNotPermitted)
        end
      end
    end

    context 'axis Y' do
      before { subject.change_direction('GE') }

      context 'when move 1 position' do
        before { subject.move! }

        it 'return position Y is incremented' do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 1
        end
      end

      context 'when move 3 positions' do
        before do
          (0..2).each { |_x| subject.move! }
        end

        it 'return position Y is incremented' do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 3
        end
      end

      context 'when move 4 positions' do
        before do
          (0..3).each { |_x| subject.move! }
        end

        it 'return position Y is incremented' do
          expect(subject.x).to eq 0
          expect(subject.y).to eq 4
        end
      end

      context 'when move 5 positions' do
        before do
          (0..3).each { |_x| subject.move! }
        end

        it 'return raise error' do
          expect { subject.move! }.to raise_error(Exceptions::SondaMoveNotPermitted)
        end
      end
    end
  end
end
