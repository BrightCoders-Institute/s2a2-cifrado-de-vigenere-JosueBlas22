# vigenere_cipher.rb
class VigenereCipher
  ALPHABET = ('A'..'Z').to_a

  def initialize(key)
    @key = key.upcase
  end

  def encrypt(message)
    message = message.upcase
    key_index = 0

    encrypted_message = message.chars.map do |char|
      if ALPHABET.include?(char)
        key_char = @key[key_index]
        key_value = ALPHABET.index(key_char)
        char_value = ALPHABET.index(char)

        cipher_value = (char_value + key_value) % ALPHABET.size
        cipher_char = ALPHABET[cipher_value]

        key_index = (key_index + 1) % @key.size
        cipher_char
      else
        char
      end
    end

    encrypted_message.join
  end
  def decrypt(texto_cifrado)
    texto_cifrado = texto_cifrado.upcase
    indice_clave = 0
  
    mensaje_descifrado = texto_cifrado.chars.map do |caracter|
      if ALPHABET.include?(caracter)
        caracter_clave = @key[indice_clave]
        valor_clave = ALPHABET.index(caracter_clave)
        valor_caracter = ALPHABET.index(caracter)
  
        valor_descifrado = (valor_caracter - valor_clave) % ALPHABET.size
        caracter_descifrado = ALPHABET[valor_descifrado]
  
        indice_clave = (indice_clave + 1) % @key.size
        caracter_descifrado
      else
        caracter
      end
    end
  
    mensaje_descifrado.join
  end
  
end

# Ejemplo 1
cipher = VigenereCipher.new('SECRETO')
puts cipher.encrypt('HOLA')  # Debería imprimir 'ZSNR'

# Ejemplo 2
cipher = VigenereCipher.new('COD')
puts cipher.encrypt('RUBY')  # Debería imprimir 'TJEA'

# Ejemplo 1
cipher = VigenereCipher.new('SECRETO')
encrypted_message = cipher.encrypt('HOLA')
puts "Mensaje encriptado: #{encrypted_message}"  # Debería imprimir 'ZSNR'

decrypted_message = cipher.decrypt(encrypted_message)
puts "Mensaje desencriptado: #{decrypted_message}"  # Debería imprimir 'HOLA'

# Ejemplo 2
cipher = VigenereCipher.new('COD')
encrypted_message = cipher.encrypt('RUBY')
puts "Mensaje encriptado: #{encrypted_message}"  # Debería imprimir 'TJEA'

decrypted_message = cipher.decrypt(encrypted_message)
puts "Mensaje desencriptado: #{decrypted_message}"  # Debería imprimir 'RUBY'
