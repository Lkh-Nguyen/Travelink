


/*phan trang*/
let thisPage = 1;
let limit = 4;
let list = document.querySelectorAll(".card-body");
function loadItem() {
    let beginGet = limit * (thisPage - 1);
    let endGet = limit * thisPage - 1;
    list.forEach((item, key) => {
        if (key >= beginGet && key <= endGet) {
            item.style.display = "block";
        } else {
            item.style.display = "none";
        }
    });
    listPage();
}
loadItem();
function listPage() {
    let count = Math.ceil(list.length / limit);
    document.querySelector('.listPage').innerHTML = '';

    if (thisPage != 1) {
        let prev = document.createElement('li');
        prev.innerText = 'PREV';
        prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
        document.querySelector('.listPage').appendChild(prev);
    }
    for (i = 1; i <= count; i++) {
        let newPage = document.createElement('li');
        newPage.innerText = i;
        if (i == thisPage) {
            newPage.classList.add('active');
        }
        newPage.setAttribute('onclick', "changePage(" + i + ")");
        document.querySelector('.listPage').appendChild(newPage);
    }

    if (thisPage != count) {
        let next = document.createElement('li');
        next.innerText = 'NEXT';
        next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
        document.querySelector('.listPage').appendChild(next);
    }
}
function changePage(i) {
    thisPage = i;
    loadItem();
    let scrollPosition = window.scrollY;
    window.scrollTo(0, scrollPosition);
}

/*select số lượng phòng nếu lớn hơn 0*/
document.addEventListener('DOMContentLoaded', (event) => {
    const selects = document.querySelectorAll('select');
    const messageCells = document.querySelectorAll('#message');

    selects.forEach(select => {
        select.addEventListener('change', checkSelectValues);
    });

    function checkSelectValues() {
        let allZero = Array.from(selects).every(select => select.value === '0');
        messageCells.forEach(cell => {
            cell.textContent = allZero ? 'No room selected' : 'A room has been selected';
        });
    }
});
/*select số lượng phòng nếu lớn hơn 0*/


/* */
