 import swal from 'sweetalert';



const options = document.querySelectorAll('.city-option')

options.forEach(function(option, index) {
  option.addEventListener('click', function() {
    addSweetAlert(option)
  })
})

function addSweetAlert(option) {
  if (option.classList.contains('valid')) {
     swal({
        title: "Correct",
        text: "Well done!",
        icon: "success"
    }).then(function() {
    window.location = `cities?count=${Number(document.getElementById('count').innerHTML) + 1}`;
    })
  } else {
    swal({
      title: "Nope",
      text: "Didn't get it this time",
      icon: "error"
    })
  }
}
