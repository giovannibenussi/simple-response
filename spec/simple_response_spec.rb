RSpec.describe SimpleResponse do
  it 'has a version number' do
    expect(SimpleResponse::VERSION).not_to be nil
  end

  describe '.success' do
    it 'creates a success response' do
      expect(SimpleResponse.success).to be_success
    end
  end

  describe '.new' do
    context 'without a success param' do
      subject { SimpleResponse.new(success: true) }

      it 'creates a success response' do
        is_expected.to be_success
      end
    end

    context 'when a success: true parameter is provided' do
      subject { SimpleResponse.new(success: true) }

      it 'creates a success response' do
        is_expected.to be_success
      end
    end

    context 'when a success: false parameter is provided' do
      subject { SimpleResponse.new(success: false) }

      it 'returns a non success response' do
        is_expected.not_to be_success
      end
    end
  end

  describe 'attribute=' do
    let(:response) { SimpleResponse.new }

    before { response.attribute = 1 }

    it 'generates a method with the attribute name' do
      expect(response).to respond_to(:attribute)
    end

    it 'assigns the provided parameter to the attribute' do
      expect(response.attribute).to eq(1)
    end
  end
end
