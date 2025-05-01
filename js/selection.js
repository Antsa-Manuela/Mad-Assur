document.addEventListener('DOMContentLoaded', function() {
    // Initialisation
    const selection = new Set(
        document.body.dataset.comparaison?.split(',').filter(Boolean) || []
    );

    // Éléments DOM
    const contenu = document.getElementById('contenu');
    const compareButtons = document.querySelectorAll('.btn-compare');

    // Fonctions
    const showNotification = (message, isError = false) => {
        const notification = document.createElement('div');
        notification.className = `notification ${isError ? 'error' : 'success'}`;
        notification.textContent = message;
        document.body.appendChild(notification);

        setTimeout(() => {
            notification.style.opacity = '0';
            setTimeout(() => notification.remove(), 500);
        }, 2000);
    };

    const updateUI = () => {
        // Mise à jour des boutons
        compareButtons.forEach(btn => {
            const id = btn.dataset.id;
            if (!id) return;

            if (selection.has(id)) {
                btn.textContent = 'Retirer';
                btn.classList.add('selected');
                btn.closest('.block')?.classList.add('selected');
            } else {
                btn.textContent = 'Comparer';
                btn.classList.remove('selected');
                btn.closest('.block')?.classList.remove('selected');
            }
        });

        // Mise à jour du bouton d'action
        const actionButtons = document.querySelector('.action-buttons');
        if (selection.size > 0) {
            if (!actionButtons) {
                const div = document.createElement('div');
                div.className = 'action-buttons';
                div.innerHTML = `
                    <a href="home.php?page=comparaison" class="btn-action-link">
                        <button class="btn-action">Voir la comparaison (${selection.size})</button>
                    </a>
                    <button class="btn-action reset-link reset">Réinitialiser</button>
                `;
                contenu?.appendChild(div);
            } else {
                actionButtons.querySelector('.btn-action').textContent = 
                    `Voir la comparaison (${selection.size})`;
            }
        } else if (actionButtons) {
            actionButtons.remove();
        }
    };

    // Gestion des événements pour la comparaison
    compareButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const id = this.dataset.id;
            if (!id) return;

            if (selection.has(id)) {
                selection.delete(id);
                showNotification('Assurance retirée de la comparaison');
            } else {
                if (selection.size >= 3) {
                    showNotification('Maximum 3 assurances comparables', true);
                    return;
                }
                selection.add(id);
                showNotification('Assurance ajoutée à la comparaison');
            }

            // Mise à jour de l'interface
            updateUI();

            // Mise à jour côté serveur via fetch
            fetch(`home.php?compare=${id}`, { method: 'GET' })
                .catch(err => console.error('Erreur de synchronisation:', err));
        });
    });

    // Gestion des événements pour la réinitialisation
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('reset') || e.target.closest('.reset')) {
            e.preventDefault();
            const resetBtn = e.target.classList.contains('reset') ? e.target : e.target.closest('.reset');
            
            if (!confirm('Êtes-vous sûr de vouloir réinitialiser la comparaison ?')) {
                return;
            }

            fetch('home.php?reset=1', {
                method: 'GET',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showNotification(data.message);
                    selection.clear();
                    updateUI();
                    
                    // Redirection après un court délai pour laisser voir la notification
                    setTimeout(() => {
                        window.location.href = data.redirect || 'home.php';
                    }, 500);
                }
            })
            .catch(err => console.error('Erreur:', err));
        }
    });

    // Initialisation de l'interface
    updateUI();
});