//// My Registration 클릭시 처리
//document.getElementById('myRegistration').addEventListener('click', function () {
//        window.location.href = '/process'; // Spring Controller의 매핑된 URL로 이동
//});

// arrow 버튼 클릭
document.getElementById('arrow-button').addEventListener('click', function () {
        history.back();
});

let selectedAccordionItem = null;

function toggleAccordion(element) {
  const clickedItem = element; // 클릭한 아코디언 아이템

  clickedItem.classList.toggle('active');

  const liItems = clickedItem.querySelectorAll('.accordion-content li');

  liItems.forEach((li) => {
    li.addEventListener('click', function (event) {
      event.stopPropagation(); // 클릭 이벤트가 부모 요소로 전파되지 않도록 함

      // 모든 li에서 'selected' 클래스를 제거
      liItems.forEach((item) => item.classList.remove('selected'));

      // 클릭한 li에 'selected' 클래스 추가
      li.classList.add('selected');
    });
  });
}

// function toggleAccordion(element) {
//   // 클릭한 아이템에 active 클래스를 추가하거나 제거
//   element.classList.toggle('active');
// }

function saveModelNumber() {
  const inputField = document.getElementById('model-number');
  model_num = inputField.value;
  inputField.value = ''; // Clear the input field
  console.log("Model number saved:", model_num);
}

function arrowClickAction() {
  console.log("Arrow button clicked!");
  // Add desired action here
}

function selectAccordionItem() {
const selectedValue = document.getElementById('title_list').value;

const allItems = document.querySelectorAll('.accordion-item');
allItems.forEach(item => {
  const itemType = item.getAttribute('data-item');
  if (itemType === selectedValue) {
    item.classList.add('active', 'selected');
    selectedAccordionItem = item;
  } else {
    item.classList.remove('active', 'selected');
  }
});
}

// 총 아코디언 항목의 개수
const totalOptions = 3;

function toggleAccordion(element) {
    // 클릭된 아코디언 항목의 상태를 토글
    const clickedItem = element;
    clickedItem.classList.toggle('active');

    // 클릭된 아코디언 항목 내의 li 요소들
    const liItems = clickedItem.querySelectorAll('.accordion-content li');

    liItems.forEach((li) => {
        li.addEventListener('click', function (event) {
            event.stopPropagation(); // 부모 요소로 이벤트 전파 방지

            // 모든 li에서 'selected' 클래스를 제거
            liItems.forEach((item) => item.classList.remove('selected'));

            // 클릭한 li에 'selected' 클래스 추가
            li.classList.add('selected');

            // 모든 항목이 선택되었는지 확인
            checkAllOptionsSelected();
        });
    });
}


document.getElementById('homebutton').addEventListener('click', function () {
        window.location.href = '/'; // Spring Controller의 매핑된 URL로 이동
});