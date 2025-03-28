// JavaScript for toggling the navbar menu
const navbarToggler = document.getElementById('navbar-toggler');
const navbarLinks = document.getElementById('navbar-links');

navbarToggler.addEventListener('click', () => {
  navbarLinks.classList.toggle('open');
});
