window.onload = function () {
	

//L.tileLayer('http://tile.stamen.com/terrain/{z}/{x}/{y}.jpg').addTo(map);

var Stamen_TonerBackground = L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/toner-background/{z}/{x}/{y}.{ext}', {
	attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
	subdomains: 'abcd',
	minZoom: 0,
	maxZoom: 20,
	ext: 'png'
});

var map = L.map('map',{layers : Stamen_TonerBackground}).setView([20.858376, 5.294442],2);

}



