# webdevrnBot
É um bot por enquanto ele só será auxilio da infraestrutura do site

# Finalidade
Esse bot foi criado no objetivo de gerenciar informações a pessoa de infraestrutura para manter um melhor controle sysadmin

# Instalação
A instalação é necessário que o bot tenha acesso ao usuário root, sendo necessário colocar o arquivo e dentro do diretório executar como root:
```bash
ln -f bot.sh /bin/bot
```
assim o bot poderá ser chamado normalmente através da entrada, e após isso editar o cron, `crontab -e` e acrescentar:
```cron
  5 * * * * sh /bin/bot
```
> Faça isso seguindo os padrões do cron, isso fará a verificação em 5 e 5 minutos...
Após isso é apenas esperar o momento e seu bot já funcionará...
**Lembrando de usar sua key para o bot do telegram e seu chat id ou group and canal id.**
