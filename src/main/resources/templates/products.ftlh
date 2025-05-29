
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>SHOP | Объявления</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        .product-img {
            height: 180px;
            object-fit: cover;
            border-radius: 6px;
        }

        .product-card {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border: none;
            border-radius: 10px;
            transition: transform 0.2s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .form-section {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/">SHOP</a>
        <div class="ms-auto">
            <#if user.email??>
                <span class="text-white me-3">Добро пожаловать, <strong>${user.name}</strong></span>
                <form action="/logout" method="post" class="d-inline">
                    <input type="hidden" name="_csrf" value="${_csrf.token!""}">
                    <button type="submit" class="btn btn-outline-light btn-sm">Выйти</button>
                </form>
                <#if user.isAdmin()>
                    <a href="/admin" class="btn btn-warning btn-sm ms-2">Панель администратора</a>
                </#if>
            <#else>
                <a href="/login" class="btn btn-outline-light btn-sm">Войти</a>
            </#if>
            <a href="/profile">
                <img src="/static/images/avatar.png" alt="mdo"
                     width="32" height="32" class="rounded-circle">
            </a>
        </div>
    </div>
</nav>

<!-- Main container -->
<div class="container py-4">

    <h2 class="text-center text-primary mb-4">Товары со всей России</h2>

    <!-- Поиск -->
    <form action="/search" method="get" class="row justify-content-center mb-4">
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" name="title" class="form-control" placeholder="Поиск по названию">
                <button class="btn btn-primary" type="submit">Поиск</button>
            </div>
        </div>
    </form>

    <!-- Список товаров -->
    <div class="row" >
        <#list products as product>
            <div class="col-md-4 mb-4">
                <div class="card product-card">

                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text text-success fw-bold">${product.price} ₽</p>
                        <a href="/product/${product.id}" class="btn btn-outline-primary btn-sm">Подробнее</a>
                    </div>
                </div>
            </div>
        <#else>
            <div class="col-12 text-center">
                <div class="alert alert-info">Товары отсутствуют</div>
            </div>
        </#list>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>


<#--<!DOCTYPE html>-->
<#--<html lang="en">-->
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <title>SHOP</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>SHOP</h1><hr>-->
<#--<#if user.email??>-->
<#--    <h3>Имя пользователя: <i>${user.name}</i></h3>-->
<#--    <form action="/logout" method="post">-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token!""}">-->
<#--        <input type="submit" value="Выйти">-->
<#--    </form>-->
<#--    <#if user.isAdmin()>-->
<#--        <a href="/admin">Панель администратора</a>-->
<#--    </#if>-->
<#--<#else>-->
<#--    <h1> <a href="/login">Войти</a></h1>-->
<#--</#if>-->
<#--<h4>Товары со всей России</h4>-->

<#--<form action="/" method="get">-->
<#--    Поиск по названию объявления: <input type="text" name="title"><br>-->
<#--    <input type="submit" value="Поиск"/>-->
<#--</form>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} рублей| <a href="/product/${product.id}"> Подробнее...</a></p>-->
<#--    </div>-->
<#--<#else>-->
<#--    <h3>Товары отсутствуют</h3>-->
<#--</#list>-->
<#--<#if user.email??>-->
<#--    <hr>-->
<#--    <h3>Создать новый товар</h3>-->
<#--    <form action="/product/create" method="post" enctype="multipart/form-data">-->
<#--        Название обьявления: <input type="text" name="title"/><br><br>-->
<#--        Описание обьявления: <input type="text" name="description"/><br><br>-->
<#--        Цена: <input type="number" name="price"/><br><br>-->
<#--        Город: <input type="text" name="city"/><br><br>-->
<#--        Имя: <input type="text" name="author"/><br><br>-->
<#--        Первая фотография: <input type="file" name="file1"/><br><br>-->
<#--        Вторая фотография: <input type="file" name="file2"/><br><br>-->
<#--        Третья фотография: <input type="file" name="file3"/><br><br>-->

<#--        <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--        <input type="submit" value="Добавить товар"/>-->
<#--    </form>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->