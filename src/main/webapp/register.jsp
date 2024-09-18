<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        .message {
            font-size: 14px;
            margin-top: 5px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        input[type="submit"]:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

<div class="container">
    <c:if test="${not empty requestScope.errormsg}">
        <script>
            alert("${requestScope.errormsg}");
        </script>
    </c:if>
    <h2>Registration Form</h2>
    <form id="registerform" action="register" method="post" onsubmit="return validateForm()">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" onblur="checkEmail()" required>
        <div id="emailMessage" class="message"></div><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" onblur="checkPassword()" required>

        <label for="confirmpassword">Confirm Password:</label>
        <input type="password" id="confirmpassword" name="confirmpassword" onblur="checkPassword()" required>
        <div id="passwordmessage" class="message"></div><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="Female">Female</option>
            <option value="Male">Male</option>
        </select>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>

        <label for="street">Street:</label>
        <input type="text" id="street" name="street" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" required>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" required pattern="01[0-9]{9}" title="Phone number must start with 01 and be 11 digits long">

        <input type="hidden" id="cartSize" name="cartSize" value="">
        <input type="hidden" id="cart" name="cart" value="">
        <input type="submit" value="Register" id="subBTN">
    </form>

</div>
<script>
    var isEmailValid = false;
    var isPasswordValid = false;
    var pass = document.getElementById("password");
    var confirmpass = document.getElementById("confirmpassword");

    function checkPassword() {
        var passwordmessage = document.getElementById("passwordmessage");
        passwordmessage.classList.add("message");

        if (pass.value !== confirmpass.value || pass.value === "" || confirmpass.value === "") {
            passwordmessage.innerHTML = "The passwords don't match";
            passwordmessage.classList.remove("success");
            passwordmessage.classList.add("error");
            isPasswordValid = false;
        } else {
            passwordmessage.innerHTML = "Passwords match";
            passwordmessage.classList.add("success");
            passwordmessage.classList.remove("error");
            isPasswordValid = true;
        }
    }

    var req1 = null;

    function checkEmail() {
        var email = document.getElementById("email").value;
        req1 = new XMLHttpRequest();
        req1.onreadystatechange = handleEmail;
        req1.open("GET", "register?email=" + email, true);
        req1.send(null);
    }

    function handleEmail() {
        if (req1.readyState === 4 && req1.status === 200) {
            var emailMessage = document.getElementById("emailMessage");
            emailMessage.classList.add("message");
            if (req1.responseText.includes("error")) {
                emailMessage.innerHTML = "Email Already Exists";
                emailMessage.classList.remove("success");
                emailMessage.classList.add("error");
                isEmailValid = false;
            } else {
                emailMessage.innerHTML = "Email is accepted";
                emailMessage.classList.remove("error");
                emailMessage.classList.add("success");
                isEmailValid = true;
            }
        }
    }

    function checkform() {
        var name = document.getElementById("name").value;
        var city = document.getElementById("city").value;
        var street = document.getElementById("street").value;
        var country = document.getElementById("country").value;
        var phone = document.getElementById("phone").value;
        var dob = document.getElementById("dob").value;
        var userpass = document.getElementById("password").value;

        return name !== "" && city !== "" && street !== "" && country !== "" &&
            phone !== "" && dob !== "" && userpass !== "";
    }

    function validateForm() {
        if (!isEmailValid) {
            alert("Please use a valid email address.");
            return false;
        }
        if (!isPasswordValid) {
            alert("Passwords do not match.");
            return false;
        }
        if (!checkform()) {
            alert("Please fill in all required fields.");
            return false;
        }
        var phone = document.getElementById('phone').value;
        var phonePattern = /^01\d{9}$/;

        // Check if phone number matches the pattern
        if (!phonePattern.test(phone)) {
            alert('Phone number must start with 01 and be 11 digits long.');
            return false; // Prevent form submission
        }
        var password = document.getElementById('password').value;
        // Check if password is at least 8 characters long and contains both numbers and letters
        if (!isValidPassword(password)) {
            alert('Password must be at least 8 characters long and contain both numbers and letters.');
            return false; // Prevent form submission
        }

        return true;
    }
    function isValidPassword(password) {
        // Ensure password is at least 8 characters long, contains at least one letter and one number
        var minLength = 8;
        var hasLetter = /[a-zA-Z]/.test(password);
        var hasNumber = /[0-9]/.test(password);
        return password.length >= minLength && hasLetter && hasNumber;
    }


    ///////////////// event listener to append data inside local storage ///////////
    document.getElementById('registerform').addEventListener('submit', function(e) {

        let cartSize = localStorage.getItem('cartSize');

        // Set cartSize value before sending the form
        document.getElementById('cartSize').value = cartSize;

        let cart = localStorage.getItem('cart');

        // Serialize the object to JSON
        const objectData = JSON.stringify(cart);

        // Set the hidden input field with the serialized object
        document.getElementById('cart').value = objectData;

        localStorage.clear();
    });
    /////////////////////////////////////////////////////////////////////

</script>
</body>
</html>
