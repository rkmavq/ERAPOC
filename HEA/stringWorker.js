self.onmessage = function(event) {
  const hi = "Hii";
  self.postMessage({hi});
};
{/* <script>
  function handleTabChange() {
    // Get the selected tab value
    var selectedTab = document.getElementById('tab').value;

    // Create a new web worker
    var worker = new Worker('worker.js');

    // Attach an event listener to handle messages from the worker
    worker.addEventListener('message', function(event) {
      // Get the result from the worker
      var result = event.data;

      // Do something with the result (e.g., update UI)
      console.log(result);

      // Terminate the worker
      worker.terminate();
    });

    // Send the selected tab value to the worker
    worker.postMessage(selectedTab);
  }
</script> */}






