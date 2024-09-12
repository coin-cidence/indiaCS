// DOM으로 요소 접근
const buttons = document.querySelectorAll('.clickable-button');

const confirmationText = document.querySelector('.your-reservation-has-been-confirmed');
const confirmedIcon = document.querySelector('.free-icon-confirm-467129-1');

const progressTextTitle = document.querySelector('.diagnostic-progress');

const progressDate1 = document.querySelector('.complete-diagnose-1');
const progressDate1Text = document.querySelector('.complete-time-1');
const progressText1 = document.querySelector('.diagnose-content-1');

const progressDate2 = document.querySelector('.complete-diagnose-2');
const progressDate2Text = document.querySelector('.complete-time-2');
const progressText2 = document.querySelector('.diagnose-content-2');

const progressDate3 = document.querySelector('.complete-diagnose-3');
const progressText3 = document.querySelector('.diagnose-content-3');

const progressDate4 = document.querySelector('.complete-diagnose-4');
const progressText4 = document.querySelector('.diagnose-content-4');

const line6 = document.querySelector('.line-6');
const background = document.querySelector('.background');
const rating = document.querySelector('.rating');
const rectangle = document.querySelector('.rectangle');

// 초기 화면 설정: confirmation 버튼을 클릭된 상태로 설정
const initialButton = document.querySelector('#ellipseButton1'); // confirmation 버튼을 지정
initialButton.classList.add('clicked');
confirmationText.style.visibility = 'visible';
confirmedIcon.style.visibility = 'visible';
progressTextTitle.style.visibility = 'hidden';
progressDate1.style.visibility = 'hidden';
progressText1.style.visibility = 'hidden';
progressDate2.style.visibility = 'hidden';
progressText2.style.visibility = 'hidden';
progressDate3.style.visibility = 'hidden';
progressText3.style.visibility = 'hidden';
progressDate4.style.visibility = 'hidden';
progressText4.style.visibility = 'hidden';
line6.style.visibility = 'hidden';
background.style.visibility = 'hidden';
rating.style.visibility = 'hidden';
rectangle.style.visibility = 'visible';

// 버튼 상태 업데이트 함수
function updateButtonStates() {
    // temp 값이 공백인지에 따라 버튼 활성화/비활성화
    buttons.forEach(button => {
        if (!date1) {
            // temp1이 공백이면 첫 번째 버튼 제외 비활성화
            button.disabled = (button.id !== 'ellipseButton1');
        } else if (!date2) {
            // temp2가 공백이면 첫 번째랑 두 번째 버튼만 활성화
            button.disabled = (button.id !== 'ellipseButton1');
            button.disabled = (button.id !== 'ellipseButton2');
        } else if (!date6) {
            // temp3이 공백이면 마지막 버튼만 비활성화
            button.disabled = (button.id === 'ellipseButton4');
        } else {
            // 모든 temp 값이 공백이 아니면 모든 버튼 활성화
            button.disabled = false;
        }
    });
}

// 초기 상태 설정
updateButtonStates();

