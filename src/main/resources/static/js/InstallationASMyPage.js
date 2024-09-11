// installation 클릭시 처리
document.getElementById('installation').addEventListener('click', function () {
        window.location.href = '/deviceSelectionInstall'; // Spring Controller의 매핑된 URL로 이동
});

// A/S 클릭시 처리
document.getElementById('AS').addEventListener('click', function () {
        window.location.href = '/deviceSelection'; // Spring Controller의 매핑된 URL로 이동
});

//My page 클릭시 처리
document.getElementById('myPageNextPage').addEventListener('click', function () {
        window.location.href = '/mydevice'; // Spring Controller의 매핑된 URL로 이동
});
