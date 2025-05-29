<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Профиль пользователя | SHOP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
        }

        .profile-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            width: 100%;
        }

        .product-item {
            border-bottom: 1px solid #dee2e6;
            padding: 15px 0;
        }

        .product-item:last-child {
            border-bottom: none;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 500;
        }

        .product-price {
            color: #198754;
        }

        .no-products {
            color: #6c757d;
            font-style: italic;
        }

        .error-message {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center">
    <div class="profile-card mt-5 col-md-10 col-lg-8 col-xl-6">
        <h2 class="mb-4 text-primary text-center">Профиль пользователя: ${user.name}</h2>

        <p><strong>📞 Телефон:</strong> ${user.phoneNumber}</p>
        <p><strong>📧 Email:</strong> ${user.email}</p>

        <hr class="my-4">

        <h4 class="mb-3">Товары пользователя</h4>

        <#list products as product>
            <div class="product-item">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="product-title">${product.title}</span>
                    <span class="product-price">${product.price} ₽</span>
                </div>
                <a href="/product/${product.id}" class="text-decoration-none">Подробнее →</a>
            </div>
        <#else>
            <p class="no-products">Этот пользователь пока не разместил товары.</p>
        </#list>

        <#if errorMessage??>
            <div class="mt-4 error-message">${errorMessage}</div>
        </#if>
    </div>
</div>

<!-- Bootstrap JS (необязательно) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
