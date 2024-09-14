<!-- Error Notification -->
<c:if test="${not empty requestScope.errorMessage}">
    <div class="notification" id="notification">
            ${requestScope.errorMessage}
    </div>
</c:if>

<!-- Notification Styles -->
<style>
    .notification {
        display: none; /* Default: hidden */
        padding: 15px;
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 1000;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Error message style */
    .error-message {
        background-color: #f44336; /* Red for error */
        color: white;
    }

    /* Success message style */
    .success-message {
        background-color: #4CAF50; /* Green for success */
        color: white;
    }
</style>

<!-- Notification Script -->
<script>
    window.onload = function() {
        var notification = document.getElementById('notification');
        if (notification && notification.innerHTML.trim() !== "") {
            // Check if the message contains the word "Error"
            if (notification.innerHTML.includes("Error")) {
                notification.classList.add('error-message'); // Apply error styling (red)
            } else {
                notification.classList.add('success-message'); // Apply success styling (green)
            }
            notification.style.display = 'block'; // Show notification

            // Hide the notification after 5 seconds
            setTimeout(function() {
                notification.style.display = 'none';
            }, 5000);
        }
    };
</script>
