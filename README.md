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

```
$ docker-compose build
```

#### GitのAPIリポジトリをクローン

```
$ git clone git@github.sakura.codes:ds/ds-phy-api.git
```

#### クローンしたディレクトリの名前を変更

```
ds-phy-api → app
```

#### マイグレーション

```
$ docker-compose run web python app/django/manage.py makemigrations baseapp
```

#### マイグレート

```
$ docker-compose run web python app/django/manage.py migrate
```

#### ロードデータ

```
$ docker-compose run web python app/django/manage.py loaddata app/django/baseapp/fixtures/*.yaml
```

#### サーバー起動

```
$ docker-compose up
```

#### ブラウザでアクセス

```
# 新規追加見積書
http://localhost:8000/cpanel/api/v1/main_plan_estimates/1111111111111111/export/?customer_name=shiken&inline=t

# オプション追加見積書
http://localhost:8000/cpanel/api/v1/add_option_estimates/2222222222222222/export/?customer_name=shiken&raw_output=1&develop.member_id=abc01234&develop.account_code=test_account

# 新規追加申込書
http://localhost:8000/cpanel/api/v1/main_plan_estimates/1111111111111111/export/?customer_name=shiken
```


