document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("reservationForm");
    const errorMessageElement = document.getElementById("errorMessage");

    form.addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent default form submission

        const reservationNumber = document.getElementById("reservationNumber").value;

        // Basic validation
        if (reservationNumber === "") {
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
            body: JSON.stringify({ reservationNumber: reservationNumber }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Redirect to the next page or perform success action
                    window.location.href = "/next-page"; // Change to your actual URL
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
