FROM rasa/rasa:3.6.10

WORKDIR /app

# Copy everything from your repo to the container
COPY . /app

# Debug 1: Show what files exist
RUN echo "=== DIRECTORY CONTENTS ===" && ls -al /app

# Debug 2: Show contents of requirements.txt (if it exists)
RUN echo "=== REQUIREMENTS.TXT CONTENT ===" && cat /app/requirements.txt || echo "requirements.txt not found"

# Upgrade pip just in case (safe)
RUN pip install --upgrade pip

# Main step - install requirements
RUN echo "=== INSTALLING REQUIREMENTS ===" && pip install -r /app/requirements.txt

EXPOSE 10000

CMD ["run", "--enable-api", "--cors", "*", "--port", "10000", "--debug"]
