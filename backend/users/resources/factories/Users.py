def factory_user_session(): 
  name = 'Kate Bishop'
  email = 'kate@hotmail.com'
  password = 'pwd123'

  data = {
    'signup': {
      'name': name,
      'email': email,
      'password': password,
    },
    'login': {
      'email': email,
      'password': password,
    }
  }

  return data[target]