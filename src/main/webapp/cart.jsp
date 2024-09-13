<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
          rel="stylesheet">

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
</head>

<body >

<!-- Spinner Start -->
<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
                                                                                                 class="text-white">123
                    Street, New York</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
            </div>
            <div class="top-link pe-2">
                <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Fruitables</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="index.html" class="nav-item nav-link">Home</a>
                    <a href="shop.html" class="nav-item nav-link">Shop</a>
                    <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="cart.html" class="dropdown-item active">Cart</a>
                            <a href="chackout.html" class="dropdown-item">Chackout</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex m-3 me-0">
                    <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                            data-bs-toggle="modal" data-bs-target="#searchModal"><i
                            class="fas fa-search text-primary"></i></button>
                    <a href="#" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                              style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                    </a>
                    <a href="#" class="my-auto">
                        <i class="fas fa-user fa-2x"></i>
                    </a>
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
                    <input type="search" class="form-control p-3" placeholder="keywords"
                           aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Cart</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Cart</li>
    </ol>
</div>
<!-- Single Page Header End -->

<script>
    window.onload = function () {
        calculateCartTotals();
        togglePaymentMethod();
    };
    function checkout(){
        var paymentType=getSelectedPaymentMethod()
        var bill=parseFloat(document.getElementById("total").innerText.replace('$', '').trim())
        var payedFromBalance=parseFloat(document.getElementById("balance").innerText.replace('$', '').trim())
        console.log("selectedPaymentMethod : "+paymentType+" & total to pay : "+bill);
        var req=new XMLHttpRequest()
        req.onreadystatechange=function (){
            if (req.readyState===4){
                if (req.status===200){
                    alert(req.responseText)
                    window.location.reload()
                } else {
                    alert(req.responseText)
                }
            }
        }
        req.open("POST","/ecommerce/checkout",true)
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.send("bill="+bill+"&paymentType="+paymentType+"&payedFromBalance="+payedFromBalance)
    }
    function togglePaymentMethod() {
        const totalElement = document.getElementById("total");
        const paymentMethodSection = document.getElementById("paymentMethodSection");

        // Get the total value as a number
        const totalValue = parseFloat(totalElement.innerText.replace('$', '').trim());

        // If the total is greater than 0, show the payment method section
        if (totalValue > 0) {
            paymentMethodSection.style.display = 'block';
        } else {
            paymentMethodSection.style.display = 'none';
        }
    }

    function deleteProduct(itemId,userId){
        var req=new XMLHttpRequest()
        req.open("GET","/ecommerce/editcart?userid="+userId+"&itemid="+itemId,true)
        req.send(null)
        req.onreadystatechange = function (){
            if (req.status===200&&req.readyState===4){
                window.location.reload()
            }
        }


    }
    function calculateCartTotals() {
        // Select all table rows in the cart table body
        const cartRows = document.querySelectorAll("#cartTableBody tr");
        let subtotal = 0;

        cartRows.forEach(row => {
            // Get the total price for the current item (column 5)
            const totalCell = row.querySelector("td:nth-child(5) p");
            const itemTotal = parseFloat(totalCell.innerText);

            // Accumulate the subtotal
            subtotal += itemTotal;
        });

        // Ensure that subtotal and total elements exist in the DOM
        const subtotalElement = document.getElementById("subtotal");
        const totalElement = document.getElementById("total");

        const balanceElement = document.getElementById("balance");
        let balanceText = balanceElement.innerText || balanceElement.textContent;

// Remove the "$" sign and convert the string to a number
        let balance = parseFloat(balanceText.replace('$', '').trim());

        if (subtotalElement && totalElement) {
            // Set the subtotal and total in the HTML
            subtotalElement.innerText = `$` + subtotal.toFixed(2);
            if (balance>subtotal){
                balanceElement.innerText="$"+subtotal.toFixed(2)
                const total = 0;
                console.log("total to pay : "+total)

                // Set the total in the HTML
                totalElement.innerText = `$` + total.toFixed(2);
            }else {

                const total = subtotal - balance;
                console.log("total to pay : "+total)

                // Set the total in the HTML
                totalElement.innerText = `$` + total.toFixed(2);
            }

        } else {
            console.error("Subtotal or total elements not found in the DOM.");
        }
    }
    // For manual quantity input change
    function updateQuantity(productId, userId, newQuantity) {
        if (newQuantity > 0) {
            sendQuantityUpdateRequest(productId, userId, newQuantity);
        } else{
            deleteProduct(productId,userId)
        }
    }

    // For plus/minus button clicks
    function changeQuantity(productId, userId, delta,original) {
        const inputField = document.getElementById("quantityValue")
        console.log("original value is "+original)
        console.log("delta value is "+delta)
        console.log("input value is "+inputField.value)

        let currentQuantity = parseInt(inputField.value);

        // Update the quantity value based on the delta (positive or negative)
        let newQuantity = original + delta;

        // Prevent quantity from going below 1
        if (newQuantity < 1) {
            deleteProduct(productId,userId)
        }else{
            sendQuantityUpdateRequest(productId, userId, newQuantity);

        }

        // Update the input field value
       // inputField.value = newQuantity;

        // Call the function to update the quantity in the backend via AJAX

    }

    // Send an AJAX request to update the quantity in the backend
    // Send an AJAX POST request to update the quantity in the backend
    function sendQuantityUpdateRequest(productId, userId, newQuantity) {
        const xhr = new XMLHttpRequest();
        const url = `/ecommerce/editcart`;

        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Reload the page to reflect the updated quantity
                window.location.reload();
            } else if (xhr.readyState === 4 && xhr.status !== 200) {
                alert("Failed to update quantity")
                console.error("Failed to update quantity");
            }
        };

        // Send the productId, userId, and newQuantity as form data
        xhr.send("itemid="+productId+"&userid="+userId+"&quantity="+newQuantity);
    }

    function getSelectedPaymentMethod() {
        // Find the selected radio button
        const selectedPaymentMethod = document.querySelector('input[name="paymentMethod"]:checked');

        // Check if a radio button is selected
        if (selectedPaymentMethod) {
            console.log(selectedPaymentMethod.value); // Logs 'cash' or 'visa'
            return selectedPaymentMethod.value;
        } else {
            console.error("No payment method selected.");
            return null;
        }
    }
