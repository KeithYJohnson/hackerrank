require './parse_make'
require 'rspec/its'

describe ParseMake do
  let(:input_file) { 'input.txt' }
  let(:action)     { ParseMake.new(input_file) }


  describe '#build_data_struct' do
    let(:expected) {
        {
          red: {
            subdepends: [],
            outputs: ["hello Im red"]
          },
          green: {
            subdepends: [],
            outputs: ["hello im green", "and i do other things"]
          },
          purple: {
            subdepends: ["yellow", "red"],
            outputs: ["hello im purple"]
          },
          yellow: {
            subdepends: ["red"],
            outputs: ["hello im yellow"]
          }
        }
    }
    context 'its builds stuff' do
      subject      { action }
      before       { action.build_data_struct }
      its(:parsed) { is_expected.to eq(expected) }
    end
  end

  describe 'is_dependency?' do
    context 'its a dependency' do
      subject { action.is_dependency?("red:\n") }
      it     { is_expected.to be_truthy}
    end

    context 'its not a dependency' do
      subject { action.is_dependency?("  hello Im red\n") }
      it      { is_expected.to be_falsey }
    end
  end

  describe '#perform' do
    before { action.build_data_struct }

    context 'it has no subdepends' do
      it 'one line of output' do
        expect(STDOUT).to receive(:puts).with('hello Im red')
        action.target = :red; action.perform
      end

      it 'multline output' do
        expect(STDOUT).to receive(:puts).with('hello im green')
        expect(STDOUT).to receive(:puts).with('and i do other things')
        action.target = :green; action.perform
      end
    end

    context 'it multiple level subdepends' do
      let(:action) { described_class.new('recurse_input.txt', 'yellow') }

      it 'first outputs the subdepend and then the target' do
        expect(STDOUT).to receive(:puts).with('hello im green')
        expect(STDOUT).to receive(:puts).with('and i do other things')
        expect(STDOUT).to receive(:puts).with('hello Im red')
        expect(STDOUT).to receive(:puts).with('hello im yellow')
        action.perform
      end
    end
  end

  describe '#extract_depends' do
    let(:action) { described_class.new('recurse_input.txt', 'yellow') }

    context 'recursive subdependcies' do
      before { action.build_data_struct }

      it 'grabs all the subdependcies recursively' do
        expect(action.extract_depends(action.target)).to eq(["yellow", "red", "green"])
      end
    end
  end
end
