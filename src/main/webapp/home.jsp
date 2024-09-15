<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
<%--    <%@ page session="false" %>--%>
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
    <link href="css/header.css" rel="stylesheet">
    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>


<jsp:include page="header.jsp"/>

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


<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
            </div>
            <div class="col-md-12 col-lg-5">
                <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active rounded">
                            <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                            <a href="/ecommerce/shop-page" class="btn px-4 py-2 text-white rounded">Fruites</a>
                        </div>
                        <div class="carousel-item rounded">
                            <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                            <a href="/ecommerce/shop-page" class="btn px-4 py-2 text-white rounded">Vegitables</a>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->


<!-- Featurs Section Start -->
<div class="container-fluid featurs py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-car-side fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Free Shipping</h5>
                        <p class="mb-0">Free on order over $300</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-user-shield fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Security Payment</h5>
                        <p class="mb-0">100% security payment</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-exchange-alt fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>30 Day Return</h5>
                        <p class="mb-0">30 day money guarantee</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fa fa-phone-alt fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>24/7 Support</h5>
                        <p class="mb-0">Support every time fast</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Featurs Section End -->


<!-- Fruits Shop Start-->
<%--<div class="container-fluid fruite py-5">--%>
<%--    <div class="container py-5">--%>
<%--        <div class="tab-class text-center">--%>
<%--            <div class="row g-4">--%>
<%--                <div class="col-lg-4 text-start">--%>
<%--                    <h1>Our Organic Products</h1>--%>
<%--                </div>--%>
<%--                <div class="col-lg-8 text-end">--%>
<%--                    <ul class="nav nav-pills d-inline-flex text-center mb-5">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">--%>
<%--                                <span class="text-dark" style="width: 130px;">All Products</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">--%>
<%--                                <span class="text-dark" style="width: 130px;">Vegetables</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">--%>
<%--                                <span class="text-dark" style="width: 130px;">Fruits</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">--%>
<%--                                <span class="text-dark" style="width: 130px;">Bread</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">--%>
<%--                                <span class="text-dark" style="width: 130px;">Meat</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="tab-content">--%>
<%--                <div id="tab-1" class="tab-pane fade show p-0 active">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="row g-4">--%>
<%--                                <c:forEach var="product" items="${requestScope.products}" >--%>
<%--                                    <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                        <div class="rounded position-relative fruite-item">--%>
<%--                                            <div class="fruite-img">--%>
<%--                                                <img src="${product.image}" class="img-fluid w-100 rounded-top" alt="${product.productName}">--%>
<%--                                            </div>--%>
<%--                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.category.name}</div>--%>
<%--                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                                <h4>${product.productName}</h4>--%>
<%--                                                <p>${product.description}</p>--%>
<%--                                                <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                    <p class="text-dark fs-5 fw-bold mb-0">$${product.price} / kg</p>--%>
<%--                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="event.preventDefault(); addToCart('${product.id}', '${sessionScope.user.id}')"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </c:forEach>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="tab-2" class="tab-pane fade show p-0">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="row g-4">--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Grapes</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Raspberries</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="tab-3" class="tab-pane fade show p-0">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="row g-4">--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Oranges</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Apple</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="tab-4" class="tab-pane fade show p-0">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="row g-4">--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Grapes</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Apricots</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="tab-5" class="tab-pane fade show p-0">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="row g-4">--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Banana</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Raspberries</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                    <div class="rounded position-relative fruite-item">--%>
<%--                                        <div class="fruite-img">--%>
<%--                                            <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">--%>
<%--                                        </div>--%>
<%--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>--%>
<%--                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">--%>
<%--                                            <h4>Oranges</h4>--%>
<%--                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>--%>
<%--                                            <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>--%>
<%--                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Fruits Shop End-->



<!-- Vesitable Shop Start-->
<div class="container-fluid vesitable py-5">
    <div class="container py-5">
        <h1 class="mb-0">Our New Products</h1>
        <div class="owl-carousel vegetable-carousel justify-content-center">
            <c:forEach var="product" items="${requestScope.products}" >
            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="${product.image}" class="img-fluid w-100 rounded-top" alt="">
                </div>
                <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${product.category.name}</div>
                <div class="p-4 rounded-bottom">
                    <h4>${product.productName}</h4>
                    <p>${product.description}</p>
                    <div class="d-flex justify-content-between flex-lg-wrap">
                        <p class="text-dark fs-5 fw-bold mb-0">$${product.price} / kg</p>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="event.preventDefault(); addToCart('${product.id}', '${sessionScope.user.id}')"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Vesitable Shop End -->


