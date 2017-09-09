# ipc-xdr
XDR com banco de dados relacional
Cliente(Python) Marshalls para JSON para servidor. Servidor(Ruby) Unmarshalls e persiste no BD.

# Instruções para executar

Instalando Python
```bash
sudo apt-get install python2.7
```
Instalando Ruby
```bash
sudo apt-get install ruby-full
```
Instalar Mysql
https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/

Acesse o Mysql e crie um novo banco de dados nomeado ipc_xdr
```bash
mysql -h localhost -u <seu usuário> -p
```
```SQL
CREATE DATABASE ipc_xdr
quit
```
Clonando repositório para sua máquina
```bash
git clone https://github.com/sistemas-distribuidos-cc-inf/ipc-xdr.git
```
Acesse a pasta dos códigos
```bash
cd ipc-xdr
```
Instale a gem json no ruby para que o servidor possa fazer o parser
```bash
gem install json
```
Instalar gem DBI para fazer comunicação com Mysql
```bash
gem install dbi
gem install dbd-mysql
```
(se ocorrer ERROR: Failed to build gem native extension, então efetue a instalação abaixo e depois repita o comando acima)
```bash
sudo apt-get install libmysqlclient-dev
```
Altere em server.rb o seu usuário e senha do servidor Mysql.
Altere em server.rb e em client.py para a porta que deseja utilizar.

Execute o servidor primeirametne e depois execute o cliente com os comandos:
```bash
ruby server.rb
python client.py
```
