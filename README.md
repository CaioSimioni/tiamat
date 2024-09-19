# Projeto Tiamat

Este projeto busca testar questões de projeto java com docker. A ideia é conseguir criar uma aplicação java EE para Web e criar um container Docker para ela.


Para gerar a image docker use o comando:

```
$ docker build -t tiamat .
```

Agora para executar o container use o comando:
```
$ docker run -p 8000:8000 tiamat
```

