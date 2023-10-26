# Домашнее задание к занятию 2 «Работа с Playbook» - Пугач Евгений.


---

## `Подготовка к выполнению`

Подготовьте хосты в соответствии с группами из предподготовленного playbook.

### Решение:

Виртуальная машина `clickhouse-01` разворачивается в Yandex Cloud при помощи Terraform:

>>[TERRAFORM](https://github.com/PugachEV72/08-ansible-02-playbook/terraform_vm) 

---

## `Основная часть`

1. Подготовьте свой inventory-файл prod.yml.

### Ответ:

![Скриншот 1](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-41-20.png)

![Скриншот 2](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-45-05.png)

---

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает vector. 
3. При создании tasks рекомендую использовать модули: get_url, template, unarchive, file.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию,  
   установить vector.

### Ответ:

![Скриншот 3](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-47-08.png)

>>[PLAYBOOK](https://github.com/PugachEV72/08-ansible-02-playbook/playbook/site.yml)

---

5. Запустите ansible-lint site.yml и исправьте ошибки, если они есть.

### Ответ:

![Скриншот 4](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-52-47.png)

---

6. Попробуйте запустить playbook на этом окружении с флагом --check.

### Ответ:

![Скриншот 5](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-55-22.png)

---

7. Запустите playbook на prod.yml окружении с флагом --diff.

### Ответ:

![Скриншот 6](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-59-18.png)

![Скриншот 7](https://github.com/PugachEV72/Images/blob/master/2023-10-26_22-59-49.png)

![Скриншот 8](https://github.com/PugachEV72/Images/blob/master/2023-10-26_23-00-26.png)

   Убедитесь, что изменения на системе произведены.

![Скриншот 9](https://github.com/PugachEV72/Images/blob/master/2023-10-26_23-05-04.png)

![Скриншот 10](https://github.com/PugachEV72/Images/blob/master/2023-10-26_23-07-01.png)

![Скриншот 11](https://github.com/PugachEV72/Images/blob/master/2023-10-26_23-09-10.png)

---

8. Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.

### Ответ:

![Скриншот 12](https://github.com/PugachEV72/Images/blob/master/2023-10-26_23-11-51.png)

![Скриншот 13](https://github.com/PugachEV72/Images/blob/master/2023-10-26_23-12-22.png)

---

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook,  
   какие у него есть параметры и теги. 

### Playbook

Playbook производит установку и настройку приложений для сбора и передачи логов на сервер `clickhouse-01`.
Первый play объединяет последовательность задач по инсталяции Clickhouse. Блоку соответствует тэг  
`clickhouse`. Второй play объединяет последовательность задач по инсталяции Vector. Блоку соответствует  
тэг `vector`.

## Variables

Значения переменных устанавливаются в файле `vars.yml` в директории `group_vars`  
При помощи них задаются следующие параметры:
- `clickhouse_version`, `vector_version` - версии устанавливаемых приложений;
- `clickhouse_database_name` - имя базы данных в `clickhouse`;
- `clickhouse_create_table_name` - имя таблицы в `clickhouse`;
- `vector_config` - содержимое конфигурационного файла для приложения `vector`.

## Tags

Тэг `ping` - проверяет доступность сервера;  
тэг `clickhouse` - позволяет производить отдельную настройку приложения `clickhouse`;  
тэг `vector` - позволяет производить отдельную настройку приложения `vector`;  
по тэгу `vector_config` - возможно производить изменение в конфиге приложения `vector`.

---

10. Готовый playbook выложите в свой репозиторий, предоставьте ссылку на него.

### Ответ:

>>[PLAYBOOK](https://github.com/PugachEV72/08-ansible-02-playbook/playbook/)

---




