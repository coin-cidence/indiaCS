document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("reservationForm");
    const errorMessageElement = document.getElementById("errorMessage");

    form.addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent default form submission

        const asRequestId = document.getElementById("asRequestId").value;

        // Basic validation
        if (asRequestId === "") {
            errorMessageElement.innerText = "Please enter a reservation number.";
            return;
        }

        // Clear previous error
        errorMessageElement.innerText = "";

        // Send request to the server (AJAX request)
        fetch("/reservation-check", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ "asRequestId" : asRequestId }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Redirect to the next page or perform success action
                    window.location.href = "/process"; // Change to your actual URL
                } else {
                    // Display error message if reservation not found
                    errorMessageElement.innerText = "Reservation number not found. Please try again.";
                }
            })
            .catch(error => {
                console.error("Error during the request:", error);
                errorMessageElement.innerText = "An error occurred. Please try again.";
            });
    });
});
  document.getElementById('homebutton').addEventListener('click', function () {
          window.location.href = '/'; // Spring Controller의 매핑된 URL로 이동
  });