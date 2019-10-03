AspNetCore_Jenkins


http://www.macoratti.net/19/01/intro_docker7.htm

dotnet publish --configuration Release --output dist


Dessa forma já temos o arquivo Dockerfile criado para gerar a imagem. Para fazer isso usamos o comando  build e informamos o nome da imagem, a tag e um ponto(.). O comando fica assim:

docker build -t aspnetcoremvc/app1:1.0 .

