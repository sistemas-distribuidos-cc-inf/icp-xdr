import socket
import json
import sys

class Contact:
	"""Representa um contato de uma lista telefonica"""

	def __init__(self, name, tel, addr, cid):
		self.name = name
		self.tel = tel
		self.addr = addr
		self.cid = cid

	# faz o parse do objeto para json
	def marshalling(self):
		data = {
		'nome' : self.name,
		'telefone' : self.tel,
		'endereco' : self.addr,
		'id' : self.cid
		}
		json_str = json.dumps(data)
		return json_str

# trocar host e porta se necessario
HOST = 'localhost'
PORT = 80
ADDR = (HOST, PORT)
	
def main():
	# cria o socket
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

	# conecta a o socket a porta do server
	print >> sys.stderr, 'conectando a %s porta %s' % ADDR
	s.connect(ADDR)

	# pega os dados do contato
	nome = raw_input("nome: ")
	telefone = raw_input("telefone: ")
	endereco = raw_input("endereco: ")
	identificacao = raw_input("id: ")

	contato = Contact(nome, telefone, endereco, identificacao)

	try:
		# envia os dados
		msg = contato.marshalling()
		print >> sys.stderr, 'enviando "%s"' % msg
		s.send(msg) # envia o json para o servidor

		# esperar resposta
		#s.recv(16)

	finally:
		# finalizar a conexao
		print >> sys.stderr, 'fechando socket'
		s.close()

if __name__ == "__main__":
	main()
