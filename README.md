## Test and Linter
[![Test and Linter Check](https://github.com/usernaimandrey/api_travelpayouts/actions/workflows/ruby.yml/badge.svg)](https://github.com/usernaimandrey/api_travelpayouts/actions/workflows/ruby.yml)

Как использовать:

- склонируйте репозеторий:
  ```bash
  $ git clone https://github.com/usernaimandrey/api_travelpayouts.git
  ```

- соберите docker image:

  ```bash
  $ make compose-build
  ```

- запустите приложение:

  ```bash
  make compose
  ```

- приложение стартует на http://0.0.0.0:3000/

- запустить тесты и линтер в docker:

  ```bash
  make compose-test
  make compose-lint
  ```

## EndPoints

1. POST   /api/v1/auth - регистрация

```bash
curl -X POST -d name="Fa" -d email="vasy_vetrov_2@a.com" -d password="123456" -d password_confirmation="123456"  http://localhost:3000/api/v1/auth
```

2. POST   /api/v1/sessions - login

```bash
curl -X POST -d email="a@a.com" -d password="12345" http://localhost:3000/api/v1/sessions
```

3. DELETE /api/v1/sessions - logout

```bash
curl -X DELETE http://localhost:3000/api/v1/sessions
```

4. GET    /api/v1/programs - список програм

```bash
curl http://0.0.0.0:3000/api/v1/programs
```
scope account

5. GET    /api/v1/account/users/programs - список программ на которые подписан залогиненый пользователь

```bash
curl -X GET --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs" -d user_id="25" -d program_id="5"  http://localhost:3000/api/v1/account/users/programs
```

6. GET    /api/v1/account/users/:id - информация о пользователе

```bash
curl -X GET --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs" http://localhost:3000/api/v1/account/users/6
```

7. POST   /api/v1/account/subscriptions - подписпться на программу

```bash
curl -X POST --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs" -d user_id="25" -d program_id="6"  http://localhost:3000/api/v1/account/subscriptions
```

8. DELETE /api/v1/account/subscriptions/:id - удалить подписку на программу

```bash
curl -X POST --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs" http://localhost:3000/api/v1/account/subscriptions/10
```

9. GET    /api/v1/account/programs - список программ доступных пользователю

```bash
curl --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs" http://localhost:3000/api/v1/account/programs
```

10. POST /api/v1/account/programs - поиск программы по названию(по вхождению)

```bash
curl -X POST --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs"  -d term="Kiwi"  http://localhost:3000/api/v1/account/programs/search
```

scope admin

11. POST   /api/v1/account/admin/banes - бан на подписку в конкретной программе

```bash
curl -X  POST --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs" -d user_id="2" -d program_id="3" http://localhost:3000//api/v1/account/admin/banes
```

12. DELETE /api/v1/account/admin/banes/:id - удалить бан

```bash
curl -X  POST --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNX0.loaxQI5b6oxv5K-MxgnVLyyhKu8Qa8VDrqdbkWKnGNs"
http://localhost:3000//api/v1/account/admin/banes/3
```
