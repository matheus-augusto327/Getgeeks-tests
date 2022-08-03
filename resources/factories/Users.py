from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
  hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
  return hashed

def factory_user(target):

  data = {
    'faker': {
      'name': fake.first_name(),
      'lastname': fake.last_name(),
      'email': fake.free_email(),
      'password': 'ogelogel1'
    },
    'wrong_email': {
      'name': 'Pedro',
      'lastname': 'De Lara',
      'email': 'pedro_dl*hotmail.com',
      'password': 'ogelogel1'
    },
    'login': {
      'name': 'Matheus',
      'lastname': 'Augusto',
      'email': 'matheus@gmail.com',
      'password': 'ogelogel1'
    },
    'be_geek': {
      'name': 'Kim',
      'lastname': 'Dotcom',
      'email': 'matheus@gmail.com',
      'password': 'ogelogel1',
      'geek_profile': {
        'whats': '1199999999',
        'desc': 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ',
        'printer_repair': 'Sim',
        'work': 'Remoto',
        'cost': '100'
      }
    },
    'short_desc': {
      'name': 'Peter',
      'lastname': 'Jordam',
      'email': 'lucao@gmail.com',
      'password': 'ogelogel1',
      'geek_profile': {
        'whats': '1199899999',
        'desc': 'Lorem Ipsum',
        'printer_repair': 'Não',
        'work': 'Ambos',
        'cost': '200'
      }
    }
  }

  return data[target]