import EmberRouter from '@ember/routing/router';

import config from 'my-fancy-app/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('films');
  // By not nesting, we can visit a 'film'
  // directly without waiting for the 'films' data.
  this.route('film', { path: 'films/:id' });
});
