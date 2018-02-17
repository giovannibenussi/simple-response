RSpec.describe SimpleResponse do
  it 'has a version number' do
    expect(SimpleResponse::VERSION).not_to be nil
  end

  describe '.success' do
    it 'creates a success response' do
      expect(SimpleResponse.success).to be_success
    end

    context 'with additional attributes' do
      it 'associates the provided attributes with the response' do
        response = SimpleResponse.success(attribute: 1)

        expect(response.attribute).to eq(1)
      end
    end
  end

  describe '.failure' do
    it 'creates a failure response' do
      expect(SimpleResponse.failure).to be_failure
    end

    context 'with additional attributes' do
      it 'associates the provided attributes with the response' do
        response = SimpleResponse.failure(attribute: 1)

        expect(response.attribute).to eq(1)
      end
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

    context 'with additional attributes' do
      context 'when the attribute is boolean' do
        let(:response) { SimpleResponse.new(success: true, attribute: true) }

        it 'associates the provided attributes with the response' do
          expect(response.attribute).to eq(true)
        end

        it 'generated a query method for the provided attribute' do
          expect(response.attribute?).to eq(true)
        end
      end

      context 'when the attribute is not boolean' do
        it 'associates the provided attributes with the response' do
          response = SimpleResponse.new(success: true, attribute: 1)

          expect(response.attribute).to eq(1)
        end
      end
    end
  end

  describe 'attribute=' do
    let(:response) { SimpleResponse.new }

    context 'when the response is not boolean' do
      before { response.attribute = 1 }

      it 'generates a method with the name of the attribute' do
        expect(response).to respond_to(:attribute)
      end

      it 'assigns the provided parameter to the attribute' do
        expect(response.attribute).to eq(1)
      end
    end

    context 'when the response is boolean' do
      before { response.attribute = true }

      it 'generates a method with the name of the attribute' do
        expect(response).to respond_to(:attribute)
      end

      it 'generates a query method with the name of the attribute' do
        expect(response).to respond_to(:attribute?)
      end

      it 'generates a query method for the provided attribute' do
        expect(response.attribute?).to eq(true)
      end
    end
  end

  describe 'querying unexisting methods' do
    let(:response) { SimpleResponse.new(success: true) }

    it 'does not respond to unexisting methods' do
      expect(response).not_to respond_to(:attribute)
    end

    it 'does not respond to query methods' do
      expect(response).not_to respond_to(:attribute?)
    end
  end

  describe '#success?' do
    context 'with a success response' do
      it 'returns true' do
        result = SimpleResponse.new(success: true)

        expect(result.success?).to eq(true)
      end
    end

    context 'with a failure response' do
      it 'returns false' do
        result = SimpleResponse.new(success: false)

        expect(result.success?).to eq(false)
      end
    end
  end

  describe '#failure?' do
    context 'with a success response' do
      it 'returns true' do
        result = SimpleResponse.new(success: true)

        expect(result.failure?).to eq(false)
      end
    end

    context 'with a failure response' do
      it 'returns false' do
        result = SimpleResponse.new(success: false)

        expect(result.failure?).to eq(true)
      end
    end
  end
end
