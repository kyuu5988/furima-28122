function del_check() {

  const delCheck = document.getElementById("del-check")
  const delYes = document.querySelector(".del-btn")
  const delNo = document.getElementById("del-no")

  delCheck.addEventListener('click', function() {
    delYes.setAttribute("style","display:block;");
    delNo.setAttribute("style","display:block;");
  })

  delNo.addEventListener('click', function() {
    delYes.removeAttribute("style","display:block;");
    delNo.removeAttribute("style","display:block;");
  })

}

window.addEventListener("load", del_check);