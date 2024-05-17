container.classList.add("left-panel-active");

//Khi nhấn vào button login => hiện container và hiện lớp overlay làm mờ
document.getElementById('showFormButton').onclick = function (){
    container.classList.add("left-panel-active");
    container.classList.remove("right-panel-active");
    container.style.display = 'block';
    overlayBackground.style.display = 'block';
    // Thêm lớp 'show' để kích hoạt hiệu ứng trượt
    setTimeout(() => {
        container.classList.add('show');
    }, 150);
}

document.getElementById('overlayBackground').onclick = function(){
    // Ẩn form và overlay
    container.classList.remove('show');
    setTimeout(() => {
        container.style.display = 'none';
        overlayBackground.style.display = 'none';
    }, 500); // Thời gian chờ cho animation hoàn thành
}

// Để cho overlay trượt qua phải và trái
document.getElementById('signUp').onclick = function(){
    container.classList.add("right-panel-active");
}
document.getElementById('signIn').onclick = function(){
    container.classList.remove("right-panel-active");
}

document.getElementById('closeButton').onclick = function(){
    // Ẩn form và overlay
    container.classList.remove('show');
    setTimeout(() => {
        container.style.display = 'none';
        overlayBackground.style.display = 'none';
    }, 500); // Thời gian chờ cho animation hoàn thành
}

document.getElementById('showFormButton-register').onclick = function (){
    // Kiểm tra nếu container đã có lớp 'right-panel-active'
    container.classList.add("right-panel-active");
    container.classList.remove("left-panel-active");
    container.style.display = 'block';
    overlayBackground.style.display = 'block';
    // Thêm lớp 'show' để kích hoạt hiệu ứng trượt
    setTimeout(() => {
        container.classList.add('show');
    }, 150);
}