
document.getElementById("excluirContaLink").addEventListener("click", function (e) {
    e.preventDefault();
    // Exibir a caixa de diálogo ao clicar no link
    document.getElementById("passwordDialog").style.display = "block";
});

// Fechar a caixa de diálogo ao clicar no botão "Fechar" (X)
document.getElementById("passwordDialogClose").addEventListener("click", function () {
    document.getElementById("passwordDialog").style.display = "none";
});

// Tratar a ação de confirmação da senha
document.getElementById("passwordSubmitButton").addEventListener("click", function () {
    const senha = document.getElementById("passwordInput").value;
    const senhaDoServidor = document.getElementById("excluirContaLink").getAttribute("data-senha")
    const id = document.getElementById("excluirContaLink").getAttribute("data-id");

    if (senha === senhaDoServidor) {
        // Senha correta, redirecione para a página de exclusão
        window.location.href = "excluir_usuario.do?id="+id;
    } else {
        // Senha incorreta, exiba uma mensagem de erro
        alert("Senha incorreta. A conta não será excluída.");
    }

    // Fechar a caixa de diálogo após a ação
    document.getElementById("passwordDialog").style.display = "none";
});