require 'rubygems'
require 'json'
require 'socket'

# Abre o servidor para receber requisições na porta 2000
server = TCPServer.open(2000)

loop{
	# Aceita requisição do cliente
	client = server.accept
	# Recebe string enviada pelo socket
	json_string = client.gets
	# Faz parse do JSON para hash
	hash = JSON.parse(json_string)
	# Fecha socket do cliente
	client.close
}