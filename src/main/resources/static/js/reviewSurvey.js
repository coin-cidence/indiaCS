function submitSurvey() {
    const asRequestId = document.getElementById('asRequestId').value;
    const q1 = document.querySelector('input[name="q1"]:checked')?.value;
    const q2 = document.querySelector('input[name="q2"]:checked')?.value;
    const q3 = document.querySelector('input[name="q3"]:checked')?.value;
    const reviewComment = document.getElementById('reviewComment').value;
    const reviewDate = new Date().toISOString();  // Automatically set the review date

    if (!asRequestId || !q1 || !q2 || !q3) {
        alert('Please answer all the questions and provide your request ID.');
        return;
    }

    const surveyData = {
        asRequestId: asRequestId,
        question1: parseInt(q1),
        question2: parseInt(q2),
        question3: parseInt(q3),
        reviewComment: reviewComment,
        reviewDate: reviewDate
    };

    // Use fetch to submit the data to the server
    fetch('/submitSurvey', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(surveyData),
    })
    .then(response => {
        if (response.ok) {
            // Redirect to /reviewComplete on success
            window.location.href = '/reviewComplete';
        } else {
            alert('There was an issue with your submission. Please try again.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Submission failed. Please try again.');
    });
}
