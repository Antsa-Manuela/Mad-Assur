document.addEventListener('DOMContentLoaded', function() {
    // Fonction pour afficher une alerte
    function showAlert(message) {
        let alertDiv = document.createElement('div');
        alertDiv.className = 'alert-success';
        alertDiv.innerText = message;
        document.body.appendChild(alertDiv);

        setTimeout(function() {
            alertDiv.style.opacity = '0';
            setTimeout(function() {
                alertDiv.remove();
            }, 500);
        }, 2000);
    }

    // Quand on clique sur "Comparer"
    const compareButtons = document.querySelectorAll('.btn-compare');

    compareButtons.forEach(function(button) {
        button.addEventListener('click', function(e) {
            showAlert('Ajouté à la sélection ! ✅');
        });
    });
});
