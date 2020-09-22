# example.com (Wordpress With Docker)
## Introduction
  - Built in Wordpress 5.5.1
## Usages
Deploying with Docker
  - Build images
    ```sh
    $ docker build -t example_com/wordpress:5.5.1-fpm-alpine .
    ```
  - Clean up the old containers
    ```sh
    $ docker-compose down
    ```
  - Remove all the old volumes
    ```
      $ docker volume rm $(docker volume ls -q) 
    ```
  - Load the new containers
    ```sh
    $ docker-compose up -d
    ```
  - Import database
    ```
    $ source import_db.sh 
    # make sure dbpath defined in file .env
    ```
Backup data
  ```
  $ source export_db.sh
  # the backup database saved in ./src/data
  ```
    
# License
The MIT License (MIT)

Copyright (C) 2020, Hung Q. Truong. https://htq287.com. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.