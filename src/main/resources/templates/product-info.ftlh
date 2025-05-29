<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>SHOP | Товар</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .product-details {
            max-width: 800px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .product-images img {
            margin: 10px;
            height: 100px;
            border-radius: 8px;
        }
    </style>
</head>
<body class="bg-light">

<div class="container product-details">
    <h2 class="text-center mb-4">SHOP</h2>
    <h4 class="text-center mb-4">Подробная информация о товаре</h4>

    <div class="product-images text-center mb-4">
        <#list images as img>
            <img src="/images/${img.id}" class="img-thumbnail" alt="Фото товара">
        </#list>
    </div>

    <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Название товара:</strong> ${product.title}</li>
        <li class="list-group-item"><strong>Описание товара:</strong> ${product.description}</li>
        <li class="list-group-item"><strong>Цена:</strong> ${product.price} ₽</li>
        <li class="list-group-item"><strong>Город:</strong> ${product.city}</li>
        <li class="list-group-item">
            <strong>Автор:</strong>
            <a href="/user/${product.user.id}">${product.user.name}</a>
        </li>
    </ul>

</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
