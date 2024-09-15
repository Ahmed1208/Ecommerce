<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <title>Prime Mart - Grocery Website Template</title>
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


    </head>

    <body>

    <c:if test="${not empty requestScope.errorMessage}">
        <script>
            // Ensure this script runs after the external JavaScript file is loaded
            document.addEventListener('DOMContentLoaded', function() {
                showNotification("${requestScope.errorMessage}", 'error');
            });
        </script>
    </c:if>

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
                            <a href="/ecommerce" class="nav-item nav-link active">Home</a>
                            <a href="/ecommerce/shop-page" class="nav-item nav-link">Shop</a>
                        </div>
                        <div class="d-flex m-3 me-0">

                            <!-- Cart Icon with Badge -->
                            <a href="/ecommerce/getCart" class="position-relative me-4 my-auto" style="position: relative;">
                                <i class="fa fa-shopping-bag fa-2x text-dark"></i>

                                <c:if test="${empty sessionScope.cartSize}">
                                    <span id="cart-size" class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">0</span>
                                </c:if>
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

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/ecommerce">Home</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Fresh fruits shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input id="search-input2" type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-2" class="input-group-text p-3" onclick="searchtext()"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">Default Sorting:</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" >
                                        <option value="Nothing">Nothing</option>
                                        <option value="Price">Price</option>
                                        <option value="Quantity">Quantity</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                     <div class="col-lg-12">
                                            <div class="mb-3">
                                                <h4>Categories</h4>
                                                <ul class="list-unstyled fruite-categorie">
                                                    <c:forEach var="category" items="${ParentCategories}">
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <!-- Parent category as a clickable link -->
                                                                <a href="#" onclick="toggleSubcategories(event, '${category.id}')">
                                                                    <i class="fas fa-apple-alt me-2"></i>${category.name}
                                                                </a>
                                                            </div>

                                                            <!-- Subcategories container -->
                                                            <div id="subcategories-${category.id}" class="subcategories-container" style="display: none; padding-left: 15px;">
                                                                <ul class="list-unstyled">
                                                                    <c:forEach var="subcategory" items="${category.childCategories}">
                                                                        <li class="subcategory-item">
                                                                            <!-- Subcategory as a checkbox with data-name attribute -->
                                                                            <input type="checkbox" name="subcategories" value="${subcategory.id}" id="subcategory_${subcategory.id}" data-name="${subcategory.name}">
                                                                            <label for="subcategory_${subcategory.id}">
                                                                                    ${subcategory.name}
                                                                            </label>
                                                                        </li>
                                                                    </c:forEach>

                                                                </ul>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Price</h4>
                                            <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="500" value="0" oninput="amount.value=rangeInput.value">
                                            <output id="amount" name="amount" min-velue="0" max-value="500" for="rangeInput">0</output>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <button type="button" class="btn btn-primary w-100" onclick="performFilter()">Filter</button>
                                    </div>
                                    <div class="col-lg-12">
                                        <h4 class="mb-3">Featured products</h4>
                                        <c:forEach var="product" items="${products}" end="2">
                                        <div class="d-flex align-items-center justify-content-start" style="cursor: pointer;" onclick="window.location.href='/ecommerce/show-product?id=${product.id}'">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="${product.image}" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">${product.productName}</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">${product.price} $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">${product.price *1.25} $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
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
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">

                                    <c:forEach var="product" items="${products}">
                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                            <!-- Overlay link -->
                                            <a href="/ecommerce/show-product?id=${product.id}" class="card-overlay">
                                                <div class="rounded position-relative fruite-item">
                                                    <!-- Image container with fixed height and object-fit for uniform display -->
                                                    <div class="fruite-img" style="height: 250px; overflow: hidden;">
                                                        <img src="${product.image}" class="img-fluid w-100 rounded-top" alt="${product.productName}"
                                                             style="object-fit: cover; height: 100%; width: 100%;">
                                                    </div>
                                                    <!-- Category badge -->
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                            ${product.category.name}
                                                    </div>
                                                    <!-- Content with fixed height for description -->
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>${product.productName}</h4>
                                                        <p style="height: 60px; overflow: hidden; text-overflow: ellipsis;">
                                                                ${product.description}
                                                        </p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">${product.price}</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"
                                                               onclick="event.preventDefault(); addToCart('${product.id}', '${sessionScope.user.id}')">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>


                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <c:choose>
                                                    <c:when test="${i == currentPage}">
                                                        <a id=currPage class="active rounded">${i}</a> <!-- Current page -->
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="javascript:void(0);" onclick="updatePageNumber(${i})" class="rounded">${i}</a>
                                                    </c:otherwise>

                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->



    <jsp:include page="footer.jsp"/>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
       <script src="js/addToCartButton.js"></script>

       <script>
           function performFilter(newPageNumber) {
               var url = "/ecommerce/shop-page?";

               // Get the current URL parameters
               var queryString = window.location.search;

               // Create a URLSearchParams object to easily manipulate the query parameters
               var params = new URLSearchParams(queryString);

               // Set the new page number, overriding any existing one
               if (newPageNumber) {
                   params.set("pageNumber", newPageNumber);
               }

               // Get search text and add it to the URL if not empty
               const searchText = document.getElementById('search-input2').value.trim();
               if (searchText) {
                   params.set("searchText", encodeURIComponent(searchText));
               }

               // Get selected subcategories
               const selectedSubcategories = Array.from(document.querySelectorAll('input[name="subcategories"]:checked'))
                   .map(cb => cb.getAttribute('data-name'))
                   .filter(name => name);

               // Clear previous subCategories and add the new ones
               params.delete("subCategories");
               if (selectedSubcategories.length > 0) {
                   selectedSubcategories.forEach(name => {
                       params.append("subCategories", encodeURIComponent(name));
                   });
               }

               // Get price range
               const maxprice = document.getElementById('rangeInput').value;
               if (maxprice !== "0") {
                   params.set("minPrice", "0");
                   params.set("maxPrice", maxprice);
               }

               // Get sort option
               const sortOption = document.getElementById('fruits').value;
               if (sortOption === "Price") {
                   params.set("sortByPrice", "true");
               } else if (sortOption === "Quantity") {
                   params.set("sortByQuantity", "true");
               }

               // Redirect to the new URL with updated parameters
               window.location.href = url + params.toString();
           }

           function updatePageNumber(newPageNumber) {
               // Get the current query string from the URL
               var queryString = window.location.search;

               // Create a URLSearchParams object to manipulate the query parameters
               var params = new URLSearchParams(queryString);

               // Set the new page number, overriding any existing one
               params.set("pageNumber", newPageNumber);

               // Construct the new URL by appending the updated query parameters
               var newUrl = window.location.pathname + "?" + params.toString();

               // Redirect to the new URL
               window.location.href = newUrl;
           }

           function searchtext() {
               // Get the search text from the input field
               const searchText = document.getElementById('search-input2').value.trim();

               // Process the search text or perform the search action
               if (searchText) {
                   // Example: Redirect to a search results page with the query
                   const url = '/ecommerce/shop-page?searchText=' + encodeURIComponent(searchText);
                   window.location.href = url;
               } else {
                   // Handle the case where the search text is empty
                   console.log('Search text is empty');
               }


           }

       </script>

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

       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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