import socket
import json

# faz o parse dos dados para json
def marshalling (nome, telefone, endereco, identificacao):
	data = {
		'nome' : nome,
		'telefone' : telefone,
		'endereco' : endereco,
		'id' : identificacao
	}
	json_str = json.dumps(data)
	return json_str

# trocar host e porta se necessario
HOST = 'localhost'
PORT = 80
ADDR = (HOST, PORT)

# cria a socket e se conecta ao endereco
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(ADDR)

# tenta enviar os dados para o servidor
try:
	nome = raw_input("nome: ")
	telefone = raw_input("telefone: ")
	endereco = raw_input("endereco: ")
	identificacao = raw_input("id: ")

	msg = marshalling(nome, telefone, endereco, identificacao)

	s.sendall(msg) # envia o json para o servidor

finally:
	# finalizar a conexao
	s.close()

