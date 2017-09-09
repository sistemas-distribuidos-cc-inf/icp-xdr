require 'rubygems'
require 'json'
require 'socket'
require 'dbi'

#Porta utilizada pelo socket
PORT = 2000

#Dados para acessar o servidor Mysql
username = "seu_usuario" #Inclua entre as aspas seu usuário
password = "sua_senha" #Inclua entre as aspas sua senha

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

	begin
	  # Conectando ao Servidor Mysql
	  dbh = DBI.connect("DBI:Mysql:ipc_xdr:localhost", username, password)
	  # Obtém a versão do servidor e imprime na tela
	  row = dbh.select_one("SELECT VERSION()")
	  puts "Versão do servidor Mysql: " + row[0]
	  # Se não existir, cria a tabela lista_telefonica
	  dbh.do("
	    CREATE TABLE IF NOT EXISTS lista_telefonica(
	      Nome varchar(255),
	      Telefone varchar(255),
	      Endereco varchar(255),
	      Id int
	    );")
	  # Prepara a inserção do elemento na tabela
	  sth = dbh.prepare("INSERT INTO lista_telefonica(Nome, Telefone, Endereco, Id) VALUES (?, ?, ?, ?)")
	  # Insere os valores recebidos pelo socket e executa a transação
	  sth.execute(hash["nome"], hash["telefone"], hash["endereco"], hash["id"].to_i)
	  sth.finish
	  # Da commit na transação para o banco
   	dbh.commit
   	puts "Dados persistidos no bd com sucesso!"

	rescue DBI::DatabaseError => e
	  puts "Um erro ocorreu!"
	  puts "Código do erro: #{e.err}"
	  puts "Mensagem de erro: #{e.errstr}"
	  exit!
	ensure
	  # Desconecta do Servidor
	  dbh.disconnect if dbh
	end

	# Fecha socket do cliente
	client.close
}