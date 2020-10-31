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
          theta: wheel_model.labels.concat([wheel_model.labels[0]]),
          r: Array(wheel_model.labels.length + 1).fill(wheel_model.maximum),
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

  document.querySelectorAll(".wheel-value-graph").forEach(div => {
    console.log("Render Wheel Value Graph")
    $.ajax({
      type: 'GET',
      url: `/users/${div.dataset.userId}/wheel_values/${div.dataset.wheelValueId}.json`,
      success: function (wheels) {
        var wheel_value = wheels[0]
        var wheel_model = wheels[1]

        var data = [{
          type: 'scatterpolar',
          theta: wheel_model.labels.concat([wheel_model.labels[0]]),
          r: wheel_value.goal_values.concat([wheel_value.goal_values[0]]),
          fill: 'toself',
          name: 'Objectif'
        }, {
          type: 'scatterpolar',
          theta: wheel_model.labels.concat([wheel_model.labels[0]]),
          r: wheel_value.current_values.concat([wheel_value.current_values[0]]),
          fill: 'toself',
          name: 'Actuel'
        }]

        var layout = {
          polar: {
            radialaxis: {
              visible: true,
              range: [0, wheel_model.maximum]
            }
          },
          showlegend: true
        }

        Plotly.newPlot(div, data, layout)
      }
    });
  })


})