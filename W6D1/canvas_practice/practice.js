document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(110,300,300,100);

  ctx.beginPath();
  ctx.arc(100,100,100,100,2*Math.PI, true);
  ctx.fillStyle = "red";
  ctx.fill();
});
