# ipc-xdr
XDR com banco de dados relacional
Cliente(Python) Marshalls para JSON para servidor. Servidor(Ruby) Unmarshalls e persiste no BD.

# Instruções para executar

Instalando Ruby
```bash
sudo apt-get install ruby-full
```
Clonando repositório
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

Execute o servidor primeirametne e depois execute o cliente com os comandos:
```bash
ruby server.rb
python client.py
```
