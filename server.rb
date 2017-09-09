require 'rubygems'
require 'json'
require 'socket'

PORT = 2000

# Abre o servidor para receber requisições na porta PORT
server = TCPServer.open(PORT)
print "Servidor pronto para receber requisições na porta " + PORT.to_s + "\n\n"

loop{
	# Aceita requisição do cliente
	client = server.accept
	
	# Recebe string enviada pelo socket
	json_string = client.gets
	
	# Faz parse do JSON para hash
	hash = JSON.parse(json_string)
	
	print "\n------------\nJSON recebido:\n" + json_string + "\n------------"
	print "\nNome: " + hash["nome"]
	print "\nTelefone:" + hash["telefone"]
	print "\nEndereço:" + hash["endereco"]
	print "\nIdentificador: " + hash["id"]

	# Fecha socket do cliente
	client.close
}