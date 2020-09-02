# python3-django-postgres
Python3とPostgresのイメージをベースにDjango環境をつくる

#### ビルド

```bash
$ docker-compose build
```

#### Djangoアプリを作成

```bash
$ docker-compose run web django-admin startproject app .
```

#### settings.pyを編集

```python
# settings.py

DATABASES = {
  'default': {
    'ENGINE': 'django.db.backends.postgresql',
    'NAME': 'postgres',
    'USER': 'postgres',
    'PASSWORD': 'postgres',
    'HOST': 'db',
    'PORT': 5432,
  }
}
```

#### マイグレート

```bash
$ docker-compose run web python manage.py migrate
```

#### サーバー起動

```bash
$ docker-compose up
```

#### ブラウザでアクセス

```
http://localhost:8000
```
