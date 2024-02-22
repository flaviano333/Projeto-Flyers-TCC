const menu2Size = '250px';
let openMenu2 = false;
toggleMenu2();
document.querySelector('#btnMenu2').addEventListener('click', () => {
    openMenu2 = !openMenu2;
    toggleMenu2();
});
document.querySelector('#btnClose2').addEventListener('click', e => {
    openMenu2 = false;
    toggleMenu();
});

// Funções para o segundo menu
function toggleMenu2() {
    const menu2 = document.querySelector('#menu2');
    if (openMenu2) {
        document.querySelector('#menu2').style.marginLeft = 0;
        return;
    } else {
        menu2.style.marginLeft = `-${menu2Size}`;
    }
    document.querySelector('#menu2').style.marginLeft = `-${menu2Size}`;
}


