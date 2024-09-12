// login 클릭시 처리
document.getElementById('loginButton').addEventListener('click', function () {
        window.location.href = '/login'; // Spring Controller의 매핑된 URL로 이동
});

// installation 클릭시 처리
document.getElementById('installation').addEventListener('click', function () {
        window.location.href = '/deviceSelectionInstall'; // Spring Controller의 매핑된 URL로 이동
});

// A/S 클릭시 처리
document.getElementById('AS').addEventListener('click', function () {
        window.location.href = '/deviceSelection'; // Spring Controller의 매핑된 URL로 이동
});

// lg 로고 클릭시 처리
document.getElementById('homebutton').addEventListener('click', function () {
        window.location.href = '/'; // Spring Controller의 매핑된 URL로 이동
});