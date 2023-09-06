require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('nameable', correct_name: 'original name') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  context 'attributes' do
    it 'has a nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  context 'correct_name' do
    it 'delegates correct_name to the nameable object and capitalizes the result' do
      expect(decorator.correct_name).to eq('Original name')
    end
  end
end
