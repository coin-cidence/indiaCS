  const test = document.querySelector('.product')
    // 첫 번째 아코디언 클릭 이벤트
    document.querySelector('.accordion-item').addEventListener('click', function() {
      this.classList.toggle('active');
      test.style.visibility = "visible";
    });

    // 버튼 클릭 이벤트 처리
    document.getElementById('arrow-button').addEventListener('click', function(){
      history.back();
    });
  document.getElementById('nextpage').addEventListener('click', function () {
          window.location.href = '/process'; // Spring Controller의 매핑된 URL로 이동
  });

