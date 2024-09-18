document.getElementById('fileInput').addEventListener('change', function() {
    // Check if a file was selected
    if (this.files.length === 0) return;

    // Show the spinner
    const spinner = document.getElementById('spinner');
    const message = document.getElementById('message');
    spinner.classList.remove('hidden');
    message.classList.add('hidden'); // Hide the message initially

    // Create a FormData object from the form element
    const form = document.getElementById('uploadForm');
    const formData = new FormData(form);

    fetch('/ecommerce/upload', {  // Ensure '/upload' matches your servlet mapping
        method: 'POST',
        body: formData
    })
        .then(response => response.text()) // Change this based on expected response type
        .then(result => {
            console.log('Success:', result);
            // Show the message
            message.classList.remove('hidden');
        })
        .catch(error => {
            console.error('Error:', error);
            // Optionally handle errors here
        })
        .finally(() => {
            // Hide the spinner
            spinner.classList.add('hidden');
        });
});


document.getElementById('firstForm').addEventListener('submit', function(event) {
    // Prevent the default form submission
    event.preventDefault();

    // Get the file input from the second form
    const fileInput = document.getElementById('fileInput');

    // Clone the file input and append it to the first form
    if (fileInput.files.length > 0) {
        const fileClone = fileInput.cloneNode(true);
        document.getElementById('fileContainer').appendChild(fileClone);
    }

    // Submit the first form after appending the file input
    this.submit();
});