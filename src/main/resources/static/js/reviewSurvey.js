

function submitSurvey() {
    const q1 = mapAnswerToValue(document.querySelector('input[name="q1"]:checked')?.value);
    const q2 = mapAnswerToValue(document.querySelector('input[name="q2"]:checked')?.value);
    const q3 = mapAnswerToValue(document.querySelector('input[name="q3"]:checked')?.value);
    const reviewComment = document.getElementById('reviewComment').value;
  //  const asRequestId = document.getElementById('asRequestId').value; // Get hidden field value

    if (!q1 || !q2 || !q3 ) {
        alert('Please answer all questions.');
        return;
    }

    const surveyData = {

            question1: q1,
            question2: q2,
            question3: q3,
            reviewComment
        };

        fetch('/submit-survey', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(surveyData),
        })
        .then(response => {
            if (response.ok) {
                window.location.href = '/review-complete';
            } else {
                alert('There was an issue with your submission. Please try again.');
            }
        })
        .catch(error => {
            alert('Submission failed. Please try again.');
        });
    }

    function mapAnswerToValue(answer) {
        switch (answer) {
            case "strongly_agree":
                return 5;
            case "agree":
                return 4;
            case "neutral":
                return 3;
            case "disagree":
                return 2;
            case "never":
                return 1;
            default:
                return 0;
        }
    }
document.getElementById('homebutton').addEventListener('click', function () {
      window.location.href = '/'; // Spring Controller의 매핑된 URL로 이동
});