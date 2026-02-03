# Använd en lättviktsversion av Python
FROM python:3.9-slim

# Sätt arbetsmappen i containern
WORKDIR /app

# Kopiera in requirements och installera
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopiera in resten av koden
COPY . .

# Starta appen med Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]