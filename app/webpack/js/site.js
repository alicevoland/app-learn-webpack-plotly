import 'jquery'
import 'popper.js'
import 'bootstrap'
import 'plotly.js'

global.Plotly = Plotly

$(function () {
  console.log("Document Ready!")
  document.querySelectorAll(".wheel-model-graph").forEach(div => {
    console.log("Render Wheel Model Graph")
    $.ajax({
      type: 'GET',
      url: `/wheel_models/${div.dataset.wheelModelId}.json`,
      success: function (wheel_model) {

        var data = [{
          type: 'scatterpolar',
          theta: wheel_model.labels,
          r: Array(wheel_model.labels.length).fill(wheel_model.maximum),
          fill: 'toself'
        }]

        var layout = {
          polar: {
            radialaxis: {
              visible: true,
              range: [0, wheel_model.maximum]
            }
          },
          showlegend: false
        }

        Plotly.newPlot(div, data, layout)
      }
    });

  })


})