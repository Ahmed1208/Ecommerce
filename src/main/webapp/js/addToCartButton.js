function addToCart(productId, userId) {
    // Debugging: Check if productId and userId are valid
    if (!productId || !userId) {
        // showNotification("Invalid productId or userId", "error");
        addToLocalStorage(productId);
        return;
    }

    $.ajax({
        url: '/ecommerce/add-to-cart',  // The URL to handle the request
        type: 'POST',                   // Type of the request (POST for adding data)
        data: {
            productId: productId,              // Product ID sent to the server
            userId: userId              // User ID sent to the server
        },
        success: function(response) {
            // Show success message in a notification
            if (response !=='No Enough quantity for the product'){
                document.getElementById('cart-size').innerText = parseInt(document.getElementById('cart-size').innerText)+1;

            }
            showNotification(response, "success");
        },
        error: function(error) {
            // Handle the error with a notification
            showNotification("Error adding product to cart", "error");
            console.log('Error adding product to cart:', error);
        }
    });
}

function showNotification(message, type) {
    var container = document.getElementById('notification-container');

    // Create notification element
    var notification = document.createElement('div');
    notification.className = 'notification ' + type; // Add classes for styling
    notification.innerText = message;

    // Add some basic styles (you can replace this with your own CSS classes)
    notification.style.padding = '10px 20px';
    notification.style.marginTop = '10px';
    notification.style.borderRadius = '5px';
    notification.style.color = '#fff';
    notification.style.backgroundColor = (type === 'success') ? '#4caf50' : '#f44336'; // Green for success, Red for error
    notification.style.boxShadow = '0 0 5px rgba(0, 0, 0, 0.3)';

    // Append notification to the container
    container.appendChild(notification);

    // Automatically remove the notification after 3 seconds
    setTimeout(function() {
        container.removeChild(notification);
    }, 3000);
}

function toggleSubcategories(event, categoryId) {
    event.preventDefault(); // Prevent the default link behavior

    // Get the container for the subcategories
    var container = document.getElementById("subcategories-" + categoryId);

    // Toggle the display of the container
    if (container.style.display === "none" || container.style.display === "") {
        container.style.display = "block";
    } else {
        container.style.display = "none";
    }
}


function addToLocalStorage(productId)
{
    // Retrieve the cart from local storage or create an empty array if it doesn't exist
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    // Check if the product is already in the cart
    let product = cart.find(item => item.id === productId);

    if (product) {
    // If product exists, increase its quantity
        product.quantity += 1;
    } else {
    // If product doesn't exist, add it with quantity 1
        cart.push({ productId: parseInt(productId, 10), quantity: 1 });
    }

    // Save the updated cart back to local storage
    localStorage.setItem('cart', JSON.stringify(cart));

    // Update and store the cart size in local storage
    let cartSize = cart.reduce((total, item) => total + item.quantity, 0);
    localStorage.setItem('cartSize', cartSize);

    // Update the cart size display in the UI
    document.getElementById('cart-size').innerText = cartSize;

}
