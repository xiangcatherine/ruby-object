# frozen_string_literal: true

require_relative '../lib/person.rb'

context 'Person' do
  before(:context) do
    @p = Person.new('Ned', 'Flanders', 'Hot Cross Buns', 'Okilly-dokilly!')
  end

  context 'initialized in before(:context)' do
    describe '.given_name' do
      it 'is readable' do
        expect(@p.given_name).to eq('Ned')
      end
      it 'is editable' do
        @p.given_name = 'Nedward'
        expect(@p.given_name).to eq('Nedward')
      end
    end

    describe '.surname' do
      it 'is readable' do
        expect(@p.surname).to eq('Flanders')
      end
      it 'is editable' do
        @p.surname = 'Stark'
        expect(@p.surname).to eq('Stark')
      end
    end

    describe '.favorite_food' do
      it 'is readable' do
        expect(@p.favorite_food).to eq('Hot Cross Buns')
      end
      it 'is editable' do
        @p.favorite_food = "Devil's Food Cake"
        expect(@p.favorite_food).to eq("Devil's Food Cake")
      end
    end

    describe '.catchphrase' do
      it 'is readable' do
        expect(@p.catchphrase).to eq('Okilly-dokilly!')
      end
      it 'is editable' do
        @p.catchphrase = 'Hey-Diddly-Ho!'
        expect(@p.catchphrase).to eq('Hey-Diddly-Ho!')
      end
    end
  end
end
