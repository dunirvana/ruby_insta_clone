# README

Ruby project to support an Instagram clone, to study the language.

## Commands used during the code:

* Create project
```
rails new insta_clone -j esbuild -d postgresql
```

* Add gems
```
gem "rails-i18n"
gem "pry"
```

* Create with scaffold controller/view/model/migration (model called "post" with property "description")
```
rails g scaffold post description:string
```

* Create database
```
rails db:create
```

* Create tables
```
rails db:migrate
```

