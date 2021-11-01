require 'rails_helper'

RSpec.describe SondaService, type: :services do
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
        before { subject.move! }

        it 'return position X is incremented' do
          expect(subject.x).to eq 1
          expect(subject.y).to eq 0
        end      
      end

      context 'when move 3 positions' do
        before do
          (0..2).each { |x| subject.move! }
        end

        it 'return position X is incremented' do
          expect(subject.x).to eq 3
          expect(subject.y).to eq 0
        end      
      end

      context 'when move 4 positions' do
        before do
          (0..3).each { |x| subject.move! }
        end

        it 'return position X is incremented' do
          expect(subject.x).to eq 4
          expect(subject.y).to eq 0
        end      
      end

      context 'when move 5 positions' do
        before do
          (0..3).each { |x| subject.move! }
        end

        it 'return raise error' do
          expect(subject.move!).to raise SondaMoveNotPermitted
        end      
      end
    end
  end
end
