window.onload = draw();

/*function prompt()
{
	var myText=prompt('Entre un numéro ma Biche');

	/*function draw(myText);*/

//}

var myText=prompt('Entre un numéro ma Biche');

function draw()
{	

	var canvas = document.getElementById("canvaso");
	var ctx = canvas.getContext("2d");

	ctx.strokeStyle ="black";
	ctx.lineWidth = 4;

	for (i=0; i<=600; i=i+60)
	{
		ctx.moveTo(i,0);
		ctx.lineTo(i,600);
		ctx.stroke();
	}

	for (j=0; j<=600; j=j+60)
	{
		ctx.moveTo(0,j);
		ctx.lineTo(600,j);
		ctx.stroke();
	}

}
/*
window.onload = canvas;
 
function canvas()
{
	var myCanvas = document.getElementById("myCanvas");
 
	if( myCanvas && myCanvas.getContext("2d") ) 
	{
		var context = myCanvas.getContext("2d");
		context.lineWidth   = 2;
		context.strokeStyle = "red";
		context.strokeRect(10, 10, 100, 100);
 
		context.fillStyle = "blue";
		context.fillRect(10, 10, 100, 100);		
	}
}*/