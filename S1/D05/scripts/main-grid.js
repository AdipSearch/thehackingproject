window.onload = draw();

function draw()
{	
	var myText=prompt('Entre un numéro ma Biche');
	localStorage.setItem('number', myText);

	var canvas = document.getElementById("canvaso");
	canvas.style.display =  'flex';
	var ctx = canvas.getContext("2d");

	ctx.strokeStyle ="black";
	ctx.lineWidth = 4;

	for (i=0; i<=600; i=i+600/myText)
	{
		ctx.moveTo(i,0);
		ctx.lineTo(i,600);
		ctx.stroke();
	}

	for (j=0; j<=600; j=j+600/myText)
	{
		ctx.moveTo(0,j);
		ctx.lineTo(600,j);
		ctx.stroke();
	}

}