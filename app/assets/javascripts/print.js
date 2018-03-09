document.addEventListener("DOMContentLoaded", () => {
  const button = document.getElementById("button-print");
  if (button) {
    button.addEventListener("click", () => {
      window.print();
    });
  }
});
