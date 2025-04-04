function acceptRequest(id, name, admno, classVal, dept, reason, status) {
    console.log('Accepting request for:', id, name, admno, classVal, dept, reason, status);

    // Make an AJAX request to the server
    fetch('/update-status-fac', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            id: id,
            state: status
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        // Reload the page after successful update
        location.reload(true);
    })
    .catch((error) => {
        console.error('Error:', error);
        // Handle error
    });
}
