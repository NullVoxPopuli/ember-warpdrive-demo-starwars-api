import RequestManager from '@ember-data/request';
import Fetch from '@ember-data/request/fetch';

const SWAPI = {
  async request(context) {
    let { url, signal } = context.request;
    const response = await fetch(`https://swapi.dev/api/${url}`, {
      signal,
    });

    context.setResponse(response);
    context.setStream(response.clone().body);

    return response.json();
  }
}

export default class extends RequestManager {
  constructor(args) {
    super(args);
    // TODO: cache handler?
    this.use([SWAPI]);
  }
}
