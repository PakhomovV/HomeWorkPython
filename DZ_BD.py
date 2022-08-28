import json
import psycopg2


def create_table(cur):
    with conn.cursor() as cur:
        cur.execute(""" create table customer(
            id_customer serial primary key,
            first_name varchar (150) not null, 
            last_name varchar (150)  not null,
            email varchar (150),
            phone json );""")
    conn.commit()


def create_new_customer(first_name, last_name, email_cust, phone={}):
    while True:
        phone_count = input('У клиента есть телефон? Y/N')
        if phone_count != 'n':
            phone_key = input('Введите номер телефона :')
            phone_num = input('Введите телефонный номер :')
            phone[phone_key] = phone_num
        else:
            break

    conn = psycopg2.connect(database="music_services", user="postgres", password="123")
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO customer ( first_name, last_name, email, phone) 
            values (%s, %s,%s,%s);
            """, (first_name, last_name, email_cust, json.dumps(phone)))

    conn.commit()


def add_phone_customer(id_customer):
    with conn.cursor() as cur:
        cur.execute("""
                   select phone from customer 
                   where id_customer = %s; 
                   """, (id_customer,))
        res = cur.fetchall
        for i in cur.fetchall():
            list_phone = i

    print(f'Телефоны клиента: {list_phone}')

    dict_values_phone = []
    dict_key_phone = []
    for i in list_phone:
        for b, g in i.items():
            dict_values_phone.append(g)
            dict_key_phone.append(b)

    dict_phone = dict(zip(dict_key_phone, dict_values_phone))

    phone_add = input('Добавить телефон? Y/N ')
    if phone_add == 'y':
        num_phone_new = input('Введите номер телефона: ')
        if num_phone_new in dict_phone.keys():
            print('Такой номер уже есть!')
        else:
            phone_new = input('Введите телефонный номер: ')
            dict_phone.setdefault(num_phone_new, phone_new)
            with conn.cursor() as cur:
                cur.execute("""
                           UPDATE customer set phone = %s
                                where id_customer = %s;
                           """, (json.dumps(dict_phone), id_customer))

            conn.commit()


def udate_customer_all(id_customer):
    while True:
        update_comm = int(
            input('Внести изменения по Клиенту : 1 - Имя, 2 - Фамилия, 3 - Email, 4 - Телефон, 5 - exit : '))
        if update_comm == 1:
            first_name_new = input('Введите Имя Клиента :')
            conn = psycopg2.connect(database="music_services", user="postgres", password="123")
            with conn.cursor() as cur:
                cur.execute("""
                    UPDATE customer set first_name = %s
                    where id_customer = %s; 
                    """, (first_name_new, id_customer))

            conn.commit()

        if update_comm == 2:
            last_name_new = input('Введите Фамилию Клиента: ')
            conn = psycopg2.connect(database="music_services", user="postgres", password="123")
            with conn.cursor() as cur:
                cur.execute("""
                UPDATE customer set last_name = %s
                where id_customer = %s; 
                """, (last_name_new, id_customer))

            conn.commit()

        if update_comm == 3:
            email_new = input('Введите новый email Клиента: ')
            conn = psycopg2.connect(database="music_services", user="postgres", password="123")
            with conn.cursor() as cur:
                cur.execute("""
                UPDATE customer set email = %s
                where id_customer = %s; 
                """, (email_new, id_customer))

            conn.commit()

        if update_comm == 4:
            add_phone_customer(id_customer=input('Введите id_клиента: '))
        if update_comm == 5:
            break


def delete_phone_customer(id_customer):
    with conn.cursor() as cur:
        cur.execute("""
                   select phone from customer 
                   where id_customer = %s; 
                   """, (id_customer))
        res = cur.fetchall
        for i in cur.fetchall():
            n = i

    print(f'Телефоны клиента: {n}')

    d = []
    d_1 = []
    for i in n:
        for b, g in i.items():
            d.append(g)
            d_1.append(b)

    c = dict(zip(d_1, d))

    k_1 = input('Выберите какой телефон нужно удалить: ')
    print(f'Вы выбрали:  {[k_1]}')
    del c[k_1]
    del_new = input('Сохранить изменения в базе данных? Y/N')

    if del_new == 'y':
        with conn.cursor() as cur:
            cur.execute("""
                       UPDATE customer set phone = %s
                            where id_customer = %s; 
                       """, (json.dumps(c), id_customer))

        conn.commit()


def delete_customer(id_customer):
    with conn.cursor() as cur:
        cur.execute("""
            delete from customer  
            where id_customer = %s;
            """, (id_customer))

        conn.commit()


def search_customer():
    print('Выберите команду поиска : 1- по id, 2- по Имени, 3- по Фамилии, 4 - по Email, 5- по Телефону ')
    num_command = input('Введите команду:')
    if num_command == '1':
        id_customer = input('Введите id Клиента: ')
        with conn.cursor() as cur:
            cur.execute("""
                       select * from customer 
                       where id_customer = %s ; 
                       """, (id_customer,))
            res = cur.fetchall
            for i in cur.fetchall():
                print(i)

    if num_command == '2':
        first_name = input(f'Введите имя: ')
        with conn.cursor() as cur:
            cur.execute("""
                       select * from customer 
                       where first_name =  %s ; 
                       """, (first_name,))
            res = cur.fetchall
            for i in cur.fetchall():
                print(i)

    if num_command == '3':
        last_name = input('Введите Фамилию: ')
        with conn.cursor() as cur:
            cur.execute("""
                       select * from customer 
                       where last_name = %s ; 
                       """, (last_name,))
            res = cur.fetchall
            for i in cur.fetchall():
                print(i)

    if num_command == '4':
        email = input('Введите email: ')
        with conn.cursor() as cur:
            cur.execute("""
                       select * from customer 
                       where email = %s ; 
                       """, (email,))
            res = cur.fetchall
            for i in cur.fetchall():
                print(i)

    if num_command == '5':
        phone = '%' + input('Введите телефон: ') + '%'
        with conn.cursor() as cur:
            cur.execute("""
                       select * from customer 
                       where phone::text like %s ; 
                       """, (phone,))
            res = cur.fetchall
            for i in cur.fetchall():
                print(i)


conn = psycopg2.connect(database="music_services", user="postgres", password="123")
while True:
    command = input('Введите команду:')
    if command == '1':
        create_table(command)
    elif command == '2':
        create_new_customer(first_name=input('Введите Имя'), last_name=input('Введите фамилию'),
                            email_cust=input('Введите email'), phone={})
    elif command == '3':
        add_phone_customer(id_customer=input('Введите id_клиента: '))
    elif command == '4':
        udate_customer_all(id_customer=input('Введите id клиента: '))
    elif command == '5':
        delete_phone_customer(id_customer=input('Введите id клиента: '))
    elif command == '6':
        delete_customer(id_customer=input('Введите id клиента: '))
    elif command == '7':
        search_customer()
    elif command == 'q':
        break

conn.close
