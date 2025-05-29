<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>SHOP | Регистрация</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: 80px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="register-container">
        <h2 class="text-center mb-4">Интернет-магазин</h2>
        <h4 class="text-center mb-4">Регистрация</h4>

        <form action="/registration" method="post">
            <div class="form-group">
                <label for="name">Имя пользователя</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Эл. почта</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Номер телефона</label>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
            </div>

            <div class="form-group">
                <label for="password">Пароль</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary btn-block">Зарегистрироваться</button>
        </form>

        <#if errorMessage??>
            <div class="alert alert-danger mt-3" role="alert">
                ${errorMessage}
            </div>
        </#if>

        <div class="text-center mt-3">
            Уже есть аккаунт? <a href="/login">Войти</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
