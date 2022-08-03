from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
  hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
  return hashed

def factory_user():
  return {
    'name': fake.first_name(),
    'lastname': fake.last_name(),
    'email': fake.free_email(),
    'password': 'ogelogel1'
  }

def factory_wrong_email():
  first_name = fake.first_name()

  return {
    'name': fake.first_name(),
    'lastname': fake.last_name(),
    'email': first_name.lower() + '&gmail.com',
    'password': 'ogelogel1'
  }

def factory_user_login():
  return {
    'name': 'Matheus',
    'lastname': 'Augusto',
    'email': 'matheus@gmail.com',
    'password': 'ogelogel1'
  }

def factory_user_be_geek():
  return {
    'name': 'Kim',
    'lastname': 'Dotcom',
    'email': 'matheus@gmail.com',
    'password': 'ogelogel1'
  }