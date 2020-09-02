# python3-django-postgres
1日で1年分のPython3、PostgreSQL、Djangoの修行ができる何もなくて暑い部屋

## 普通に使う場合

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
## PHYのAPI環境を作る場合

#### ビルド

```bash
$ docker-compose build
```

#### GitのAPIリポジトリをクローン

```bash
$ git clone git@github.sakura.codes:ds/ds-phy-api.git
```

#### クローンしたディレクトリの名前を変更

```
ds-phy-api → app
```

#### マイグレーション

```bash
$ docker-compose run web python app/django/manage.py makemigrations baseapp
```

#### マイグレート

```bash
$ docker-compose run web python app/django/manage.py migrate
```

#### ロードデータ

```bash
$ docker-compose run web python app/django/manage.py loaddata app/django/baseapp/fixtures/*.yaml
```

#### サーバー起動

```bash
$ docker-compose up
```

#### ブラウザでアクセス

```bash
http://localhost:8000/cpanel/api/v1/main_plan_estimates/1111111111111111/export/?customer_name=shiken&inline=t
```


