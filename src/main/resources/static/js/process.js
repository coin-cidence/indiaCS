// DOM으로 요소 접근
const buttons = document.querySelectorAll('.clickable-button');
const confirmationText = document.querySelector('.your-reservation-has-been-confirmed');
const confirmedIcon = document.querySelector('.free-icon-confirm-467129-1');
const progressTextTitle = document.querySelector('.diagnostic-progress');
const progressDate1 = document.querySelector('.complete-diagnose-1');
const progressText1 = document.querySelector('.diagnose-content-1');
const progressDate2 = document.querySelector('.complete-diagnose-2');
const progressText2 = document.querySelector('.diagnose-content-2');
const progressDate3 = document.querySelector('.complete-diagnose-3');
const progressText3 = document.querySelector('.diagnose-content-3');
const progressDate4 = document.querySelector('.complete-diagnose-4');
const progressText4 = document.querySelector('.diagnose-content-4');
const line6 = document.querySelector('.line-6');

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
        line6.style.visibility = 'visible';
        confirmedIcon.style.visibility = 'hidden';
        confirmationText.style.visibility = 'hidden';
        progressTextTitle.innerHTML = 'Diagnostic Progress';
        progressDate1.style.visibility = 'visible';
        progressText1.style.visibility = 'visible';
        progressDate2.style.visibility = 'visible';
        progressText2.style.visibility = 'visible';
        progressDate3.style.visibility = 'hidden';
        progressText3.style.visibility = 'hidden';
        progressDate4.style.visibility = 'hidden';
        progressText4.style.visibility = 'hidden';
    }else if(button.id === 'ellipseButton3'){
        line6.style.visibility = 'visible';
        confirmedIcon.style.visibility = 'hidden';
        confirmationText.style.visibility = 'hidden';
        progressTextTitle.innerHTML = 'Repair Progress';
        progressDate1.style.visibility = 'visible';
        progressText1.style.visibility = 'visible';
        progressDate2.style.visibility = 'visible';
        progressText2.style.visibility = 'visible';
        progressDate3.style.visibility = 'visible';
        progressText3.style.visibility = 'visible';
        progressDate4.style.visibility = 'visible';
        progressText4.style.visibility = 'visible';
    }
    else if(button.id === 'ellipseButton4'){
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
        line6.style.visibility = 'hidden';
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