<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Результаты поиска</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .alert-info {
            font-size: 1.2rem;
            color: #5bc0de;
            border: 1px solid #5bc0de;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .card {
            border: none;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img-top {
            object-fit: cover;
            height: 200px;
            width: 100%;
        }

        .card-body {
            padding: 15px;
            background-color: #f4f4f4;
            border-top: 1px solid #ddd;
        }

        .card-title {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #28a745;
            font-weight: bold;
        }

        .btn-outline-primary {
            font-size: 0.9rem;
            border-radius: 20px;
            padding: 8px 15px;
            transition: background-color 0.3s ease;
        }

        .btn-outline-primary:hover {
            background-color: #007bff;
            color: #fff;
        }

        .col-md-4 {
            margin-bottom: 20px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h1>Результаты поиска для: ${searchQuery}</h1>

    <div class="row">
        <#if products?has_content>
            <#list products as product>
                <div class="col-md-4 mb-4">
                    <div class="card product-card">
                        <img src="/images/${product.id}" class="card-img-top" alt="${product.title}">
                        <div class="card-body">
                            <h5 class="card-title">${product.title}</h5>
                            <p class="card-text text-success fw-bold">${product.price} ₽</p>
                            <a href="/product/${product.id}" class="btn btn-outline-primary btn-sm">Подробнее</a>
                        </div>
                    </div>
                </div>
            </#list>
        <#else>
            <div class="col-12 text-center">
                <div class="alert alert-info">Товары не найдены</div>
            </div>
        </#if>
    </div>
</div>

</body>
</html>