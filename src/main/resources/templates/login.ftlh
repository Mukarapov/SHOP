<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>SHOP | Вход</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>

</head>
<body>

<div class="container">
    <div class="login-container">
        <h2 class="text-center mb-4">Интернет-магазин</h2>
        <h5 class="text-center mb-3">Авторизация</h5>

        <#if error??>
            <div class="alert alert-danger" role="alert">
                Неверный email или пароль.
            </div>
        </#if>

        <form action="/login" method="post">
            <div class="form-group">
                <label for="username">Эл. почта</label>
                <input type="email" class="form-control" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Пароль</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">

            <button type="submit" class="btn btn-primary btn-block">Войти</button>
        </form>

        <div class="text-center mt-3">
            <a href="/registration">Нет аккаунта? Зарегистрироваться</a>
        </div>

        <hr>

        <!-- Кнопка для просмотра объявлений без авторизации -->
        <div class="text-center mt-3">
            <a href="/" class="btn btn-outline-secondary btn-block">
                Посмотреть объявления без авторизации
            </a>
        </div>
        <div>
            <script src="https://unpkg.com/@vkid/sdk@<3.0.0/dist-sdk/umd/index.js"></script>
            <script type="text/javascript">
                if ('VKIDSDK' in window) {
                    const VKID = window.VKIDSDK;

                    VKID.Config.init({
                        app: 53634801,
                        redirectUrl: 'http://localhost',
                        responseMode: VKID.ConfigResponseMode.Callback,
                        source: VKID.ConfigSource.LOWCODE,
                        scope: '', // Заполните нужными доступами по необходимости
                    });

                    const oAuth = new VKID.OAuthList();

                    oAuth.render({
                        container: document.currentScript.parentElement,
                        oauthList: [
                            'vkid',
                            'ok_ru',
                            'mail_ru'
                        ]
                    })
                        .on(VKID.WidgetEvents.ERROR, vkidOnError)
                        .on(VKID.OAuthListInternalEvents.LOGIN_SUCCESS, function (payload) {
                            const code = payload.code;
                            const deviceId = payload.device_id;

                            VKID.Auth.exchangeCode(code, deviceId)
                                .then(vkidOnSuccess)
                                .catch(vkidOnError);
                        });

                    function vkidOnSuccess(data) {
                        // Обработка полученного результата
                    }

                    function vkidOnError(error) {
                        // Обработка ошибки
                    }
                }
            </script>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
