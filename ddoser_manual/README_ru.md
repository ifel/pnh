# Источник
Это руководство взято [отсюда](https://bit.ly/3q3VALj) и упрощено.
# Контакты
Если у Вас есть вопросы, предложения или Вы хотите сообщить об ошибке свяжитесь с нами в [ddoser группе в telegram](https://t.me/+eodJuvlTiK9hYWYy)
# Запуск в Docker-е (самый простой способ)
- Установите докер используя [это руководство](https://docs.docker.com/engine/install/) (EN)
- Запустите контейнер:
  ```shell
  # с сайтами и прокси по умолчанию
  docker run --pull always --ulimit nofile=100000:100000 -it imsamurai/ddoser
  ```
  Каждый запуск будет обновлять версию ddoser.
# Запуск на Ubuntu/Debian Linux и Mac.
- Установите Git следуя [руководству](https://git-scm.com/book/ru/v2/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Git)
- Установка необходимого ПО
   - Debian/Ubuntu
     ```shell
     sudo apt-get update && sudo apt-get install -y git && \
     git clone https://github.com/taransergey/ddoser.git && cd ddoser && ./install.sh
     ```

   - MacOS
   
     Проверьте, что у вас Python3 еще не установлен - выполните `python3 -V` в терминале, вывод команды должен выглядеть как `Python 3.9.10`.

     Если у вас Python3 не установлен, или версия старее 3.7.x, установите его, иначе пропустите этот шаг
      - Если Вы пользуетесь Brew:
        ```shell
        brew install python@3.9
        brew link python@3.9
        ```

      - Если вы не используете brew
      
        Скачайте и установите python версий 3.7, 3.8 или 3.9 с https://www.python.org/downloads/macos/
      
- Скачайте ddoser и устновите необходимые модули
  ```shell
  git clone https://github.com/taransergey/ddoser.git
  cd ddoser/
  pip install -r requirements.txt
  ```

- Запустите ddoser
  ```shell
  ulimit -n 100000
  ./run.sh
  ```

# Другие варианты
Если Вы пользуетесь Windows WSL или хотите запустить скрипт с кастомными опциями, пожалуйста прочитайте [официальный README](https://github.com/taransergey/ddoser/blob/main/README.md).
