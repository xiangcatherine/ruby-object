# frozen_string_literal: true

require_relative '../lib/country.rb'

context 'Country' do
  before(:context) do
    @country = Country.new('Mexico')
  end

  context 'initialized in before(:context)' do
    describe '.name' do
      it 'is readable' do
        expect(@country.name).to eq('Mexico')
      end
      it 'is not editable' do
        expect { @country.name = 'Spain' }.to raise_error(NoMethodError)
      end
    end

    describe '.language' do
      it 'is writable' do
        language = 'French'
        expect { @country.language = language }.not_to raise_error
      end

      it 'is readable' do
        language = 'Spanish'
        @country.language = language
        expect(@country.language).to eq(language)
      end
    end
  end
end