<!-- Banner Section Start-->
<div class="container-fluid banner bg-secondary my-5">
    <div class="container py-5">
        <div class="row g-4 align-items-center">
            <div class="col-lg-6">
                <div class="py-4">
                    <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                    <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                    <p class="mb-4 text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="position-relative">
                    <img src="img/baner-1.png" class="img-fluid w-100 rounded" alt="">
                    <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute" style="width: 140px; height: 140px; top: 0; left: 0;">
                        <h1 style="font-size: 100px;">1</h1>
                        <div class="d-flex flex-column">
                            <span class="h2 mb-0">50$</span>
                            <span class="h4 text-muted mb-0">kg</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->


<!-- Bestsaler Product Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mx-auto mb-5" style="max-width: 700px;">
            <h1 class="display-4">Bestseller Products</h1>
            <p>Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
        </div>
        <div class="row g-4">
            <c:forEach var="product" items="${requestScope.products}" begin="0" end="4" >
            <div class="col-lg-6 col-xl-4">
                <div class="p-4 rounded bg-light">
                    <div class="row align-items-center">
                        <div class="col-6">
                            <img src="${product.image}" class="img-fluid rounded-circle w-100" alt="">
                        </div>
                        <div class="col-6">
                            <a href="show-product?id=${product.id}" class="h5"> ${product.productName}</a>
                            <div class="d-flex my-3">
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star text-primary"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <h4 class="mb-3">${product.price} $</h4>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="event.preventDefault(); addToCart('${product.id}', '${sessionScope.user.id}')"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
                </c:forEach>

            <c:forEach var="product" items="${requestScope.products}" begin="5" >

            <div class="col-md-6 col-lg-6 col-xl-3">
                <div class="text-center">
                    <img src="${product.image}" class="img-fluid rounded" alt="">
                    <div class="py-4">
                        <a href="show-product?id=${product.id}" class="h5">${product.productName}</a>
                        <div class="d-flex my-3 justify-content-center">
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4 class="mb-3">${product.price} $</h4>
                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="event.preventDefault(); addToCart('${product.id}', '${sessionScope.user.id}')"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>
    </div>
</div>
<!-- Bestsaler Product End -->


<!-- Fact Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="bg-light p-5 rounded">
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>satisfied customers</h4>
                        <h1>1963</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality of service</h4>
                        <h1>99%</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality certificates</h4>
                        <h1>33</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>Available Products</h4>
                        <h1>55</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fact Start -->

<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
    <div class="container py-5">
        <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
            <div class="row g-4">
                <div class="col-lg-3">
                    <a href="#">
                        <h1 class="text-primary mb-0">Prime Mart</h1>
                        <p class="text-secondary mb-0">Fresh products</p>
                    </a>
                </div>
                <div class="col-lg-3">
                    <div class="d-flex justify-content-end pt-3">
                        <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <div class="footer-item">
                    <h4 class="text-light mb-3">Why People Like us!</h4>
                    <p class="mb-4">typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                    <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3">Shop Info</h4>
                    <a class="btn-link" href="">About Us</a>
                    <a class="btn-link" href="">Contact Us</a>
                    <a class="btn-link" href="">Privacy Policy</a>
                    <a class="btn-link" href="">Terms & Condition</a>
                    <a class="btn-link" href="">Return Policy</a>
                    <a class="btn-link" href="">FAQs & Help</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3">Account</h4>
                    <a class="btn-link" href="">My Account</a>
                    <a class="btn-link" href="">Shop details</a>
                    <a class="btn-link" href="">Shopping Cart</a>
                    <a class="btn-link" href="">Wishlist</a>
                    <a class="btn-link" href="">Order History</a>
                    <a class="btn-link" href="">International Orders</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer-item">
                    <h4 class="text-light mb-3">Contact</h4>
                    <p>Address: 1429 Netus Rd, NY 48247</p>
                    <p>Email: Example@gmail.com</p>
                    <p>Phone: +0123 4567 8910</p>
                    <p>Payment Accepted</p>
                    <img src="img/payment.png" class="img-fluid" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->

<!-- Copyright Start -->
<div class="container-fluid copyright bg-dark py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
            </div>
            <div class="col-md-6 my-auto text-center text-md-end text-white">
                <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
            </div>
        </div>
    </div>
</div>
<!-- Copyright End -->



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
</body>

</html>