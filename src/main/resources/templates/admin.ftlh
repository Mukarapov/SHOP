<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>SHOP | Админ-панель</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn-ban {
            background-color: #dc3545;
            color: white;
        }

        .btn-ban:hover {
            background-color: #c82333;
        }

        .header {
            background-color: #343a40;
            color: white;
            padding: 20px;
            border-radius: 10px 10px 0 0;
        }

        .table-wrapper {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow-x: auto;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="table-wrapper">
        <div class="header">
            <h2 class="text-center">Панель администратора</h2>
        </div>
        <table class="table table-hover text-center mb-0">
            <thead class="thead-dark">
            <tr>
                <th>Email</th>
                <th>Телефон</th>
                <th>Активность</th>
                <th>Роли</th>
                <th>Бан</th>
                <th>Удалить</th>
                <th>Инфо</th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                    <td>${user.email}</td>
                    <td>${user.phoneNumber}</td>
                    <td>
                        <span class="badge badge-<#if user.active>success<#else>secondary</#if>">
                            <#if user.active>Активен<#else>Заблокирован</#if>
                        </span>
                    </td>
                    <td>
                        <#list user.roles as role>
                            <span class="badge badge-info">${role}</span>
                        </#list>
                    </td>
                    <td>
                        <form action="/admin/user/ban/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-ban btn-sm">Бан</button>
                        </form>
                    </td>
                    <td>
                        <form action="/admin/user/delete/${user.id}" method="post" onsubmit="return confirm('Вы уверены, что хотите удалить этого пользователя?');">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-danger btn-sm">Удалить</button>
                        </form>
                    </td>
                    <td>
                        <a href="/user/${user.id}" class="btn btn-primary btn-sm">Профиль</a>
                    </td>
                </tr>
            <#else>
                <tr>
                    <td colspan="7"><h5 class="text-muted">Пользователей нет</h5></td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
