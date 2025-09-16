# speedtest-cli-ubuntu-24.04-LTS
Fix problem: "**Unable to locate package speedtest**" (from www.speedtest.net/apps/cli)
  
## Install
```wget -qO - https://raw.githubusercontent.com/VadimBoev/speedtest-cli-ubuntu-24.04-LTS/main/install.sh | sudo bash```  
  
## What does the script do?
This script automates the installation of the official Ookla Speedtest command-line tool on Ubuntu 24.04 LTS (Noble Numbat).  
  
The standard Ookla repository does not yet officially support Ubuntu 24.04, leading to a "404 Not Found" error when attempting to install the package. This script works around this issue by manually adjusting the repository source to use the Ubuntu 22.04 (**Jammy** Jellyfish) repository, which is compatible and stable.

The script performs the following steps:
1. Removes any previously installed speedtest-cli package and its repository to prevent conflicts.  
2. Installs curl, a dependency needed to fetch the official Ookla repository script.  
3. Adds the official Ookla repository to the system's package list.  
4. Fixes the repository source name from **noble** to **jammy**. ([The source of the problem solution](https://github.com/teamookla/speedtest-tools/issues/4#issuecomment-2573882318))    
5. Updates the system's package index to recognize the new repository.  
6. Installs the official speedtest package.  

  
RU:  
Этот скрипт автоматизирует установку официального инструмента командной строки Ookla Speedtest на Ubuntu 24.04 LTS (Noble Numbat).  
  
Стандартный репозиторий Ookla ещё официально не поддерживает Ubuntu 24.04, что приводит к ошибке «404 Not Found» при попытке установки. Данный скрипт обходит эту проблему, вручную настраивая репозиторий на использование версии для Ubuntu 22.04 (**Jammy** Jellyfish), которая является совместимой и стабильной.

Скрипт выполняет следующие шаги:  
1. Удаляет ранее установленный пакет speedtest-cli и его репозиторий, чтобы избежать конфликтов.  
2. Устанавливает curl — зависимость, необходимую для загрузки официального скрипта репозитория Ookla.  
3. Добавляет официальный репозиторий Ookla в список пакетов системы.  
4. Исправляет название источника репозитория с **noble** на **jammy**. ([Источник решения проблемы](https://github.com/teamookla/speedtest-tools/issues/4#issuecomment-2573882318))  
5. Обновляет индекс пакетов системы, чтобы распознать новый репозиторий.  
6. Устанавливает официальный пакет speedtest.
