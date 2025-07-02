FROM rasa/rasa:3.6.10

WORKDIR /app

COPY . /app

# Debug logs
RUN echo "=== FILES ===" && ls -al /app
RUN echo "=== requirements.txt ===" && cat /app/requirements.txt || echo "No requirements.txt"

# Install dependencies
RUN pip install -r /app/requirements.txt

EXPOSE 10000

CMD ["run", "--enable-api", "--cors", "*", "--port", "10000", "--debug"]
