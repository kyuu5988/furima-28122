function del_check() {
  console.log('del_check.js発動中');//動作ck用

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