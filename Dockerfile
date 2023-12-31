# Используем базовый образ Python
FROM python:3

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем зависимости проекта
COPY requirements.txt /app/

# Install the latest version of pip
RUN /usr/local/bin/python -m pip install --upgrade pip

# Install production dependencies.
RUN pip install -r requirements.txt

# Копируем все содержимое текущей директории внутрь контейнера
COPY . /app/

# Задаем переменную окружения для Flask (необязательно)
ENV FLASK_APP=app.py

# Открываем порт, на котором будет работать приложение
EXPOSE 10000

# Запускаем приложение при старте контейнера
CMD python3 ./app.py
