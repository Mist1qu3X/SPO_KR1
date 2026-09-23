# Блог-платформа

Учебный монолитный веб-проект по дисциплине «Создание программного обеспечения»
(практические занятия №2–№4). Пользователи регистрируются, публикуют посты с
тегами, лайкают и комментируют их. Есть роли (пользователь / администратор) и
панель администратора со статистикой.

**Стек:** React (Vite) + FastAPI (Python) + PostgreSQL.

## Возможности

- Регистрация и вход (JWT, пароли хешируются bcrypt), роли `user` / `admin`
- Лента постов: поиск по заголовку, фильтр по тегам (топ-5 популярных + поиск), сортировка (новые / популярные)
- CRUD постов с тегами; комментарии; **лайки** постов
- Публичные профили со статистикой; смена имени и **загрузка аватара**
- **Панель администратора**: метрики, графики, управление пользователями, модерация
- Светлая и тёмная темы, иконки (Font Awesome), шрифт Inter, анимации, тосты

## Структура проекта

```
SPO_Project/
├── backend/            # FastAPI + SQLAlchemy + PostgreSQL
│   ├── app/
│   │   ├── main.py         # точка входа, роутеры, CORS
│   │   ├── config.py       # настройки из .env
│   │   ├── database.py     # подключение к БД, сессии
│   │   ├── models.py       # ORM-модели (users, posts, comments, tags, post_likes)
│   │   ├── schemas.py      # Pydantic-схемы
│   │   ├── auth.py         # bcrypt + JWT + проверка ролей
│   │   └── routers/        # auth, posts (+comments, likes), tags, users, admin
│   ├── schema.sql          # эталонный DDL-скрипт схемы БД
│   ├── create_db.py        # создание базы данных blog_db
│   ├── migrate.py          # миграция существующей БД (role, post_likes, админ)
│   ├── seed.py             # тестовые данные
│   └── requirements.txt
├── frontend/           # React + React Router + axios
│   └── src/
│       ├── pages/          # лента, пост, профиль, админ-панель, вход, регистрация, формы
│       ├── components/     # Navbar, PostCard, Avatar, LikeButton, BarChart, PostForm
│       ├── context/        # Auth, Theme (тёмная тема), Toast (уведомления)
│       └── api.js          # axios-клиент с JWT
└── docs/               # отчёты к ПЗ №2, №3, №4 (.docx) + diagrams/ (ER, use-case, архитектура)
```

## Требования

- Python 3.10+
- Node.js 18+
- PostgreSQL 13+ (запущен на localhost:5432)

## Запуск backend

```bash
cd backend
python -m venv venv
venv\Scripts\activate            # Windows (Linux/Mac: source venv/bin/activate)
pip install -r requirements.txt
```

Настроить `.env` (уже создан; при необходимости поправить пароль от PostgreSQL):

```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=blog_db
DB_USER=postgres
DB_PASSWORD=ваш_пароль
SECRET_KEY=любая_длинная_случайная_строка
```

Создать базу, наполнить данными и запустить сервер:

```bash
python create_db.py     # создаёт базу blog_db
python seed.py          # демо-данные (админ, пользователи, посты, лайки)
# если база уже была создана в старой версии — вместо seed примените:
# python migrate.py     # добавит роль, таблицу лайков и аккаунт админа
uvicorn app.main:app --reload --port 8000
```

- API: http://localhost:8000
- Swagger-документация: http://localhost:8000/docs

## Запуск frontend

```bash
cd frontend
npm install
npm run dev
```

Открыть http://localhost:5173

## Демо-доступ

| Роль          | Логин | Пароль      |
|---------------|-------|-------------|
| Администратор | admin | admin123    |
| Пользователь  | alice | password123 |
| Пользователь  | bob   | password123 |

## Основные эндпоинты API

| Метод  | Путь                            | Доступ       | Описание                       |
|--------|---------------------------------|--------------|--------------------------------|
| POST   | /api/auth/register              | все          | Регистрация                    |
| POST   | /api/auth/login                 | все          | Вход, выдача JWT               |
| GET    | /api/auth/me                    | авторизован  | Текущий пользователь           |
| PATCH  | /api/auth/me                    | авторизован  | Смена имени / аватара          |
| GET    | /api/posts                      | все          | Лента (`tag`,`search`,`sort`)  |
| GET    | /api/posts/{id}                 | все          | Один пост                      |
| POST   | /api/posts                      | авторизован  | Создать пост                   |
| PUT    | /api/posts/{id}                 | автор/админ  | Редактировать пост             |
| DELETE | /api/posts/{id}                 | автор/админ  | Удалить пост                   |
| POST   | /api/posts/{id}/like            | авторизован  | Поставить лайк                 |
| DELETE | /api/posts/{id}/like            | авторизован  | Убрать лайк                    |
| GET    | /api/posts/{id}/comments        | все          | Комментарии поста              |
| POST   | /api/posts/{id}/comments        | авторизован  | Добавить комментарий           |
| DELETE | /api/posts/{id}/comments/{cid}  | автор/админ  | Удалить комментарий            |
| GET    | /api/tags                       | все          | Теги со счётчиками (`search`,`limit`)|
| GET    | /api/users/{username}           | все          | Профиль пользователя           |
| GET    | /api/admin/stats                | админ        | Статистика и данные для графиков|
| GET    | /api/admin/users                | админ        | Список пользователей           |
| DELETE | /api/admin/users/{id}           | админ        | Удалить пользователя           |

## Отчёт и диаграммы

В папке `docs/` — единый отчёт по практическим занятиям №2–№4 (11 страниц):

- `Отчёт_ПЗ2-4_Блог-платформа.docx` — анализ требований и планирование, проектирование БД, реализация и проверка, ответы на контрольные вопросы, DDL-приложение.

Диаграммы (PNG) — в `docs/diagrams/`:

- `er_diagram.png` — ER-диаграмма БД (стиль DBeaver)
- `usecase_diagram.png` — диаграмма вариантов использования (include/extend)
- `feature_map.png` — карта функций MVP / Future по ролям

> Перед сдачей заполните ФИО и номер группы на титульном листе отчёта.
