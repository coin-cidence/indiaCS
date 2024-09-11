const dateInput = document.getElementById('date-input');
const daysContainer = document.getElementById('days');
const monthYearDisplay = document.getElementById('month-year');
let selectedDate;
let currentMonth = new Date().getMonth();
let currentYear = new Date().getFullYear();

const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

function renderCalendar(month, year) {
    daysContainer.innerHTML = "";
    monthYearDisplay.textContent = `${months[month]} ${year}`;

    const firstDay = new Date(year, month, 1).getDay();
    const lastDate = new Date(year, month + 1, 0).getDate();

    for (let i = 0; i < firstDay; i++) {
        daysContainer.innerHTML += `<span></span>`;
    }

    for (let date = 1; date <= lastDate; date++) {
        const dayElement = document.createElement('span');
        dayElement.textContent = date;
        dayElement.onclick = function () {
            selectDate(date, month, year);
        };
        if (selectedDate && selectedDate.getDate() === date && selectedDate.getMonth() === month && selectedDate.getFullYear() === year) {
            dayElement.classList.add('selected-date');
        }
        daysContainer.appendChild(dayElement);
    }
}

function selectDate(date, month, year) {
    selectedDate = new Date(year, month, date);
    dateInput.value = formatDate(selectedDate);
    renderCalendar(currentMonth, currentYear);
}

function formatDate(date) {
    const day = ("0" + date.getDate()).slice(-2);
    const month = ("0" + (date.getMonth() + 1)).slice(-2);
    return `${month}/${day}/${date.getFullYear()}`;
}

function moveMonth(direction) {
    currentMonth += direction;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    } else if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    renderCalendar(currentMonth, currentYear);
}

renderCalendar(currentMonth, currentYear);
// 모든 time 버튼을 선택
const timeButtons = document.querySelectorAll('.time');

// 버튼 클릭 시 선택 상태를 토글하는 함수
timeButtons.forEach(button => {
  button.addEventListener('click', function() {
    // 모든 버튼에서 'selected' 클래스를 제거하여 이전 선택을 해제
    timeButtons.forEach(btn => btn.classList.remove('selected'));
    
    // 클릭한 버튼에 'selected' 클래스를 추가하여 선택 상태 유지
    this.classList.add('selected');
  });
});