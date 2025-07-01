FROM rasa/rasa:3.6.10


WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 10000

CMD ["run", "--enable-api", "--cors", "*", "--port", "10000", "--debug"]
