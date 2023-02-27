import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  connect() {
    console.log(this.element);
  }

  toggle(e) {
      const id = e.target.dataset.id
      const completed_at = e.target.checked ? e.target.dataset.completedAt : 'Uncompleted'
      const data = e.target.dataset
      console.log(data);
      console.log(id);
      console.log(completed_at);
      const csrfToken = document.querySelector("[name='csrf-token']").content

      fetch(`/tasks/${id}/toggle`, {
          method: 'POST', // *GET, POST, PUT, DELETE, etc.
          mode: 'cors', // no-cors, *cors, same-origin
          cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
          credentials: 'same-origin', // include, *same-origin, omit
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken
          },
          body: JSON.stringify({ completed: e.target.checked, completed_at: completed_at }) // body data type must match "Content-Type" header
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message)
            location.reload();
        }
          )
        }
      }