buttons.forEach(button => {
  button.addEventListener('click', function() {
    // 모든 버튼의 clicked 클래스를 제거하여 색상을 기본 상태로 되돌림
    buttons.forEach(btn => {
      btn.classList.remove('clicked');
    });

    // 클릭된 버튼에 색상 고정
    button.classList.add('clicked');

    // 특정 버튼 클릭 시 하단 상자와 텍스트 내용 변경
    if (button.id === 'ellipseButton2') {  // Diagnosis 버튼을 클릭했을 때
        rectangle.style.visibility = 'visible';
        background.style.visibility = 'hidden';
        rating.style.visibility = 'hidden';
        line6.style.visibility = 'visible';

        confirmedIcon.style.visibility = 'hidden';
        confirmationText.style.visibility = 'hidden';

        progressTextTitle.innerHTML = 'Diagnostic Progress';
        progressTextTitle.style.visibility = 'visible';

        if(!date1){
            progressDate1.style.visibility = 'hidden';
            progressText1.style.visibility = 'hidden';
        }else{
            progressDate1.style.visibility = 'visible';
            progressText1.style.visibility = 'visible';
            progressDate1Text.innerHTML = date1;
            progressText1.innerHTML = 'Service technician visit.';
        }

        if(!date2){
            progressDate2.style.visibility = 'hidden';
            progressText2.style.visibility = 'hidden';
        }else{
            progressDate2.style.visibility = 'visible';
            progressText2.style.visibility = 'visible';
            progressDate2Text.innerHTML = date2;
            progressText2.innerHTML = "Diagnosis:<br>We've identified the issue with your device as <span class='real-diagnose-content'>HDMI Port Failure</span>.";
            var progressText2Span = document.querySelector('.real-diagnose-content');
            progressText2Span.innerText = data1;
        }

        progressDate3.style.visibility = 'hidden';
        progressText3.style.visibility = 'hidden';

        progressDate4.style.visibility = 'hidden';
        progressText4.style.visibility = 'hidden';
    }else if(button.id === 'ellipseButton3'){
        rectangle.style.visibility = 'visible';
        background.style.visibility = 'hidden';
        rating.style.visibility = 'hidden';
        line6.style.visibility = 'visible';

        confirmedIcon.style.visibility = 'hidden';
        confirmationText.style.visibility = 'hidden';

        progressTextTitle.innerHTML = 'Repair Progress';
        progressTextTitle.style.visibility = 'visible';

        progressDate1.style.visibility = 'visible';
        progressText1.style.visibility = 'visible';
//        progressDate1Text.innerHTML = '2024.09.09 10:10';
        progressDate1Text.innerHTML = date3;
        progressText1.innerHTML = 'Parts order completed. (Parts inventory location: <span class="real-repair-content">Changwon, South Korea</span>)';
        var progressText1Span = document.querySelector('.real-repair-content');
        progressText1Span.innerText = data2;

        if(!date4){
            progressDate2.style.visibility = 'hidden';
            progressText2.style.visibility = 'hidden';
        }else{
            progressDate2.style.visibility = 'visible';
            progressText2.style.visibility = 'visible';
        }

        progressText2.innerHTML = 'Parts shipment initiated. <span class="real-diagnose-content"> HDMI Port Failure</span>';
        var progressText2Span = document.querySelector('.real-diagnose-content');
        progressText2Span.innerText = '';

        if(!date5){
            progressDate3.style.visibility = 'hidden';
            progressText3.style.visibility = 'hidden';
        }else{
            progressDate3.style.visibility = 'visible';
            progressText3.style.visibility = 'visible';
        }

        if(!date6){
            progressDate4.style.visibility = 'hidden';
            progressText4.style.visibility = 'hidden';
        }else{
            progressDate4.style.visibility = 'visible';
            progressText4.style.visibility = 'visible';
        }
    }
    else if(button.id === 'ellipseButton4'){
        rectangle.style.visibility = 'hidden';
        background.style.visibility = 'visible';
        rating.style.visibility = 'visible';
        line6.style.visibility = 'hidden';
        confirmedIcon.style.visibility = 'hidden';
        confirmationText.style.visibility = 'hidden';
        progressTextTitle.style.visibility = 'hidden';
        progressDate1.style.visibility = 'hidden';
        progressText1.style.visibility = 'hidden';
        progressDate2.style.visibility = 'hidden';
        progressText2.style.visibility = 'hidden';
        progressDate3.style.visibility = 'hidden';
        progressText3.style.visibility = 'hidden';
        progressDate4.style.visibility = 'hidden';
        progressText4.style.visibility = 'hidden';
    }
    else{
        rectangle.style.visibility = 'visible';
        line6.style.visibility = 'hidden';
        background.style.visibility = 'hidden';
        rating.style.visibility = 'hidden';
        confirmedIcon.style.visibility = 'visible';
        confirmationText.style.visibility = 'visible';
        progressTextTitle.style.visibility = 'hidden';
        progressDate1.style.visibility = 'hidden';
        progressText1.style.visibility = 'hidden';
        progressDate2.style.visibility = 'hidden';
        progressText2.style.visibility = 'hidden';
        progressDate3.style.visibility = 'hidden';
        progressText3.style.visibility = 'hidden';
        progressDate4.style.visibility = 'hidden';
        progressText4.style.visibility = 'hidden';
//        confirmationText.innerHTML = 'Your reservation has been confirmed';
    }
  });
});

const stars = document.querySelectorAll('.star');
let selectedRating = 0; // 사용자가 클릭한 별점 저장

// 각 별에 마우스 오버 이벤트를 추가
stars.forEach((star, index) => {
    star.addEventListener('mouseover', () => {
        fillStars(index);
    });

    // 마우스가 벗어났을 때 별을 초기화
    star.addEventListener('mouseout', () => {
        resetStars();
        if(selectedRating > 0){
            updateStars(selectedRating);
        }
    });

    // 별점 클릭 이벤트 추가
    star.addEventListener('click', () => {
            const rating = star.getAttribute('data-value'); // 클릭한 별의 값을 가져옴
            updateStars(rating); // 별점 업데이트 함수 호출 (별점 저장)
//            alert(`You rated this: ${rating} out of 5 stars!`); // 결과 출력
         const data = {
                    reviewRating: rating,
                };
       fetch('/updateRating', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        })
        .then(response => {
            if (response.ok) {
            } else {
            alert("error");
            }
        })
        .catch(error => {
            alert('Submission failed. Please try again.');
        });

           document.getElementById('modalAbove').style.display = 'flex';
        });
});

// n번째 별까지 채우는 함수
function fillStars(index) {
    for (let i = 0; i <= index; i++) {
        stars[i].classList.add('filled');
    }
}

// 모든 별을 초기 상태로 되돌리는 함수
function resetStars() {
    stars.forEach(star => {
        star.classList.remove('filled');
    });
}

// 클릭한 별 이후로 별 채우는 함수
function updateStars(rating) {
    for (let i = 0; i < rating; i++) {
        stars[i].classList.add('filled');
    }
}

// 모달창 바깥 부분 클릭 시 모달창 닫기
document.getElementById('modalAbove').addEventListener('click', function (e) {
    if (e.target === this) {
      this.style.display = 'none';
    }
});

// Yes 버튼 클릭 시 처리
document.getElementById('modalYesButton').addEventListener('click', function () {
    window.location.href = '/review-survey'; // Spring Controller의 매핑된 URL로 이동
    document.getElementById('modalAbove').style.display = 'none';
});

// No 버튼 클릭 시 처리
document.getElementById('modalNoButton').addEventListener('click', function () {
    window.location.href = '/Installation_AS(login)'; // Spring Controller의 매핑된 URL로 이동
    document.getElementById('modalAbove').style.display = 'none';
});