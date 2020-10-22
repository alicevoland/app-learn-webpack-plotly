import 'jquery'
import 'popper.js'
import 'bootstrap'


var Plotly = require('plotly.js');
console.log(Plotly.BUILD);
var TESTER = document.getElementById('tester');
Plotly.plot(TESTER, [{
  x: [1, 2, 3, 4, 5],
  y: [1, 2, 4, 8, 16]
}], {
  margin: { t: 0 }
}, { showSendToCloud: true });
