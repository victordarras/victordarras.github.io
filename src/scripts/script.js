// console.log('Hello there fellow developer,\nnice to see you.\nkonami code, anyone ?')

// Konami
const konami = [ 38, 38, 40, 40, 37, 39, 37, 39, 66, 65 ];
var keys = [];
document.addEventListener('keydown', function(e) {
  if( e.keyCode === konami[keys.length] ) {
    keys.push(e.keyCode);
  } else {
    keys = []
  }
  if (keys.length === 10 ) {
    document.documentElement.classList.add("konami");
    keys = []
    console.log("Noice, here's a bonus link : https://youtu.be/dQw4w9WgXcQ")
  }
})

// Mailer
Array.from(document.querySelectorAll('.mailto')).forEach(function(link) {
  link.addEventListener('click', function (e) {
    e.preventDefault();
    console.log("check")
    var mailLink = document.createElement('a');
    mailLink.href='mailto:victor.darras'+"+s@"+'gmail.com';
    document.body.appendChild(mailLink);
    mailLink.click();
  })
})


// Array.from(document.querySelectorAll('.star')).forEach(function(star) {
//   star.addEventListener('click', function(e) {
//     e.target.classList.add('dissapearing');
//     setTimeout(function(){
//       e.target.style.display = "none";
//     }, 1000)
//   })
// });
