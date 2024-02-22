'use strict'

const menu2Size = '250px';
let openMenu2 = true;


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
    document.querySelector('#menu2').style.display = 'block';
}

function validaForm(){
    var login = document.form_login.login.value;
    var senha = document.form_login.senha.value;
    
    if (!login) {
        alert("O Campo login deve ser preenchido!!");
        form_login.login.focus();
        return false;
    }
    if (!senha) {
        alert("O Campo senha deve ser preenchido!!");
        form_login.senha.focus();
        return false;
    }    

}

function validaFormCadastroU(){
    var nome = document.form_usuario.nome.value;
    var login = document.form_usuario.login.value;
    var senha = document.form_usuario.senha.value;
    var telefone = document.form_usuario.telefone.value;
    var cpf = document.form_usuario.cpf.value;
    var email = document.form_usuario.email.value; 
    if (!nome) {
        alert("O Campo nome deve ser preenchido!!");
        form_usuario.nome.focus();
        return false;
    }
    if (!login) {
        alert("O Campo login deve ser preenchido!!");
        form_usuario.login.focus();
        return false;
    }    
    if (!senha) {
        alert("O Campo senha deve ser preenchido!!");
        form_usuario.senha.focus();
        return false;
    } 

    if (!telefone) {
        alert("O Campo telefone deve ser preenchido!!");
        form_usuario.senha.focus();
        return false;
    }
    if (!cpf) {
        alert("O Campo Cpf deve ser preenchido!!");
        form_usuario.cpf.focus();
        return false;
    }
    if (!email) {
        alert("O Campo email deve ser preenchido!!");
        form_usuario.email.focus();
        return false;
    }    
    // Outras validações e ações aqui, se necessário.
    return true;    
}
function validaFormCadastroF(){
    var nome = document.form_flyer.nome.value;
    var tipo = document.form_flyer.tipo.value;
    var imagem = document.form_flyer.imagem.value; 
    var arquivo = document.form_flyer.arquivo.value;      
    if (!nome) {
        alert("O Campo nome deve ser preenchido!!");
        form_flyer.nome.focus();
        return false;
    }
    if (!tipo) {
        alert("O Campo tipo deve ser marcado!!");
        form_usuario.login.focus();
        return false;
    }     
    if (!imagem) {
        alert("Uma imagem deve ser adicionada!!");
        form_flyer.imagem.focus();
        return false;
    } 

    if (!arquivo) {
        alert("O Campo arquivo deve ser preenchido!!");
        form_flyer.arquivo.focus();
        return false;
    }
  
    // Outras validações e ações aqui, se necessário.
    return true;    
}
document.getElementById('voltar').addEventListener('click', function() {
    window.location.href = document.referrer;
});
window.addEventListener('load', () => {

    toggleMenu2();
    
});



