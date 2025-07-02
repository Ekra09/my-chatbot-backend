FROM rasa/rasa:3.6.10

WORKDIR /app

COPY . /app

# ✅ Debug what's inside the working directory
RUN echo "===== DIRECTORY LIST =====" && ls -al /app
RUN echo "===== REQUIREMENTS.TXT CONTENT =====" && cat /app/requirements.txt || echo "File not found"

# ✅ Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 10000

CMD ["run", "--enable-api", "--cors", "*", "--port", "10000", "--debug"]


