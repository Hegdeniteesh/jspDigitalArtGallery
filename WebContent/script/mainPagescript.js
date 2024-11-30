// functions to redirect to category page
function enterAes() {
   location.href="http://localhost/mp/pages/aesthetic.jsp";
}
function enterAbs() {
   location.href="http://localhost/mp/pages/abstract.jsp";
}
function enterCha() {
   location.href="http://localhost/mp/pages/character.jsp";
}
function enterFan() {
   location.href="http://localhost/mp/pages/fantasy.jsp";
}
function enterSci() {
   location.href="http://localhost/mp/pages/scifi.jsp";
}
function enterVis() {
   location.href="http://localhost/mp/pages/visualfx.jsp";
}
function signup() {
    location.href="http://localhost/mp/pages/index.jsp";
}
// opens or closes the hamburger button
function openHam() {
    var bHam;
    bHam=document.getElementById('navBack');
    if(bHam.style.display=='none') {
        bHam.style.display='block';
    } else {
        closeHam();
    }
}
function closeHam() {
    var bHam=document.getElementById('navBack');
    bHam.style.display='none';
}
function thanks() {
    location.href="http://localhost/mp/pages/thanks.jsp";
}
function rightClickPrevent() {
    document.addEventListener('contextmenu', function(event) {
        event.preventDefault();
    });
}
rightClickPrevent();
