# Informa qual é a imagem base que o docker deve usar
FROM debian:latest

# Define o diretório de trabalho dentro do container
WORKDIR /usr/src/

# Atualiza os pacotes e instala Python e pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Copia o arquivo requirements.txt para o container
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt --break-system-packages

# Cria um usuário no container
RUN useradd --create-home appuser

# Copia o arquivo app.py para o diretório de trabalho
COPY app.py .

# Define variáveis de ambiente
ENV API_KEY=hi_mom
ENV FLASK_APP=app.py

# Troca para o usuário appuser
USER appuser

# Expõe a porta 8000
EXPOSE 8000

# Define o ponto de entrada e executa a aplicação
ENTRYPOINT ["python3", "-m", "flask", "run", "-h", "0.0.0.0", "-p", "8000"]

# Metadados adicionais
LABEL maintainer="CaioSimioni"
LABEL version="1.0"
LABEL description="Essa é uma aplicação Python rodando em um container debian latest"
