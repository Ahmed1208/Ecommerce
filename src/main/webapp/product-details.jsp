<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">


        <style>
            .notification {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                opacity: 0.9;
                transition: opacity 0.3s ease;
                padding: 15px;
                border-radius: 5px;
                color: #fff;
                z-index: 1000;
            }

            .notification.success {
                background-color: #4caf50;
            }

            .notification.error {
                background-color: #f44336;
            }
        </style>
    </head>

    <body>

    <div id="notification-container" style="position: fixed; top: 20px; right: 20px; z-index: 1000;"></div>


    <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">15 St Borhan ,Maadi</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Prime.mart@gmail.com</a></small>
                    </div>

                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="home.jsp" class="navbar-brand"><h1 class="text-primary display-6">Prime Mart</h1></a>

                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="/ecommerce/" class="nav-item nav-link active">Home</a>
                            <a href="/ecommerce/shop-page" class="nav-item nav-link">Shop</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <!-- Cart Icon with Badge -->
                            <a href="/ecommerce/getCart" class="position-relative me-4 my-auto" style="position: relative;">
                                <i class="fa fa-shopping-bag fa-2x text-dark"></i>

                                <%--                                assign the value from the local storage                    --%>
                                <c:if test="${empty sessionScope.cartSize}">
                                    <span id="cart-size" class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">0</span>

                                    <script>
                                        // On page load, check if cartSize exists in localStorage
                                        window.onload = function() {
                                            let cartSize = localStorage.getItem('cartSize') || 0;
                                            document.getElementById('cart-size').innerText = cartSize;
                                        };
                                    </script>
                                </c:if>
                                <%--    /////////////////////////////////////////////////////////////////////////////////--%>
                                <c:if test="${!empty sessionScope.cartSize}">
                                    <span id="cart-size" class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.cartSize}</span>
                                </c:if>
                            </a>
                            <!-- Profile Icon -->
                            <a href="/ecommerce/profile" class="my-auto" style="position: relative; margin-right: 15px;">
                                <i class="fas fa-user fa-2x text-dark"></i>
                                <span class="tooltip-text">Profile</span>
                            </a>

                            <c:if test="${not empty sessionScope.user}">
                                <!-- Modal Trigger -->
                                <a href="javascript:void(0);" class="my-auto" style="position: relative; margin-right: 15px;" onclick="openPaymentModal()">
                                    <div class="d-flex align-items-center justify-content-center" style="gap: 8px;">
                                        <i class="fas fa-wallet fa-2x text-dark"></i>
                                        <span class="fw-bold" style="font-size: 18px;"> $${sessionScope.user.balance}</span>
                                    </div>
                                    <span class="tooltip-text">Wallet</span>
                                </a>

                                <!-- Logout Icon -->
                                <a href="/ecommerce/logout" class="my-auto" style="position: relative; margin-left: 20px;">
                                    <i class="fas fa-sign-out-alt fa-2x text-dark"></i>
                                    <span class="tooltip-text">Logout</span>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop Detail</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/ecommerce">Home</a></li>
                <li class="breadcrumb-item"><a href="/ecommerce/shop-page">Shop</a></li>
                <li class="breadcrumb-item active text-white">Product Details</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


    <c:if test="${not empty errorMessage}">
        <div>${requestScope.errorMessage}</div>
    </c:if>

        <!-- Single Product Start -->
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border rounded">
                                    <a href="#">
                                        <img src="${product.image}" class="img-fluid rounded" alt="Image">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4 class="fw-bold mb-3">${product.productName}</h4>
                                <p class="mb-3">Category: ${product.category.name}</p>
                                <h5 class="fw-bold mb-3">Price: ${product.price}</h5>
                                <div class="d-flex mb-4">
                                    <c:if test="${product.quantity == 0}">
                                        <div style="color: red;">Not available</div>
                                    </c:if>
                                    <c:if test="${product.quantity > 0}">
                                        <div style="color: green;">Available</div>
                                    </c:if>
                                </div>
                                <p class="mb-4"></p>
                                <div class="input-group quantity mb-5" style="width: 100px;">

                                </div>
                                <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" onclick="event.preventDefault(); addToCart('${product.id}', '${sessionScope.user.id}')"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                            </div>
                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">Description</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>${product.description}</p>
                                    </div>
                                    <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-3">
                        <div class="row g-4 fruite">
                            <div class="col-lg-12">
                                <div class="input-group w-100 mx-auto d-flex mb-4">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <h4 class="mb-4">Similar products</h4>
                                <c:forEach var="p" items="${requestScope.relatedProducts}" end="3">
                                <div class="d-flex align-items-center justify-content-start" href="show-product?id=${p.id}">
                                    <div class="rounded" style="width: 100px; height: 100px;">
                                        <img src="${p.image}" class="img-fluid rounded" alt="${p.productName}">
                                    </div>
                                    <div>
                                        <h6 class="mb-2">${p.productName}</h6>
                                        <div class="d-flex mb-2">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="d-flex mb-2">
                                            <h5 class="fw-bold me-2">2.99 $</h5>
                                            <h5 class="text-danger text-decoration-line-through">${p.price} $</h5>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <div class="d-flex justify-content-center my-4">
                                    <a href="/ecommerce/shop-page" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="position-relative">
                                    <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                    <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                        <h3 class="text-secondary fw-bold">Fresh <br> Fruits </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h1 class="fw-bold mb-0">Related products</h1>
                <div class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">

                        <c:forEach var="p" items="${requestScope.relatedProducts}">
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <!-- Image container -->
                                <div class="vesitable-img" style="height: 200px; overflow: hidden;">
                                    <img src="${p.image}" class="img-fluid w-100 rounded-top" alt="" style="object-fit: cover; height: 100%; width: 100%;">
                                </div>
                                <!-- Category Badge -->
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                                <!-- Product Details -->
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>${p.productName}</h4>
                                    <!-- Description with fixed height and ellipsis for overflow -->
                                    <p style="height: 60px; overflow: hidden; text-overflow: ellipsis;">
                                            ${p.description}
                                    </p>
                                    <!-- Price and Add to Cart Button -->
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$ ${p.price} / kg</p>
                                        <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"
                                           onclick="event.preventDefault(); addToCart('${p.id}', '${sessionScope.user.id}')">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>




                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->
    

        <jsp:include page="footer.jsp"/>
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/addToCartButton.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery CDN -->

    </body>

</html>