from pprint import pprint
import os

def catalog_recept ():
    with open('recept.txt', encoding= 'utf-8') as file_recept:
        cook_book = {}
        for line in file_recept:
            recept_name = line.strip()
            list_key = ["ingredient_name", "quantity", "measure"]
            goods_list = []
            item_ingredient = file_recept.readline()
            for ingredient in range(int(item_ingredient)):
                good = file_recept.readline()
                good = good.strip()
                goods = good.split('|')
                good_list = {k: v for (k, v) in zip(list_key, goods)}
                goods_list.append(good_list)
            file_recept.readline()
            cook_book[recept_name] = goods_list
        return cook_book

catalog = catalog_recept()

pprint(catalog)

def get_shop_list_by_dishes(dishes, person_count = 1):
    new_list_key = []
    new_list_ingr = []
    d = input('Введите имя:')
    dishes = d.split(', ')
    person_count = int(input('Введите количество персон'))
    new_list = [catalog[k] for k in dishes]
    for b in new_list:
        for i in b:
            new_key = i['ingredient_name']
            new_list_key.append(new_key)
            result = int(i['quantity']) * person_count
            i['quantity'] = result
            del i['ingredient_name']
            new_list_ingr.append(i)
    new_dict_recept_person = {k: v for (k, v) in zip(new_list_key, new_list_ingr)}

    pprint(new_dict_recept_person)


get_shop_list_by_dishes(catalog)

def file_write () :
    catalog = 'new_catolog_file'
    base_pach = os.getcwd()
    full_pach = os.path.join(base_pach, catalog)
    list_file = os.listdir(full_pach)
    k_list = []
    k_2_list = []
    k_3_list = []
    k_list_new = [k_list] + [k_2_list] + [k_3_list]
    write_file_name = 'result.txt'
    with open('new_catolog_file/1.txt', encoding='utf-8') as file_name:
        for line in file_name:
            k = line.split()
            k_list.append(k)
        with open('new_catolog_file/2.txt', encoding='utf-8') as file_name_2:
          for line_2 in file_name_2:
            k_2 = line_2.split()
            k_2_list.append(k_2)
    with open('new_catolog_file/3.txt', encoding='utf-8') as file_name_3:
        for line_3 in file_name_3:
            k_3 = line_3.split()
            k_3_list.append(k_3)
    dict_file_name = {k: v for (k, v) in zip(list_file, k_list_new)}
    dict_file_name_new = {}
    sorted_values = sorted(dict_file_name.values(), key=lambda item: len(item))
    for i in sorted_values:
        for k in dict_file_name.keys():
            if dict_file_name[k] == i:
                dict_file_name_new[k] = dict_file_name[k]

    with open(write_file_name, 'w', encoding='utf-8') as write_file_name:
        write_data = dict_file_name_new
        write_file_name.write(f'{write_data}\n')


file_write()