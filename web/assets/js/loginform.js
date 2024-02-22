document.getElementById("mostrar-formulario").addEventListener("click", function() {
    document.getElementById("formulario-container").style.display = "flex";
});

document.getElementById("fechar-formulario").addEventListener("click", function() {
    document.getElementById("formulario-container").style.display = "none";
});

document.getElementById("formulario-container").addEventListener("click", function(event) {
    if (event.target === this) {
        this.style.display = "none";
    }
});
