export var clearPetPopup = function() {
    $('#popup-pet-country').removeClass(sessionStorage.getItem('flag'));
    $('#popup-pet-photo').prop('src', '')
    document.getElementById('popup-pet-race').innerHTML = ''
    document.getElementById('popup-pet-birth').innerHTML = ''
    document.getElementById('popup-pet-death').innerHTML = ''
}