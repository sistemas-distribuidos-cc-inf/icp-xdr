require 'rubygems'
require 'json'

dieison = '{"endereco": "Rua 3", "id": "1", "telefone": "5551234", "nome": "Maria"}'
p JSON.parse(dieison)