</script>

<!-- Cart Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Products</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody id="cartTableBody">
                <c:if test="${not empty requestScope.cart}">
                <c:forEach items="${requestScope.cart}" var="item">
                    <tr>
                        <th scope="row">
                            <div class="d-flex align-items-center">
                                <img src="${item.product.image}" class="img-fluid me-5 rounded-circle"
                                     style="width: 80px; height: 80px;" alt="">
                            </div>
                        </th>
                        <td>
                            <p class="mb-0 mt-4">${item.product.productName}</p>
                        </td>
                        <td>
                            <p class="mb-0 mt-4">${item.product.price}</p>
                        </td>
                        <td>
                            <div class="input-group quantity mt-4" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="changeQuantity(${item.product.id}, ${sessionScope.user.id}, -1,${item.productQuantity})">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm text-center border-0"
                                       value="${item.productQuantity}"
                                       id="quantityValue"
                                       data-product-id="${item.product.id}"
                                       onchange="updateQuantity(${item.product.id}, ${sessionScope.user.id},this.value)">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="changeQuantity(${item.product.id}, ${sessionScope.user.id}, 1,${item.productQuantity})">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>

                        <td>
                            <p class="mb-0 mt-4">${item.productQuantity * item.product.price}</p>
                        </td>
                        <td>
                            <button class="btn btn-md rounded-circle bg-light border mt-4" onclick="deleteProduct(${item.product.id},${item.user.id})">
                                <i class="fa fa-times text-danger"></i>
                            </button>
                        </td>

                    </tr>
                </c:forEach>
                </c:if>

                </tbody>
            </table>
        </div>

        <div class="row g-4 justify-content-end">
            <div class="col-8"></div>
            <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                <div class="bg-light rounded">
                    <div class="p-4">
                        <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">Subtotal:</h5>
                            <p class="mb-0" id="subtotal">$00.00</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">Payed From Balance</h5>
                            <div class="">
                                <p class="mb-0" id="balance"> $${sessionScope.user.balance}</p>
                            </div>
                        </div>
                        <!-- Payment Method Selection -->
                        <div class="mt-4" id="paymentMethodSection" style="display: none;">
                            <h5 class="mb-3">Choose Payment Method</h5>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="payWithCash" value="cash" checked>
                                <label class="form-check-label" for="payWithCash">
                                    Pay with Cash
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="payWithVisa" value="visa">
                                <label class="form-check-label" for="payWithVisa">
                                    Pay with Visa
                                </label>
                            </div>
                        </div>


                    </div>

                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">Total</h5>
                        <p class="mb-0 pe-4" id="total">$99.00</p>
                    </div>

                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                            type="button" onclick="checkout()" >Proceed Checkout
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart Page End -->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
    <div class="container py-5">
        <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
            <div class="row g-4">
                <div class="col-lg-3">
                    <a href="#">
                        <h1 class="text-primary mb-0">Fruitables</h1>
                        <p class="text-secondary mb-0">Fresh products</p>
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative mx-auto">
                        <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number"
                               placeholder="Your Email">
                        <button type="submit"
                                class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white"
                                style="top: 0; right: 0;">Subscribe Now
                        </button>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="d-flex justify-content-end pt-3">
                        <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i
                                class="fab fa-linkedin-in"></i></a>
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
                Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a
                    class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
            </div>
        </div>
    </div>
</div>
<!-- Copyright End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
        class="fa fa-arrow-up"></i></a>


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