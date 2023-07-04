# HexletCode
Библиотека позволяет создавать текст с тэгами с помощью вызова метода `HexletCode::Tag.build`. Также можно создавать формы с помощью вызова метода `HexletCode::Form.build`.
Примеры:

```ruby
HexletCode::Tag.build('br')
# <br>
```

```ruby
HexletCode::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image">
```

```ruby
HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">
```

```ruby
HexletCode::Form.form_for(user) do |f|
  f.input :email, type: 'email'
  f.input :password, type: 'password'
  f.submit
end
# <form action="#" method="post">
#   <label for="email">Email</label>
#   <input name="email" id="email">
#   <label for="password">Password</label>
#   <input name="password" id="password">
#   <input type="submit" value="Save">
# </form>
```

## Установка 
Добавьте в Gemfile:

```ruby
gem 'hexlet_code'
```
## Лицензия 
Библиотека создана в рамках проекта [Хекслет](https://ru.hexlet.io).
