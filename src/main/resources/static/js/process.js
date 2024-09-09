// // 각 버튼별로 클릭 시 해당 버튼만 색상 고정, 나머지는 기본 색상으로 변경
// const buttons = document.querySelectorAll('.clickable-button');

// buttons.forEach(button => {
//   button.addEventListener('click', function() {
//     // 모든 버튼의 clicked 클래스를 제거하여 색상을 기본 상태로 되돌림
//     buttons.forEach(btn => {
//       btn.classList.remove('clicked');
//     });

//     // 클릭된 버튼에 색상 고정
//     button.classList.add('clicked');
//   });
// });

// 버튼 클릭 시 색상 변경 및 하단 상자 내용 변경
const buttons = document.querySelectorAll('.clickable-button');
const diagnosticProcessBox = document.querySelector('.rectangle-3096'); // 하단 상자
const diagnosticText = document.querySelector('.your-reservation-has-been-confirmed'); // 텍스트 박스

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
      diagnosticProcessBox.style.background = '#d0f0c0';  // 상자의 배경색을 변경
      diagnosticText.innerHTML = 'Diagnosis: <br> We\'ve identified the issue with your device as Screen Crack.';
    } else {
      // 다른 버튼 클릭 시 원래 내용 복원
      diagnosticProcessBox.style.background = '#f4f4f4';
      diagnosticText.innerHTML = 'Your reservation has been confirmed';
    }
  });
});