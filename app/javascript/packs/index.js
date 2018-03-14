import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.getElementById('sweet-alert-demo').addEventListener('click', () => {
    swal({
      title: "Correct",
      text: "Well done!",
      icon: "success"
    })
  });
}

bindSweetAlertButtonDemo()

function bindSweetAlertButtonDemo2() {
  document.getElementById('sweet-alert-demo2').addEventListener('click', () => {
    swal({
      title: "Nope",
      text: "Didn't get it this time",
      icon: "error"
    })
  });
}

bindSweetAlertButtonDemo2()

function bindSweetAlertButtonDemo3() {
  document.getElementById('sweet-alert-demo3').addEventListener('click', () => {
    swal({
      title: "Nope",
      text: "Didn't get it this time",
      icon: "error"
    })
  });
}

bindSweetAlertButtonDemo3()
