# Source
This is taken from [here](https://bit.ly/3q3VALj) and later simplified.
# Contacts
If you have a questions or any proposal/bug then pls contact us in [ddoser telegram group](https://t.me/+eodJuvlTiK9hYWYy)
# Docker run (easy way)
- Install docker using [this manual](https://docs.docker.com/engine/install/)
- Run the container:
  ```shell
  # with default urls and proxies
  docker run --pull always --ulimit nofile=100000:100000 -it imsamurai/ddoser
  ```
  Each run will update ddoser inside.
# Run on Ubuntu/Debian Linux and Mac.
- Install git using [manual](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-  Install required software
   - Debian/Ubuntu
     ```shell
     sudo apt-get update && sudo apt-get install -y git && \
     git clone https://github.com/taransergey/ddoser.git && cd ddoser && ./install.sh
     ```

   - MacOs
    
     Check, you don't have Python3 installed on your machine - run `python3 -V` in the terminal, the output should look like `Python 3.9.10`.

     If Python3 is not installed or the installed version is older than 3.7.x, install it, otherwise skip this step.

     - If you use brew, install python with brew:
       ```shell
       brew install python@3.9
       brew link python@3.9
       ```
     
     - If you don't use brew, Download and install python version 3.7, 3.8 or 3.9 form here https://www.python.org/downloads/macos/
     
- Download ddoser and install required modules
  ```shell
  git clone https://github.com/taransergey/ddoser.git
  cd ddoser/
  pip install -r requirements.txt
  ```

- Run ddoser
  ```shell
  ulimit -n 100000
  ./run.sh
  ```

# Other options
If you use Windows WSL or would like to run the script with custom options, please check the [official README](https://github.com/taransergey/ddoser/blob/main/README.md).
