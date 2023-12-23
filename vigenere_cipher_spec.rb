# vigenere_cipher_spec.rb
require 'rspec'
require_relative 'vigenere_cipher'

describe VigenereCipher do
  describe '#encrypt' do
    context 'when the key is "SECRETO"' do
      it 'encrypts "HOLA" as "ZSNR"' do
        cipher = VigenereCipher.new('SECRETO')
        expect(cipher.encrypt('HOLA')).to eq('ZSNR')
      end
    end

    context 'when the key is "COD"' do
      it 'encrypts "RUBY" as "TJEA"' do
        cipher = VigenereCipher.new('COD')
        expect(cipher.encrypt('RUBY')).to eq('TJEA')
      end
    end
  end
end
