document.addEventListener("turbolinks:load", function() {
  let lineCtx = document.getElementById("lineChart");
  if (!lineCtx) return;

  let xDates = JSON.parse(lineCtx.dataset.xdates);
  let yDates = JSON.parse(lineCtx.dataset.ydates);

  if (window.lineChartInstance) {
    window.lineChartInstance.destroy();
  }

  let lineConfig = {
    type: 'line',
    data: {
      labels: xDates,
      datasets: [{
        label: '進捗率',
        data: yDates,
        borderColor: '#f88',
      }],
    },
    options: {
      scales: {
        y: {
          suggestedMin: 0,
          suggestedMax: 100,
          ticks: {
            stepSize: 10,
          }
        }
      },
    },
  };

  window.lineChartInstance = new Chart(lineCtx, lineConfig);
});
