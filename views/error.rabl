node(:status) { response.status }
node(:message) { @error.to_json.html_safe }