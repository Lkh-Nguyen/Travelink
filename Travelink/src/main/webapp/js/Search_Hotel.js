const $ = document.querySelector.bind(document)
const $$ = document.querySelectorAll.bind(document)

const numberLabel = $('.form__group:nth-child(2) .input__content')
const travellersDropdown = document.getElementById('travellersDropdown')

document.addEventListener("DOMContentLoaded", function() {
    // Lắng nghe sự kiện khi checkbox thay đổi
    var checkboxes = document.querySelectorAll('input[type=checkbox]');
    checkboxes.forEach(function(checkbox) {
      checkbox.addEventListener('change', function() {
        filterHotels();
      });
    });

    // Hàm lọc danh sách khách sạn
    function filterHotels() {
      var filterForm = document.getElementById('filterForm');
      var selectedStars = [];
      filterForm.querySelectorAll('input[type=checkbox]:checked').forEach(function(checkbox) {
        selectedStars.push(parseInt(checkbox.value));
      });

      var hotelCards = document.querySelectorAll('.hotel-card');
      hotelCards.forEach(function(card) {
        var star = parseInt(card.getAttribute('data-star'));
        if (selectedStars.length === 0 || selectedStars.includes(star)) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    }
  });

  var slider = document.getElementById("myRange");
  var output = document.getElementById("demo");
  // Hiển thị giá trị thanh trượt mặc định
  output.innerHTML = slider.value;
  //Cập nhật giá trị thanh trượt hiện tại (mỗi khi bạn kéo tay cầm thanh trượt)
  slider.oninput = function()
  {
    output.innerHTML = this.value;
  }



 
