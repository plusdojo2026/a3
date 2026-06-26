

  const sidebarToggle = document.getElementById("sidebarToggle");

  if (localStorage.getItem("sidebar") === "collapsed") {
    document.body.classList.add("sidebar-collapsed");
  }

  if (sidebarToggle) {
    sidebarToggle.addEventListener("click", function () {
      document.body.classList.toggle("sidebar-collapsed");

      if (document.body.classList.contains("sidebar-collapsed")) {
        localStorage.setItem("sidebar", "collapsed");
      } else {
        localStorage.setItem("sidebar", "open");
      }
    });
  }
