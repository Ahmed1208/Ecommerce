<!-- Spinner Start -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="notification-container" style="position: fixed; top: 20px; right: 20px; z-index: 1000;"></div>

<link href="css/header.css" rel="stylesheet">
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

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

<!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
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
            <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Prime Mart</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="/ecommerce" class="nav-item nav-link active">Home</a>
                    <a href="/ecommerce/shop-page" class="nav-item nav-link">Shop</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="cart.jsp" class="dropdown-item">Cart</a>
                            <a href="chackout.html" class="dropdown-item">Chackout</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex align-items-center justify-content-end m-3">


                    <!-- Cart Icon with Badge -->
                    <a href="/ecommerce/getCart" class="position-relative me-4 my-auto" style="position: relative;">
                        <i class="fa fa-shopping-bag fa-2x text-dark"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-white" style="top: -5px; left: 15px; height: 20px; min-width: 20px; font-size: 12px;">
                           <c:if test="${not empty sessionScope.cartSize }">${sessionScope.cartSize}</c:if>
                           <c:if test="${ empty sessionScope.cartSize }">0</c:if>
                        </span>
                        <span class="tooltip-text">Cart</span>
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
                    <!-- Modal Structure -->
                    <div id="paymentModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="paymentModalLabel">Make a Payment</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- Modal Content -->
                                    <div class="form-group">
                                        <label for="paymentAmount">Enter Amount to Pay:</label>
                                        <input type="number" id="paymentAmount" class="form-control" placeholder="Enter amount">
                                    </div>
                                    <div id="msg"></div>

                                    <div class="form-group">
                                        <label>Choose Payment Method:</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="paymentMethod" id="payWithVisa" value="visa" checked>
                                            <label class="form-check-label" for="payWithVisa">
                                                Pay with Visa
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="paymentMethod" id="payWithPaypal" value="paypal">
                                            <label class="form-check-label" for="payWithPaypal">
                                                Pay with PayPal
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closemodal()">Cancel</button>
                                    <button type="button" class="btn btn-primary" onclick="submitPayment()">Pay</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        // Function to open the payment modal
                        // Function to open the payment modal

                        function openPaymentModal() {
                            $('#paymentModal').modal({ backdrop: false });
                            $('#paymentModal').modal('show');// Disable backdrop blocking
                        }
                        function closemodal(){
                            $('#paymentModal').modal('hide');

                        }

                        // Function to handle payment submission
                        function submitPayment() {
                            const amount = document.getElementById("paymentAmount").value;
                            const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;

                            if (amount <= 0 || isNaN(amount)) {
                                document.getElementById("msg").innerHTML=""

                                    showNotification("Please enter a valid amount.", 'error');
                               // alert("Please enter a valid amount.");
                                return;
                            }

                            console.log("Payment amount:", amount);
                            console.log("Selected payment method:", paymentMethod);

                            // Perform AJAX request to add balance
                            var req = new XMLHttpRequest();
                            req.open("GET", "/ecommerce/addBalance?amount=" + encodeURIComponent(amount), true);
                            req.onreadystatechange = function() {
                                if (req.readyState === 4) {
                                    if (req.status === 200) {
                                        closemodal()
                                        setTimeout(function (){},4000)
                                        showNotification("Balance added successfully",'success')
                                        setTimeout(function (){},4000)
                                        window.location.reload();
                                    } else {
                                        showNotification(req.responseText,'error')
                                       // alert("Error: " + req.responseText);
                                    }
                                }
                            };
                            req.send(null);


                            // Close the modal after payment


                        }

                    </script>
                </div>

<%--                <script src="js/main.js"></script>--%>
                <script src="js/addToCartButton.js"></script>

            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->
