import EmberRouter from '@ember/routing/router';

import config from 'my-fancy-app/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('films');
  this.route('people');
  this.route('planets');
  this.route('species');
  this.route('starships');
  this.route('vehicles');
  // By not nesting, we can visit a 'film'
  // directly without waiting for the 'films' data.
  this.route('film', { path: 'films/:id' });
  this.route('person', { path: 'people/:id' });
  this.route('planet', { path: 'planets/:id' });
  this.route('specie', { path: 'species/:id' }); // NOTE: specie is not a word
  this.route('starship', { path: 'starships/:id' });
  this.route('vehicle', { path: 'vehicles/:id' });
});
