function jibaku(){
	var buf = "";
	var html = document.body.innerHTML;
	while(html.length){
		var n = Math.floor(Math.random() * html.length);
		var r = Math.floor(Math.random() * 16);
		buf += html.substr(n,1);
		html = html.substr(0,n) + html.substr(n + 1);
		if(!Math.floor(Math.random() * 10))
			buf += "<br>";
		for(var i = 0; i < r; i++)
			buf += "&nbsp;";
	}
	document.body.innerHTML = buf;
}
