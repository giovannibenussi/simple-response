RSpec.describe SimpleResponse do
  it 'has a version number' do
    expect(SimpleResponse::VERSION).not_to be nil
  end

  describe '.success' do
    it 'creates a success response' do
      expect(SimpleResponse.success).to be_success
    end
  end
end
